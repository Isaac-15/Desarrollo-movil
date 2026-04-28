import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null, // Evita errores de animación con múltiples FABs
      backgroundColor: color,
      foregroundColor: Colors.white,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}