import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_design/iconify_design.dart';
import '../../../models/news_model.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_constants.dart';

class FeaturedNewsCard extends StatelessWidget {
  final NewsModel news;
  final VoidCallback? onTap;

  const FeaturedNewsCard({super.key, required this.news, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200.w,
        height: 180.h,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppBorderRadius.lg),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppBorderRadius.lg)),
              child: Image.network(
                news.imageUrl,
                width: 200.w,
                height: 100.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 200.w,
                    height: 100.h,
                    color: AppColors.grey200,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.smW),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title
                    Text(
                      news.title,
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, height: 1.2),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Bottom row: Author, Date, Icons
                    Row(
                      children: [
                        // Author avatar
                        CircleAvatar(
                          radius: 14.r,
                          backgroundImage: NetworkImage(news.authorAvatar),
                          backgroundColor: AppColors.grey200,
                        ),
                        
                        SizedBox(width: 4.w),
                        
                        // Author name and date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news.authorName,
                                style: TextStyle(fontSize: 12.sp),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                news.date,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w200,
                                  color: AppColors.textSecondary,
                                  letterSpacing: .4
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Action icons
                        IconifyIcon(
                          icon: news.isFavorite ? 'mdi:heart' : 'mdi:heart-outline',
                          size: 16.sp,
                          color: news.isFavorite ? Colors.red : AppColors.grey800,
                        ),
                        
                        SizedBox(width: 5.w),
                        
                        IconifyIcon(
                          icon: news.isBookmarked ? 'mdi:bookmark' : 'mdi:bookmark-outline',
                          size: 16.sp,
                          color: news.isBookmarked ? AppColors.cordBronze : AppColors.grey800,
                        ),
                      ],
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
