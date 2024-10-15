import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
final Color color;
  const CustomFloatingActionButton({required this.onPressed, super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: color,
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_forward_ios,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
