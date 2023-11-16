import 'package:flutter/material.dart';

import '../constants/colors.dart';

class GigaButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final double? height, width;

  const GigaButton({super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.gigaOrange,
    this.height = 50,
    this.width = 250,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(width??250, height??50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}