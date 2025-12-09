import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/local_icon.dart';
import '../../../widgets/cached_image.dart';
import '../../../theme/app_typography.dart';

class TrendingCategory extends StatelessWidget {
  final String name;
  final int newsCount;
  final Color color;
  final String urlImage;
  final VoidCallback? onTap;

  const TrendingCategory({
    super.key,
    required this.name,
    required this.newsCount,
    required this.color,
    required this.urlImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 218.w,
        height: 80.h,
        decoration: BoxDecoration(color: AppColors.grey200, borderRadius: BorderRadius.circular(40.r)),
        child: Stack(
          children: [
            // Avatar Circle
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [color.withValues(alpha: 0.8), color],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: DecorationImage(fit: BoxFit.cover, image: CachedImageProvider(urlImage)),
                ),
              ),
            ),

            // Text Content
            Positioned(
              left: 93,
              top: 15,
              right: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTypography.titleMedium.copyWith(letterSpacing: 0.64, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      LocalIcon(icon: 'iconamoon:news-thin', color: AppColors.grey800, size: 26.sp),
                      SizedBox(width: 4.w),
                      Text('$newsCount noticias', style: AppTypography.bodyLarge),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
