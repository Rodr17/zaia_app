import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/app_typography.dart';
import '../../../theme/app_constants.dart';
import '../../../widgets/cached_image.dart';

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.lg),
        image: DecorationImage(
          image: CachedImageProvider('https://images.unsplash.com/photo-1515377905703-c4788e51af15?w=800'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.lg),
          gradient: LinearGradient(
            colors: [const Color(0xFF726D2D).withValues(alpha: 0.3), const Color(0xFF726D2D).withValues(alpha: 0.5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(AppSpacing.mdW),
        alignment: Alignment.topLeft,
        child: Text(
          '¿Estás listo para nuestros\nnuevos productos?',
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 20.sp,
            letterSpacing: 2.0,
            height: 1,
          ),
        ),
      ),
    );
  }
}
