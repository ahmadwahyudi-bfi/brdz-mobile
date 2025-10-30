import 'package:flutter/material.dart';

const _dialogSize = 80.0;
const _dialogElevation = 15.0;

enum LoadingOverlayUiState {
  hidden,
  loading,
  success,
  error,
}

class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({
    super.key,
    required this.uiState,
    required this.child,
  });

  final LoadingOverlayUiState uiState;

  final Widget child;

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  final _childKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final child = KeyedSubtree(key: _childKey, child: widget.child);
    if (widget.uiState == LoadingOverlayUiState.loading ||
        widget.uiState == LoadingOverlayUiState.success ||
        widget.uiState == LoadingOverlayUiState.error) {
      return PopScope(
        canPop: false,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(child: child),
              ],
            ),
            ModalBarrier(
              color: Colors.black.withOpacity(0.7),
              dismissible: false,
            ),
            _dialog(),
          ],
        ),
      );
    } else {
      return child;
    }
  }

  Widget _dialog() {
    return Center(
      child: Material(
        color: Colors.white,
        elevation: _dialogElevation,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: _dialogSize,
          height: _dialogSize,
          child: Center(
            child: _dialogContent(),
          ),
        ),
      ),
    );
  }

  Widget _dialogContent() {
    switch (widget.uiState) {
      case LoadingOverlayUiState.hidden:
        return const SizedBox.shrink();
      case LoadingOverlayUiState.loading:
        return const CircularProgressIndicator();
      case LoadingOverlayUiState.success:
        return const Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 48,
        );
      case LoadingOverlayUiState.error:
        return const Icon(
          Icons.error,
          color: Colors.red,
          size: 48,
        );
    }
  }
}
