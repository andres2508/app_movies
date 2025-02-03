import 'package:app_movies/styles/color.styles.dart';
import 'package:app_movies/styles/text.styles.dart';
import 'package:flutter/material.dart';

class LabelChip extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;

  const LabelChip({required this.label, this.color, this.textColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: color ?? ColorStyles.dark300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: textColor ?? ColorStyles.secondary500,
            fontWeight: FontWeight.w500,
            fontSize: TextStyles.minimalSize),
      ),
    );
  }
}
