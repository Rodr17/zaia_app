import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_constants.dart';

/// Widget personalizado para tarjetas de brazaletes
class BraceletCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const BraceletCard({super.key, required this.imageUrl, required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del brazalete
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                ),
              ),
            ),

            // Información
            Container(
              padding: EdgeInsets.all(AppSpacing.mdW),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.9),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppBorderRadius.card),
                  bottomRight: Radius.circular(AppBorderRadius.card),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.cardTitle, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall.copyWith(color: AppColors.textOnPrimary.withValues(alpha: 0.8)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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

/// Chip de categoría con estilo Zaia
class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryChip({super.key, required this.label, this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.mdW, vertical: AppSpacing.smH),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppBorderRadius.chip),
        ),
        child: Text(
          label,
          style: AppTypography.categoryLabel.copyWith(
            color: isSelected ? AppColors.textOnPrimary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// Indicador de piedra con nombre
class StoneIndicator extends StatelessWidget {
  final String name;
  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  const StoneIndicator({super.key, required this.name, required this.color, this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: isSelected ? AppColors.primary : Colors.transparent, width: 3),
              boxShadow: isSelected
                  ? [BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 2))]
                  : null,
            ),
          ),
          const SizedBox(height: 4),
          Text(name, style: AppTypography.labelSmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

/// Botón de acción principal de Zaia
class ZaiaButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;

  const ZaiaButton({super.key, required this.text, this.onPressed, this.isLoading = false, this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.textOnPrimary),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[Icon(icon, size: 20), const SizedBox(width: 8)],
                  Text(text),
                ],
              ),
      ),
    );
  }
}

/// Card de noticia/artículo
class NewsCard extends StatelessWidget {
  final String category;
  final String title;
  final String imageUrl;
  final String authorName;
  final String authorImage;
  final String date;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final VoidCallback? onBookmark;

  const NewsCard({
    super.key,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.authorImage,
    required this.date,
    this.onTap,
    this.onFavorite,
    this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen
            AspectRatio(
              aspectRatio: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                ),
              ),
            ),

            // Contenido
            Padding(
              padding: EdgeInsets.all(AppSpacing.mdW),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category, style: AppTypography.labelSmall.copyWith(color: AppColors.primary)),
                  
                  SizedBox(height: AppSpacing.xsH),
                  
                  Text(title, style: AppTypography.titleMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                  
                  SizedBox(height: 12.h),
                  
                  Row(
                    children: [
                      CircleAvatar(radius: 14.r, backgroundImage: NetworkImage(authorImage)),
                      
                      SizedBox(width: AppSpacing.smW),
                      
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(authorName, style: AppTypography.labelSmall),
                            Text(date, style: AppTypography.caption),
                          ],
                        ),
                      ),
                      
                      IconButton(
                        icon: Icon(Icons.bookmark_border, size: 20.sp),
                        onPressed: onBookmark,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      
                      SizedBox(width: AppSpacing.xsW),
                      IconButton(
                        icon: Icon(Icons.favorite_border, size: 20.sp),
                        onPressed: onFavorite,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
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

/// Badge de tendencia
class TrendingBadge extends StatelessWidget {
  final String label;
  final int count;
  final IconData icon;
  final VoidCallback? onTap;

  const TrendingBadge({super.key, required this.label, required this.count, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.mdW),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                child: Icon(icon, color: AppColors.primary, size: 28),
              ),
              
              SizedBox(width: AppSpacing.mdW),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: AppTypography.titleMedium),
                    
                    SizedBox(height: AppSpacing.xsH),
                    
                    Row(
                      children: [
                        Icon(Icons.article, size: 16.sp, color: AppColors.textTertiary),
                        
                        SizedBox(width: AppSpacing.xsW),
                        
                        Text('$count noticias', style: AppTypography.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
