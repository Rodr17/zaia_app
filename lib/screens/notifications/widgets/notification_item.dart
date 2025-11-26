import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_design/iconify_design.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_constants.dart';
import '../../../models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onDismiss;

  const NotificationItem({super.key, required this.notification, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.mdW, vertical: AppSpacing.smH),
      child: Row(
        children: [
          // Avatar circular con imagen
          ClipOval(
            child: notification.imageUrl != null
                ? Image.network(
                    notification.imageUrl!,
                    width: AppSpacing.xlW,
                    height: AppSpacing.xlH,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: AppSpacing.xlW,
                        height: AppSpacing.xlH,
                        color: AppColors.grey300,
                        child: Icon(Icons.person, size: 18.sp, color: AppColors.grey600),
                      );
                    },
                  )
                : Container(
                    width: AppSpacing.xlW,
                    height: AppSpacing.xlH,
                    color: AppColors.grey300,
                    child: Icon(Icons.notifications_outlined, size: 16.sp, color: AppColors.grey600),
                  ),
          ),

          SizedBox(width: 12.w),

          // Contenido de la notificación
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300, color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                
                SizedBox(height: 2.h),
                
                Text(
                  _formatTimestamp(notification.timestamp),
                  style: TextStyle(fontSize: 14.sp, color: Colors.black.withValues(alpha: 0.4)),
                ),
              ],
            ),
          ),

          // Botón de eliminar
          IconButton(
            icon: IconifyIcon(icon: 'iconoir:cancel', size: 20.sp),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: onDismiss,
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inHours < 24) {
      return '${difference.inHours}h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d';
    } else {
      return '${timestamp.day}/${timestamp.month}';
    }
  }
}
