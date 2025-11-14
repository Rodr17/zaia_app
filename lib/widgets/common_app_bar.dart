import 'package:flutter/material.dart';
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
      title: Text(title, style: AppTypography.headlineLarge),
      backgroundColor: AppColors.background,
      elevation: 0,
      actionsPadding: const EdgeInsets.only(right: AppSpacing.sm),
      actions: [
        if (showSearchButton)
          IconButton(
            icon: const IconifyIcon(icon: 'material-symbols-light:search-rounded', color: AppColors.grey800),
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.grey200)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
            },
          ),
        if (showNotificationButton)
          IconButton(
            icon: const IconifyIcon(icon: 'iconamoon:notification-thin', color: AppColors.grey800),
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.grey200)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
            },
          ),
      ],
    );
  }
}
