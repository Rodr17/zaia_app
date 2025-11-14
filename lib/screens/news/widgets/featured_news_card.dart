import 'package:flutter/material.dart';
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
        width: 200,
        height: 180,
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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(AppBorderRadius.lg)),
              child: Image.network(
                news.imageUrl,
                width: 200,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 200,
                    height: 100,
                    color: AppColors.grey200,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title
                    Text(
                      news.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.2),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Bottom row: Author, Date, Icons
                    Row(
                      children: [
                        // Author avatar
                        CircleAvatar(
                          radius: 14,
                          backgroundImage: NetworkImage(news.authorAvatar),
                          backgroundColor: AppColors.grey200,
                        ),
                        const SizedBox(width: 4),
                        // Author name and date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news.authorName,
                                style: const TextStyle(fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                news.date,
                                style: TextStyle(
                                  fontSize: 10,
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
                          size: 16,
                          color: news.isFavorite ? Colors.red : AppColors.grey800,
                        ),
                        const SizedBox(width: 5),
                        IconifyIcon(
                          icon: news.isBookmarked ? 'mdi:bookmark' : 'mdi:bookmark-outline',
                          size: 16,
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
