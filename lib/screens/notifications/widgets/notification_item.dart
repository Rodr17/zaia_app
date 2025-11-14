import 'package:flutter/material.dart';
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
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
      child: Row(
        children: [
          // Avatar circular con imagen
          ClipOval(
            child: notification.imageUrl != null
                ? Image.network(
                    notification.imageUrl!,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 32,
                        height: 32,
                        color: AppColors.grey300,
                        child: const Icon(Icons.person, size: 18, color: AppColors.grey600),
                      );
                    },
                  )
                : Container(
                    width: 32,
                    height: 32,
                    color: AppColors.grey300,
                    child: const Icon(Icons.notifications_outlined, size: 16, color: AppColors.grey600),
                  ),
          ),

          const SizedBox(width: 12),

          // Contenido de la notificación
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  _formatTimestamp(notification.timestamp),
                  style: TextStyle(fontSize: 14, color: Colors.black.withValues(alpha: 0.4)),
                ),
              ],
            ),
          ),

          // Botón de eliminar
          IconButton(
            icon: const IconifyIcon(icon: 'iconoir:cancel', size: 20),
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
