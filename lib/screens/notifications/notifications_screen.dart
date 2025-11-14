import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_design/iconify_design.dart';
import '../../theme/app_colors.dart';
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 31,
                      height: 29,
                      // clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: AppColors.grey300.withValues(alpha: .4),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppBorderRadius.circle)),
                      ),
                      child: const IconifyIcon(icon: 'icon-park-outline:left'),
                    ),
                  ),
                  Text('Notificaciones', style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.w500)),
                ],
              ),
            ),

            // Línea divisoria
            Divider(height: 0.5, color: AppColors.grey300, indent: 20, endIndent: 20),

            // Contenido
            Expanded(
              child: (_newNotifications.isEmpty && _previousNotifications.isEmpty)
                  ? _buildEmptyState()
                  : ListView(
                      padding: const EdgeInsets.only(top: AppSpacing.xs, bottom: AppSpacing.md, left: AppSpacing.xs, right: AppSpacing.xs),
                      children: [
                        // Sección "Nuevas"
                        if (_newNotifications.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: AppSpacing.md,
                              right: AppSpacing.md,
                              top: AppSpacing.sm,
                              bottom: 4,
                            ),
                            child: Text(
                              'Nuevas',
                              style: AppTypography.titleMedium,
                            ),
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
                            padding: const EdgeInsets.only(
                              left: AppSpacing.md,
                              right: AppSpacing.md,
                              top: AppSpacing.lg,
                              bottom: 4,
                            ),
                            child: Text(
                              'Anteriores',
                              style: AppTypography.titleMedium,
                            ),
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
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: const BoxDecoration(color: AppColors.grey200, shape: BoxShape.circle),
            child: const IconifyIcon(icon: 'iconamoon:notification-thin', size: 60, color: AppColors.grey400),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Sin notificaciones', style: AppTypography.titleLarge, textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.sm),
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
