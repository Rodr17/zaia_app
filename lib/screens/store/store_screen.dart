import 'package:flutter/material.dart';
import 'package:zaia_app/theme/app_typography.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_constants.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('Tienda', style: AppTypography.headlineSmall.copyWith(fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag_outlined, size: 80, color: AppColors.textSecondary),
              SizedBox(height: AppSpacing.lg),
              Text('Tienda en construcción', style: AppTypography.titleLarge),
              SizedBox(height: AppSpacing.sm),
              Text(
                'Pronto podrás comprar productos y servicios',
                style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
