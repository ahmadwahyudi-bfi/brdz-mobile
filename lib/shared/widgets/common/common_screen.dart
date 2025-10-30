import 'dart:async';
import 'dart:io';

import 'package:brdz_test/core/config/network/exceptions.dart';
import 'package:brdz_test/core/localizations/ui_text.dart';
import 'package:brdz_test/shared/widgets/common/common_controller.dart';
import 'package:brdz_test/shared/widgets/custom_snack_bar.dart';
import 'package:brdz_test/shared/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Handle common features like loading overlay, showing dialog,
/// showing snackbar
class CommonScreen extends ConsumerWidget {
  const CommonScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenError(context, ref);

    return LoadingOverlay(
      uiState: ref.watch(
        CommonController.provider.select((state) => state.overlayUiState),
      ),
      child: child,
    );
  }

  void _listenError(BuildContext context, WidgetRef ref) {
    ref.listen(CommonController.provider.select((state) => state.error), (
      previous,
      error,
    ) {
      final errorAction = ref.read(
        CommonController.provider.select((state) => state.errorAction),
      );
      final shouldRetry = errorAction != null;
      void onAction() {
        if (errorAction != null) {
          errorAction.call();
          ref.read(CommonController.provider.notifier).resetErrorAction();
        }
      }

      if (error != null && ModalRoute.of(context)?.isCurrent == true) {
        switch (error.runtimeType) {
          case SocketException:
            _showNetworkErrorMessage(context, onAction, shouldRetry);
            break;
          case SessionExpiredException:
            //Not show anything, already handled in login screen
            break;
          case TimeoutException:
          case ConnectionTimeoutException:
          default:
            _showGeneralErrorMessage(context, onAction, shouldRetry);
            break;
        }
      }
    });
  }

  void _showGeneralErrorMessage(
    BuildContext context,
    VoidCallback errorAction,
    bool shouldRetry,
  ) {
    showCustomSnackBar(
      context,
      CustomSnackBar(
        message: context.localizations.error,
        action: Text(
          shouldRetry
              ? context.localizations.tryAgain
              : context.localizations.ok,
        ),
        type: CustomSnackBarType.negative,
        onAction: errorAction,
      ),
    );
  }

  void _showNetworkErrorMessage(
    BuildContext context,
    VoidCallback errorAction,
    bool shouldRetry,
  ) {
    showCustomSnackBar(
      context,
      CustomSnackBar(
        leading: const IconData(0xe907),
        message: context.localizations.networkError,
        action: Text(
          shouldRetry
              ? context.localizations.tryAgain
              : context.localizations.ok,
        ),
        type: CustomSnackBarType.negative,
        onAction: errorAction,
      ),
    );
  }
}
