import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class InspirationCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final VoidCallback? onTap;
  final String? heroTag;

  const InspirationCard({super.key, required this.imageUrl, required this.text, this.onTap, this.heroTag});

  @override
  Widget build(BuildContext context) {
    final cardContent = Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              imageUrl,
              width: 200,
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.grey300,
                  child: const Center(child: Icon(Icons.image, size: 48, color: AppColors.grey500)),
                );
              },
            ),
          ),

          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withValues(alpha: 0.3), Colors.black.withValues(alpha: 0.6)],
                stops: const [0.4, 0.7, 1.0],
              ),
            ),
          ),

          // Text Container
          Positioned(
            left: 10,
            right: 10,
            bottom: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
                  ),
                  child: Text(
                    text,
                    style: AppTypography.bodySmall.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.4,
                      letterSpacing: 0.48,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: heroTag != null ? Hero(tag: heroTag!, child: cardContent) : cardContent,
    );
  }
}
