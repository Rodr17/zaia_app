import 'package:flutter/material.dart';
import '../../models/news_model.dart';
import '../../theme/app_colors.dart';
import '../../widgets/common_app_bar.dart';
import 'widgets/featured_news_card.dart';
import 'widgets/trending_news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = ['Todo', 'Mindfulness', 'Bienestar', 'Espiritualidad', 'Moda', 'Mantenimiento'];

  final List<NewsModel> _featuredNews = [
    NewsModel(
      id: '1',
      title: '3 metodos para aliviar el estrés más rápido',
      category: 'Bienestar',
      authorName: 'Alexandra Amezcua',
      authorAvatar: 'https://i.pravatar.cc/150?img=1',
      date: '28/12/2024',
      imageUrl: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773?w=400',
      isFavorite: false,
      isBookmarked: false,
    ),
    NewsModel(
      id: '2',
      title: '3 metodos para aliviar el estrés más rápido',
      category: 'Mindfulness',
      authorName: 'Alexandra Amezcua',
      authorAvatar: 'https://i.pravatar.cc/150?img=1',
      date: '28/12/2024',
      imageUrl: 'https://images.unsplash.com/photo-1511988617509-a57c8a288659?w=400',
      isFavorite: false,
      isBookmarked: false,
    ),
  ];

  final List<NewsModel> _trendingNews = [
    NewsModel(
      id: '3',
      title: 'Cambia tu rostro con los cambios de la naturaleza',
      category: 'Espiritualidad',
      authorName: 'Alexandra Amezcua',
      authorAvatar: 'https://i.pravatar.cc/150?img=1',
      date: '31/12/2024',
      imageUrl: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400',
    ),
    NewsModel(
      id: '4',
      title: 'Cuidar tu piel después de los 30 es importante',
      category: 'Bienestar',
      authorName: 'Alexandra Amezcua',
      authorAvatar: 'https://i.pravatar.cc/150?img=2',
      date: '31/12/2024',
      imageUrl: 'https://images.unsplash.com/photo-1570172619644-dfd03ed5d881?w=400',
    ),
    NewsModel(
      id: '5',
      title: 'Los 5 estilos de vida que debes llevar a cabo',
      category: 'Mantenimiento',
      authorName: 'Carlos Mendoza',
      authorAvatar: 'https://i.pravatar.cc/150?img=3',
      date: '31/12/2024',
      imageUrl: 'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=400',
    ),
    NewsModel(
      id: '6',
      title: 'Guia completa para vestirte esta temporada',
      category: 'Moda',
      authorName: 'Sofia Martinez',
      authorAvatar: 'https://i.pravatar.cc/150?img=4',
      date: '31/12/2024',
      imageUrl: 'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=400',
    ),
    NewsModel(
      id: '7',
      title: 'Tendencias de moda para el próximo año',
      category: 'Moda',
      authorName: 'Isabella Torres',
      authorAvatar: 'https://i.pravatar.cc/150?img=5',
      date: '31/12/2024',
      imageUrl: 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: 'Noticias'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // Selection indicator line
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 3,
                    decoration: BoxDecoration(color: AppColors.grey800, borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildCategories(),
            _buildFeaturedNews(),
            const SizedBox(height: 30),
            _buildTrendingSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              final isSelected = index == _selectedCategoryIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
                child: Text(
                  _categories[index],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? AppColors.grey800 : AppColors.textSecondary,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedNews() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _featuredNews.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          return FeaturedNewsCard(
            news: _featuredNews[index],
            onTap: () {
              // Navigate to news detail
            },
          );
        },
      ),
    );
  }

  Widget _buildTrendingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Noticias trending', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),

        const SizedBox(height: 7),
        
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _trendingNews.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return TrendingNewsCard(
              news: _trendingNews[index],
              onTap: () {
                // Navigate to news detail
              },
            );
          },
        ),
      ],
    );
  }
}
