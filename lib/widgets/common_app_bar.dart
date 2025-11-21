import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_design/iconify_design.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_constants.dart';
import '../screens/search/search_screen.dart';
import '../screens/notifications/notifications_screen.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearchButton;
  final bool showNotificationButton;

  const CommonAppBar({
    super.key,
    required this.title,
    this.showSearchButton = true,
    this.showNotificationButton = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: AppSpacing.screenPadding,
      title: Text(title, style: AppTypography.displaySmall),
      centerTitle: false,
      backgroundColor: AppColors.background,
      elevation: 0,
      actionsPadding: EdgeInsets.only(right: AppSpacing.screenPadding),
      actions: [
        Row(
          spacing: 9.r,
          children: [
            if (showSearchButton)
              IconButton(
                padding: EdgeInsets.all(AppBorderRadius.sm),
                icon: IconifyIcon(icon: 'material-symbols-light:search-rounded', color: AppColors.textPrimary),
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.grey200)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
                },
              ),
        
            if (showNotificationButton)
              IconButton(
                padding: EdgeInsets.all(AppBorderRadius.icon),
                icon: const IconifyIcon(icon: 'iconamoon:notification-thin', color: AppColors.textPrimary),
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.grey200)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
                },
              ),
          ],
        ),
      ],
    );
  }
}
