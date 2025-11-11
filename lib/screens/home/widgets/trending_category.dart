import 'package:flutter/material.dart';
import 'package:iconify_design/iconify_design.dart';
import '../../../theme/app_colors.dart';
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
        width: 218,
        height: 80,
        decoration: BoxDecoration(color: AppColors.grey200, borderRadius: BorderRadius.circular(40)),
        child: Stack(
          children: [
            // Avatar Circle
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [color.withValues(alpha: 0.8), color],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(urlImage)),
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
                  Text(name, style: AppTypography.titleMedium.copyWith(letterSpacing: 0.64, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      IconifyIcon(icon: 'iconamoon:news-thin', color: AppColors.grey800, size: 26),
                      const SizedBox(width: 4),
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
