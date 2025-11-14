import 'package:flutter/material.dart';
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
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20),
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
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(AppBorderRadius.lg)),
              child: Image.network(
                news.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: AppColors.grey200,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Category
                    Text(
                      news.category,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w100, color: AppColors.textSecondary),
                    ),
                    // Title
                    Expanded(
                      child: Text(
                        news.title,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Date
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        news.date,
                        style: const TextStyle(
                          fontSize: 10,
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
