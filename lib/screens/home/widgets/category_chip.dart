import 'package:flutter/material.dart';
import '../../../theme/app_typography.dart';

class CategoryChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryChipWidget({super.key, required this.label, this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: isSelected ? AppTypography.titleSmall : AppTypography.titleSmall.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
