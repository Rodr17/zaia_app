import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/news_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_constants.dart';

class TrendingNewsCard extends StatelessWidget {
  final NewsModel news;
  final VoidCallback? onTap;

  const TrendingNewsCard({super.key, required this.news, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppBorderRadius.lg),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(AppBorderRadius.lg)),
              child: Image.network(
                news.imageUrl,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80.w,
                    height: 80.h,
                    color: AppColors.grey200,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Category
                    Text(
                      news.category,
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w100, color: AppColors.textSecondary),
                    ),
                    // Title
                    Expanded(
                      child: Text(
                        news.title,
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, height: 1.2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Date
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        news.date,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w200,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
