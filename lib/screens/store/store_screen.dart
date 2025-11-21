import 'package:flutter/material.dart';
import 'package:iconify_design/iconify_design.dart';
import 'package:zaia_app/theme/app_colors.dart';
import '../../models/product_model.dart';
import 'widgets/product_card.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = ['Todo', 'Ofertas', 'Brazaletes', 'Respiradores', 'Kits', 'Cursos'];

  final ProductModel _featuredProduct = const ProductModel(
    id: '1',
    name: 'Brazalete de Obsidiana',
    description: 'Ojo de tigre azul y Rutilo',
    price: 700,
    imageUrl: 'https://images.unsplash.com/photo-1619119069152-a2b331eb392a?w=400',
    category: 'Brazaletes',
    galleryImages: [
      'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=200',
      'https://images.unsplash.com/photo-1602751584552-8ba73aad10e1?w=200',
      'https://images.unsplash.com/photo-1573408301185-9146fe634ad0?w=200',
      'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=200',
    ],
    isFeatured: true,
  );

  final List<ProductModel> _products = List.generate(
    8,
    (index) => ProductModel(
      id: 'product_$index',
      name: 'Brazalete de Obsidiana',
      description: 'Piedras naturales',
      price: 700,
      imageUrl: 'https://images.unsplash.com/photo-1611591437281-460bfbe1220a?w=400',
      category: 'Brazaletes',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 10),
                _buildCategories(),
                const SizedBox(height: 24),
                _buildNovedadesSection(),
                const SizedBox(height: 32),
                _buildRecommendationsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final screen = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        // Background image
        Container(
          height: 419,
          width: screen.width,
          decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
          child: Image.network(
            'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=800',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(color: const Color(0xFFD9D9D9));
            },
          ),
        ),
        // Gradient overlay
        Positioned(
          left: 0,
          right: 0,
          top: 81,
          child: Container(
            height: 338,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.85, 1.0],
                colors: [Color(0x00D9D9D9), Color(0x80FFFFFF), Color(0xFFFFFFFF)],
              ),
            ),
          ),
        ),
        
        // Header content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Column(
              children: [
                // Header with title and icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tienda',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.5), shape: BoxShape.circle),
                          child: const Center(
                            child: IconifyIcon(icon: 'ph:bag-thin', size: 20, color: Colors.black),
                          ),
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.5), shape: BoxShape.circle),
                          child: const Center(
                            child: IconifyIcon(
                              icon: 'material-symbols-light:search-rounded',
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const IconifyIcon(icon: 'iconamoon:notification-thin', size: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                
                const SizedBox(height: 40),
                
                // Product image with glow effect
                Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFC439),
                              blurRadius: 80,
                              spreadRadius: 10,
                            ),
                          ],
                          // TODO: Reemplazar por imagen modelado de datos
                          // image: DecorationImage(image: NetworkImage(_featuredProduct.imageUrl), fit: BoxFit.cover),
                          image: DecorationImage(image: AssetImage('assets/images/pulsera.png'), fit: BoxFit.contain),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 35),
                
                // Product info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _featuredProduct.name,
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _featuredProduct.description,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    
                    // Gallery images
                    Row(
                      spacing: 14,
                      children: _featuredProduct.galleryImages!
                          .map(
                            (img) => Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                                image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: Container(width: 28, height: 3, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),),
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? Colors.black : Colors.black,
                  ),
                ),
              );
            },
          ),
        ),
        // Selection indicator
      ],
    );
  }

  Widget _buildNovedadesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Novedades', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(color: AppColors.grey200, shape: BoxShape.circle),
                child: IconButton(
                  icon: IconifyIcon(icon: 'majesticons:more-menu-line', color: AppColors.grey800,),
                  padding: EdgeInsets.zero,
                  onPressed: () => {},
                ),
              ),
            ],
          ),
        ),
        
        // Carousel banner
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFF726D2D).withValues(alpha: 0.4),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1511988617509-a57c8a288659?w=800',
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.grey[300]);
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFF726D2D).withValues(alpha: 0.4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 327,
                      child: Text(
                        '¿Estas listo para nuestros\nnuevos productos?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: 2,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recomendaciones', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(color: AppColors.grey200, shape: BoxShape.circle),
                child: IconButton(
                  icon: IconifyIcon(icon: 'majesticons:more-menu-line', color: AppColors.grey800,),
                  padding: EdgeInsets.zero,
                  onPressed: () => {},
                ),
              ),
            ],
          ),
        ),
        
        // Product grid
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 166 / 188,
              // mainAxisSpacing: 14,
              crossAxisSpacing: 20,
            ),
            itemCount: _products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: _products[index],
                onTap: () {
                  // Navigate to product detail
                },
                onAddToCart: () {
                  // Add to cart
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
