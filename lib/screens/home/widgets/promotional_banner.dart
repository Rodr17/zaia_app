import 'package:flutter/material.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/app_constants.dart';

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=800'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [const Color(0xFF726D2D).withValues(alpha: 0.3), const Color(0xFF726D2D).withValues(alpha: 0.5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(AppSpacing.md),
        alignment: Alignment.topLeft,
        child: Text(
          '¿Estás listo para nuestros\nnuevos productos?',
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 2.0,
            height: 1,
          ),
        ),
      ),
    );
  }
}
