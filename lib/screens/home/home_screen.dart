import 'package:flutter/material.dart';
import 'package:iconify_design/iconify_design.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_constants.dart';
import '../../widgets/common_app_bar.dart';
import 'widgets/inspiration_card.dart';
import 'widgets/category_chip.dart';
import 'widgets/trending_category.dart';
import 'widgets/promotional_banner.dart';
import '../card/card_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = ['Tarjetas', 'Salud', 'Relajación', 'Espiritualidad', 'Cultura', 'Testimonios'];

  final Map<String, List<Map>> _inspirationCards = {
    'Tarjetas': [
      {
        'imageUrl': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
      {
        'imageUrl': 'https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
      {
        'imageUrl': 'https://plus.unsplash.com/premium_photo-1671599016130-7882dbff302f?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
    ],
    'Salud': [
      {
        'imageUrl': 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
      {
        'imageUrl': 'https://plus.unsplash.com/premium_photo-1725649992887-7cb05f87b6ad?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
    ],
    'Relajación': [
      {
        'imageUrl': 'https://plus.unsplash.com/premium_photo-1664303999518-c0562c354e9d?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
      {
        'imageUrl': 'https://plus.unsplash.com/premium_photo-1661476221058-6557616722c8?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
    ],
    'Espiritualidad': [
      {
        'imageUrl': 'https://plus.unsplash.com/premium_photo-1723867508714-3cfac3dc0a61?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
      {
        'imageUrl': 'https://plus.unsplash.com/premium_photo-1698500034922-3a6dfd24ef1d?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
    ],
    'Cultura': [
      {
        'imageUrl': 'https://plus.unsplash.com/premium_photo-1695800038830-7586a9806569?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
      {
        'imageUrl': 'https://plus.unsplash.com/premium_photo-1670267552055-8f33a55c1af0?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
      {
        'imageUrl': 'https://images.unsplash.com/photo-1515658323406-25d61c141a6e?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
      {
        'imageUrl': 'https://plus.unsplash.com/premium_photo-1661429571803-32c647db5a14?w=400',
        'text': 'Nunca dejes de soñar, trabaja y sigue adelante por tus metas',
      },
    ],
  };

  final List<Map<String, dynamic>> _trendingCategories = [
    {
      'name': 'Mindfulness',
      'newsCount': 25,
      'color': const Color(0xFF9B7CB6),
      'urlImage': 'https://images.unsplash.com/photo-1591228127791-8e2eaef098d3?w=400',
    },
    {
      'name': 'Estrés',
      'newsCount': 46,
      'color': const Color(0xFFF5D547),
      'urlImage': 'https://images.unsplash.com/photo-1674156423391-a65ab2a435de?w=400',
    },
    {
      'name': 'Sueño',
      'newsCount': 12,
      'color': const Color(0xFF4A5F8C),
      'urlImage': 'https://images.unsplash.com/photo-1453227588063-bb302b62f50b?w=400',
    },
    {
      'name': 'Ansiedad',
      'newsCount': 108,
      'color': const Color(0xFFC8844F),
      'urlImage': 'https://images.unsplash.com/photo-1595178156906-2396ef837b0f?w=400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: 'Home'),
      body: SingleChildScrollView(
        child: Column(
          spacing: AppSpacing.lg,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildCategories(), _buildInspirationCards(), _buildTrendingSection(), _buildNewsSection()],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        itemCount: _categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.lg),
        itemBuilder: (context, index) {
          return CategoryChipWidget(
            label: _categories[index],
            isSelected: _selectedCategoryIndex == index,
            onTap: () {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildInspirationCards() {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            itemCount: _inspirationCards[_categories[_selectedCategoryIndex]]?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final card = _inspirationCards[_categories[_selectedCategoryIndex]]![index];
              final category = _categories[_selectedCategoryIndex];
              return InspirationCard(
                imageUrl: card['imageUrl']!,
                text: card['text']!,
                heroTag: 'card_${category}_$index',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardDetailScreen(
                        imageUrl: card['imageUrl']!,
                        text: card['text']!,
                        category: category,
                        cardIndex: index,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('En Tendencia', style: AppTypography.titleLarge),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(color: AppColors.grey200, shape: BoxShape.circle),
                child: IconButton(
                  icon: IconifyIcon(icon: 'majesticons:more-menu-line', color: AppColors.grey800, size: 32),
                  padding: EdgeInsets.zero,
                  onPressed: () => {},
                  // iconSize: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            itemCount: _trendingCategories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 18),
            itemBuilder: (context, index) {
              final category = _trendingCategories[index];
              return TrendingCategory(
                name: category['name'],
                newsCount: category['newsCount'],
                color: category['color'],
                urlImage: category['urlImage'],
                onTap: () => {},
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Novedades', style: AppTypography.titleLarge),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(color: AppColors.grey200, shape: BoxShape.circle),
                child: IconButton(
                  icon: IconifyIcon(icon: 'majesticons:more-menu-line', color: AppColors.grey800, size: 32),
                  padding: EdgeInsets.zero,
                  onPressed: () => {},
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const PromotionalBanner(),
        ],
      ),
    );
  }
}
