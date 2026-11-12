import 'package:flutter/material.dart';

class Smallbtn extends StatelessWidget {
  final Color colorBack;
  final Color colorIcon;
  final IconData icon;
  final VoidCallback onPressed;

  const Smallbtn({
    super.key,
    required this.colorBack,
    required this.colorIcon,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorBack,
          foregroundColor: colorIcon,
          padding: EdgeInsets.zero,
          minimumSize: const Size(50, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Icon(icon, color: colorIcon),
      ),
    );
  }
}