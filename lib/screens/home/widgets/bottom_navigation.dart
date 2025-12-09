import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/local_icon.dart';
import 'package:zaia_app/theme/app_constants.dart';
import '../../../theme/app_colors.dart';

class ZaiaBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const ZaiaBottomNavigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xlW + 2.5.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.grey200,
        boxShadow: [BoxShadow(color: AppColors.grey300.withAlpha(150), blurRadius: 6.r, offset: const Offset(0, -2))],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(context, icon: 'iconamoon:home-thin', index: 0, route: 'home'),
          _buildNavItem(context, icon: 'ph:bag-thin', index: 1, route: 'store'),
          _buildNavItem(context, icon: 'lets-icons:question-light', index: 2, route: 'faq'),
          _buildNavItem(context, icon: 'material-symbols-light:edit-note-outline-sharp', index: 3, route: 'news'),
          _buildNavItem(context, icon: 'iconamoon:profile-thin', index: 4, route: 'profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, {required String icon, required int index, required String route}) {
    final isSelected = currentIndex == index;

    return InkWell(
      onTap: () => context.goNamed(route),
      child: Container(
        width: AppSpacing.xxlW,
        height: AppSpacing.xxlH,
        decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? AppColors.accent : Colors.transparent),
        child: Container(
          padding: EdgeInsets.all(6.r),
          width: 36.w,
          height: 36.h,
          child: LocalIcon(icon: icon, color: isSelected ? AppColors.textOnPrimary : AppColors.grey800),
        ),
      ),
    );
  }
}
