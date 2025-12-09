import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaia_app/theme/app_constants.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/cached_image.dart';
import '../../../theme/app_typography.dart';

class InspirationCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final VoidCallback? onTap;
  final String? heroTag;

  const InspirationCard({super.key, required this.imageUrl, required this.text, this.onTap, this.heroTag});

  @override
  Widget build(BuildContext context) {
    final cardContent = Container(
      width: 200.w,
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: CachedImage(
              imageUrl: imageUrl,
              width: 200.w,
              height: 300.h,
              fit: BoxFit.cover,
              errorWidget: Container(
                color: AppColors.grey300,
                child: Center(
                  child: Icon(Icons.image, size: 48.r, color: AppColors.grey500),
                ),
              ),
            ),
          ),

          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withValues(alpha: 0.3), Colors.black.withValues(alpha: 0.6)],
                stops: const [0.4, 0.7, 1.0],
              ),
            ),
          ),

          // Text Container
          Positioned(
            left: 10,
            right: 10,
            bottom: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.w, sigmaY: 15.h),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.mdW, vertical: AppSpacing.smH),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1.w),
                  ),
                  child: Text(
                    text,
                    style: AppTypography.bodySmall.copyWith(
                      color: Colors.white,
                      fontSize: 12.sp,
                      height: 1.4,
                      letterSpacing: 0.48,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: heroTag != null ? Hero(tag: heroTag!, child: cardContent) : cardContent,
    );
  }
}
