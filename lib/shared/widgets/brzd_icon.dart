import 'package:flutter/material.dart';

class BrzdIcon extends StatelessWidget {
  const BrzdIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Container(
        width: 64,
        height: 64,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Text(
            'B',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
