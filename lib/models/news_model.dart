class NewsModel {
  final String id;
  final String title;
  final String category;
  final String authorName;
  final String authorAvatar;
  final String date;
  final String imageUrl;
  final bool isFavorite;
  final bool isBookmarked;

  const NewsModel({
    required this.id,
    required this.title,
    required this.category,
    required this.authorName,
    required this.authorAvatar,
    required this.date,
    required this.imageUrl,
    this.isFavorite = false,
    this.isBookmarked = false,
  });

  NewsModel copyWith({
    String? id,
    String? title,
    String? category,
    String? authorName,
    String? authorAvatar,
    String? date,
    String? imageUrl,
    bool? isFavorite,
    bool? isBookmarked,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      authorName: authorName ?? this.authorName,
      authorAvatar: authorAvatar ?? this.authorAvatar,
      date: date ?? this.date,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
