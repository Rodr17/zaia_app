import 'package:flutter/material.dart';
import 'package:iconify_design/iconify_design.dart';
import '../../../models/product_model.dart';
import '../../../theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;

  const ProductCard({super.key, required this.product, this.onTap, this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 166,
        height: 188,
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image container with background
            Stack(
              children: [
                Container(
                  width: 166,
                  height: 150,
                  decoration: BoxDecoration(color: AppColors.grey200, borderRadius: BorderRadius.circular(0)),
                ),
                // Circular glow background
                Positioned(
                  left: 83,
                  top: 75,
                  child: Transform.translate(
                    offset: const Offset(-37.5, -37.5),
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFFC439),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Product image
                Positioned(
                  left: 21,
                  top: 54,
                  child: Container(
                    width: 124,
                    height: 43,
                    decoration: BoxDecoration(
                      // TODO: Reemplazar con imagen del producto
                      // image: DecorationImage(image: NetworkImage(product.imageUrl), fit: BoxFit.cover),
                      image: DecorationImage(image: AssetImage('assets/images/pulsera.png'), fit: BoxFit.cover),
                    ),
                  ),
                ),
                // Add button
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: GestureDetector(
                    onTap: onAddToCart,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(color: Colors.transparent),
                      child: const IconifyIcon(icon: 'mynaui:plus', size: 16, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            
            // Product name
            Text(
              product.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 23 / 14, letterSpacing: 0.24),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            // Product price
            Text(
              '\$${product.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 23 / 14, letterSpacing: 0.24),
            ),
          ],
        ),
      ),
    );
  }
}
