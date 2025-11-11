import 'package:flutter/material.dart';
import 'package:iconify_design/iconify_design.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/app_colors.dart';

class ZaiaBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const ZaiaBottomNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.grey200,
        boxShadow: [BoxShadow(color: AppColors.grey300.withAlpha(150), blurRadius: 6, offset: const Offset(0, -2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, icon: 'iconamoon:home-thin', index: 0, route: '/'),
          _buildNavItem(context, icon: 'ph:bag-thin', index: 1, route: '/store'),
          _buildNavItem(context, icon: 'lets-icons:question-light', index: 2, route: '/faq'),
          _buildNavItem(context, icon: 'material-symbols-light:edit-note-outline-sharp', index: 3, route: '/news'),
          _buildNavItem(context, icon: 'iconamoon:profile-thin', index: 4, route: '/profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, {required String icon, required int index, required String route}) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => context.go(route),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? AppColors.accent : Colors.transparent),
        child: IconButton(
          onPressed: () => context.go(route),
          icon: IconifyIcon(icon: icon, color: isSelected ? AppColors.textOnPrimary : AppColors.grey800, size: 32),
        ),
      ),
    );
  }
}
