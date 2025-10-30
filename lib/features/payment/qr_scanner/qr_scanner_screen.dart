import 'package:brdz_test/core/localizations/ui_text.dart';
import 'package:brdz_test/features/payment/qr_scanner/qr_scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends ConsumerStatefulWidget {
  const QrScannerScreen({super.key});

  @override
  ConsumerState<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends ConsumerState<QrScannerScreen>
    with WidgetsBindingObserver {
  final MobileScannerController _camera = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
    torchEnabled: false,
    returnImage: false,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _camera.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final ctrl = ref.read(QrScannerController.provider.notifier);
    if (state == AppLifecycleState.paused) {
      ctrl.stop(_camera);
    } else if (state == AppLifecycleState.resumed) {
      ctrl.start(_camera);
    }
  }

  Future<void> _onDetect(BarcodeCapture c) async {
    final ctrl = ref.read(QrScannerController.provider.notifier);
    final raw = ctrl.onDetect(c);
    if (raw == null) return;

    await ctrl.stop(_camera);
    if (!mounted) return;
    Navigator.of(context).pop(raw);
  }

  Future<void> _toggleTorch() =>
      ref.read(QrScannerController.provider.notifier).toggleTorch(_camera);

  Future<void> _switchCamera() =>
      ref.read(QrScannerController.provider.notifier).switchCamera(_camera);

  Widget _overlay() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        final cut = w * 0.70;
        final top = (h - cut) / 3;

        return Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.55),
                BlendMode.srcOut,
              ),
              child: Stack(
                children: [
                  Container(
                    width: w,
                    height: h,
                    color: Colors.black.withOpacity(0.55),
                  ),
                  Positioned(
                    left: (w - cut) / 2,
                    top: top,
                    child: Container(
                      width: cut,
                      height: cut,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: (w - cut) / 2,
              top: top,
              child: Container(
                width: cut,
                height: cut,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: top - 36,
              child: Center(
                child: Text(
                  context.localizations.qrHint,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _controls(QrScannerState s) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.close),
              tooltip: context.localizations.close,
            ),
            const Spacer(),
            IconButton(
              onPressed: _toggleTorch,
              style: IconButton.styleFrom(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.white,
              ),
              icon: Icon(s.torchOn ? Icons.flash_on : Icons.flash_off),
              tooltip: context.localizations.torch,
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: _switchCamera,
              style: IconButton.styleFrom(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.cameraswitch),
              tooltip: s.facing == CameraFacing.back
                  ? context.localizations.cameraFront
                  : context.localizations.cameraBack,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(QrScannerController.provider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            controller: _camera,
            onDetect: _onDetect,
            errorBuilder: (context, error) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  context.localizations.cameraError(error.toString()),
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          _overlay(),
          Align(alignment: Alignment.topCenter, child: _controls(state)),
        ],
      ),
    );
  }
}
