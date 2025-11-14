class NotificationModel {
  final String id;
  final String title;
  final DateTime timestamp;
  final bool isRead;
  final String? imageUrl;

  NotificationModel({
    required this.id,
    required this.title,
    required this.timestamp,
    this.isRead = false,
    this.imageUrl,
  });

  NotificationModel copyWith({String? id, String? title, DateTime? timestamp, bool? isRead, String? imageUrl}) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
