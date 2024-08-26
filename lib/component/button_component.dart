import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final Function()? onTap;
  final String nameBtn;
  const ButtonComponent({
    super.key,
    required this.onTap,
    required this.nameBtn,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: onTap != null ? const Color(0xFF0493AE) : Colors.grey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: onTap != null
              ? [
                  const BoxShadow(
                      color: Colors.black26, blurRadius: 10, spreadRadius: 2)
                ]
              : [],
        ),
        child: Center(
          child: Text(
            nameBtn,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 4,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
