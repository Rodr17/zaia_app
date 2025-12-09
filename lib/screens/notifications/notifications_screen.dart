import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_colors.dart';
import '../../widgets/local_icon.dart';
import '../../theme/app_typography.dart';
import '../../theme/app_constants.dart';
import '../../models/notification_model.dart';
import 'widgets/notification_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Notificaciones nuevas (no leídas)
  final List<NotificationModel> _newNotifications = [
    NotificationModel(
      id: '1',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationModel(
      id: '2',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationModel(
      id: '3',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationModel(
      id: '4',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationModel(
      id: '5',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NotificationModel(
      id: '6',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    ),
  ];

  // Notificaciones anteriores (leídas)
  final List<NotificationModel> _previousNotifications = [
    NotificationModel(
      id: '7',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
    NotificationModel(
      id: '8',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
    NotificationModel(
      id: '9',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
    ),
    NotificationModel(
      id: '10',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
    ),
    NotificationModel(
      id: '11',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      isRead: true,
    ),
    NotificationModel(
      id: '12',
      title: 'Título de notificación',
      imageUrl: 'https://images.unsplash.com/photo-1606910122743-704c7ab9de22?w=400',
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      isRead: true,
    ),
  ];

  void _deleteNotification(String notificationId, bool isNew) {
    setState(() {
      if (isNew) {
        _newNotifications.removeWhere((n) => n.id == notificationId);
      } else {
        _previousNotifications.removeWhere((n) => n.id == notificationId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h, bottom: AppSpacing.mdH),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16.w,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 31.w,
                      height: 29.h,
                      // clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: AppColors.grey300.withValues(alpha: .4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppBorderRadius.circle)),
                      ),
                      child: const LocalIcon(icon: 'icon-park-outline:left'),
                    ),
                  ),
                  Text('Notificaciones', style: AppTypography.displaySmall),
                ],
              ),
            ),

            // Línea divisoria
            Divider(height: 0.5.h, color: AppColors.grey300, indent: 20.w, endIndent: 20.w),

            // Contenido
            Expanded(
              child: (_newNotifications.isEmpty && _previousNotifications.isEmpty)
                  ? _buildEmptyState()
                  : ListView(
                      padding: EdgeInsets.only(
                        top: AppSpacing.xsH,
                        bottom: AppSpacing.mdH,
                        left: AppSpacing.xsW,
                        right: AppSpacing.xsW,
                      ),
                      children: [
                        // Sección "Nuevas"
                        if (_newNotifications.isNotEmpty) ...[
                          Padding(
                            padding: EdgeInsets.only(
                              left: AppSpacing.mdW,
                              right: AppSpacing.mdW,
                              top: AppSpacing.smH,
                              bottom: 4,
                            ),
                            child: Text('Nuevas', style: AppTypography.titleMedium),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _newNotifications.length,
                            itemBuilder: (context, index) {
                              final notification = _newNotifications[index];
                              return NotificationItem(
                                notification: notification,
                                onDismiss: () => _deleteNotification(notification.id, true),
                              );
                            },
                          ),
                        ],

                        // Sección "Anteriores"
                        if (_previousNotifications.isNotEmpty) ...[
                          Padding(
                            padding: EdgeInsets.only(
                              left: AppSpacing.mdW,
                              right: AppSpacing.mdW,
                              top: AppSpacing.lgH,
                              bottom: 4,
                            ),
                            child: Text('Anteriores', style: AppTypography.titleMedium),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _previousNotifications.length,
                            itemBuilder: (context, index) {
                              final notification = _previousNotifications[index];
                              return NotificationItem(
                                notification: notification,
                                onDismiss: () => _deleteNotification(notification.id, false),
                              );
                            },
                          ),
                        ],
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.xlW),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120.w,
            height: 120.h,
            padding: EdgeInsets.all(AppSpacing.mdW),
            decoration: const BoxDecoration(color: AppColors.grey200, shape: BoxShape.circle),
            child: LocalIcon(icon: 'iconamoon:notification-thin', size: 60.sp, color: AppColors.grey400),
          ),

          SizedBox(height: AppSpacing.lgH),

          Text('Sin notificaciones', style: AppTypography.titleLarge, textAlign: TextAlign.center),

          SizedBox(height: AppSpacing.smH),

          Text(
            'Todas tus notificaciones aparecerán aquí',
            style: AppTypography.bodyMedium.copyWith(color: AppColors.grey600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
