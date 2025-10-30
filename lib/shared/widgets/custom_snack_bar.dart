import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar({
    this.leading,
    required this.message,
    this.action,
    this.type = CustomSnackBarType.neutral,
    this.onAction,
    this.onClosed,
  });

  final IconData? leading;

  final String message;

  final Widget? action;

  final CustomSnackBarType type;

  final VoidCallback? onAction;

  final void Function(SnackBarClosedReason reason)? onClosed;
}

enum CustomSnackBarType {
  neutral(
    backgroundColor: Colors.black,
    actionColor: Colors.black12,
    textColor: Colors.white,
  ),
  positive(
    backgroundColor: Colors.green,
    actionColor: Colors.greenAccent,
    textColor: Colors.white,
  ),
  warning(
    backgroundColor: Colors.yellow,
    actionColor: Colors.yellowAccent,
    textColor: Colors.black12,
  ),
  negative(
    backgroundColor: Colors.red,
    actionColor: Colors.red,
    textColor: Colors.white,
  );

  const CustomSnackBarType({
    required this.backgroundColor,
    required this.actionColor,
    required this.textColor,
  });

  final Color backgroundColor;

  final Color actionColor;

  final Color textColor;
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnackBar(
    BuildContext context,
    CustomSnackBar data,
    ) {
  final controller = ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: data.type.backgroundColor,
      margin: const EdgeInsets.all(8),
      padding: _padding(data),
      behavior: SnackBarBehavior.floating,
      content: IconTheme(
        data: _iconTheme(context),
        child: Row(
          children: [
            if (data.leading != null) ...[
              _leading(data),
              const SizedBox(width: 16),
            ],
            Expanded(child: _content(context, data)),
            if (data.action != null) ...[
              const SizedBox(width: 16),
              _action(context, data),
            ],
          ],
        ),
      ),
    ),
  )..closed.then((reason) => data.onClosed?.call(reason));

  return controller;
}

IconThemeData _iconTheme(BuildContext context) {
  return IconTheme.of(context)
      .merge(const IconThemeData(color: Colors.white, size: 24));
}

EdgeInsets _padding(CustomSnackBar data) {
  return EdgeInsets.only(
    left: 16,
    top: 16,
    right: data.action != null ? 8 : 16,
    bottom: 16,
  );
}

Widget _leading(CustomSnackBar data) {
  return Icon(
    data.leading,
  );
}

Widget _content(BuildContext context, CustomSnackBar data) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        data.message,
      ),
    ],
  );
}

Widget _action(BuildContext context, CustomSnackBar data) {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar(
        reason: SnackBarClosedReason.action,
      );
      data.onAction?.call();
    },
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: data.action,
    ),
  );
}
