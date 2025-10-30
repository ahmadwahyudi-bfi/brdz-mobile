import 'dart:math' as math;

import 'package:flutter/material.dart';

class CenterFloatingButton extends StatelessWidget {
  const CenterFloatingButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Material(
        color: Colors.white.withOpacity(0),
        child: Transform.translate(
          offset: const Offset(0, -4),
          child: Transform.rotate(
            angle: -math.pi / 4,
            child: SizedBox(
              width: 58,
              height: 58,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: 'main-fab',
                  onPressed: onPressed,
                  disabledElevation: 0,
                  elevation: 2,
                  focusElevation: 0,
                  hoverElevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.qr_code, color: Colors.white,)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
