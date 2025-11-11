import 'package:flutter/material.dart';
import 'package:iconify_design/iconify_design.dart';
import 'package:zaia_app/theme/app_typography.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_constants.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsItems = [
      {
        'title': 'Nueva meditación guiada disponible',
        'description': 'Descubre nuestra última sesión de mindfulness',
        'date': 'Hace 2 horas',
        'image': 'https://images.unsplash.com/photo-1506126613408-eca07ce68773?h=180',
      },
      {
        'title': 'Consejos para dormir mejor',
        'description': 'Mejora tu descanso con estas técnicas probadas',
        'date': 'Ayer',
        'image': 'https://images.unsplash.com/photo-1511988617509-a57c8a288659?h=180',
      },
      {
        'title': 'Beneficios del yoga matutino',
        'description': 'Comienza tu día con energía y claridad mental',
        'date': 'Hace 2 días',
        'image': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?h=180',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('Noticias', style: AppTypography.headlineLarge),
        actionsPadding: const EdgeInsets.only(right: AppSpacing.sm),
        actions: [
          IconButton(
            icon: IconifyIcon(icon: 'material-symbols-light:search-rounded', color: AppColors.grey800),
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.grey200)),
            onPressed: () => {},
          ),
          IconButton(
            icon: IconifyIcon(icon: 'iconamoon:notification-thin', color: AppColors.grey800),
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.grey200)),
            onPressed: () => {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(AppSpacing.md),
        itemCount: newsItems.length,
        separatorBuilder: (context, index) => SizedBox(height: AppSpacing.md),
        itemBuilder: (context, index) {
          final item = newsItems[index];
          return _NewsCard(
            title: item['title'] as String,
            description: item['description'] as String,
            date: item['date'] as String,
            imageUrl: item['image'] as String,
          );
        },
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String imageUrl;

  const _NewsCard({required this.title, required this.description, required this.date, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppBorderRadius.lg)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 180,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 180,
                color: AppColors.surfaceVariant,
                child: const Icon(Icons.image_not_supported),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.titleMedium.copyWith(fontWeight: FontWeight.w600)),
                SizedBox(height: AppSpacing.xs),
                Text(description, style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary)),
                SizedBox(height: AppSpacing.sm),
                Text(date, style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
