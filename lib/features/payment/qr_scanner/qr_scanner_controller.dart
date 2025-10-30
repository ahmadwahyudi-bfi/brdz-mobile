import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'qr_scanner_controller.freezed.dart';

class QrScannerController extends StateNotifier<QrScannerState> {
  QrScannerController() : super(const QrScannerState());

  static final provider =
  StateNotifierProvider.autoDispose<QrScannerController, QrScannerState>(
        (ref) => QrScannerController(),
  );

  Future<void> toggleTorch(MobileScannerController controller) async {
    await controller.toggleTorch();
    state = state.copyWith(torchOn: !state.torchOn);
  }

  Future<void> switchCamera(MobileScannerController controller) async {
    await controller.switchCamera();
    state = state.copyWith(
      facing: state.facing == CameraFacing.back
          ? CameraFacing.front
          : CameraFacing.back,
    );
  }

  Future<void> start(MobileScannerController controller) => controller.start();
  Future<void> stop(MobileScannerController controller) => controller.stop();

  String? onDetect(BarcodeCapture capture) {
    if (state.handled) return null;
    final raw = capture.barcodes.isNotEmpty ? capture.barcodes.first.rawValue : null;
    if (raw == null || raw.isEmpty) return null;

    state = state.copyWith(handled: true);
    return raw;
  }

  void resetHandled() => state = state.copyWith(handled: false);
}

@freezed
class QrScannerState with _$QrScannerState {
  const factory QrScannerState({
    @Default(false) bool torchOn,
    @Default(CameraFacing.back) CameraFacing facing,
    @Default(false) bool handled,
  }) = _QrScannerState;
}
