import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_design/iconify_design.dart';
import 'package:zaia_app/theme/app_colors.dart';
import 'package:zaia_app/theme/app_constants.dart';
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
                
                SizedBox(height: 10.h),
                
                _buildCategories(),
                
                SizedBox(height: AppSpacing.lgH),
                
                _buildNovedadesSection(),
                
                SizedBox(height: AppSpacing.xlH),
                
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
          height: 419.h,
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
            height: 338.h,
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
            child: Column(
              children: [
                // Header with title and icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tienda',
                      style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                    Row(
                      spacing: 8.w,
                      children: [
                        Container(
                          width: AppSpacing.xlW,
                          height: AppSpacing.xlH,
                          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.5), shape: BoxShape.circle),
                          child: Center(
                            child: IconifyIcon(icon: 'ph:bag-thin', size: 20.sp, color: Colors.black),
                          ),
                        ),
                        Container(
                          width: AppSpacing.xlW,
                          height: AppSpacing.xlH,
                          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.5), shape: BoxShape.circle),
                          child: Center(
                            child: IconifyIcon(
                              icon: 'material-symbols-light:search-rounded',
                              size: 20.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: IconifyIcon(icon: 'iconamoon:notification-thin', size: 20.sp, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                
                SizedBox(height: 40.h),
                
                // Product image with glow effect
                Padding(
                  padding: EdgeInsets.only(right: 17.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 160.w,
                        height: 160.h,
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

                SizedBox(height: 35.h),

                // Product info
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _featuredProduct.name,
                      style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    
                    SizedBox(height: AppSpacing.xsH),
                    
                    Text(
                      _featuredProduct.description,
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w100, color: Colors.white),
                    ),
                    
                    SizedBox(height: 12.h),
                    
                    // Gallery images
                    Row(
                      spacing: 14.w,
                      children: _featuredProduct.galleryImages!
                          .map(
                            (img) => Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2.w),
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
          margin: EdgeInsets.only(left: 20.w),
          alignment: Alignment.centerLeft,
          child: Container(width: 28.w, height: 3.h, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10.r)),),
        ),
        SizedBox(
          height: 40.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            itemCount: _categories.length,
            separatorBuilder: (context, index) => SizedBox(width: 20.w),
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
                    fontSize: 16.sp,
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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Novedades', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
              
              Container(
                width: AppSpacing.lgW,
                height: AppSpacing.lgH,
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
              borderRadius: BorderRadius.circular(16.r),
              color: const Color(0xFF726D2D).withValues(alpha: 0.4),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1511988617509-a57c8a288659?w=800',
                    width: double.infinity,
                    height: 120.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.grey[300]);
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppBorderRadius.lg),
                    color: const Color(0xFF726D2D).withValues(alpha: 0.4),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 327.w,
                      child: Text(
                        '¿Estas listo para nuestros\nnuevos productos?',
                        style: TextStyle(
                          fontSize: 20.sp,
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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recomendaciones', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
              Container(
                width: AppSpacing.lgW,
                height: AppSpacing.lgH,
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
          padding: EdgeInsets.only(left: 20.w),
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
