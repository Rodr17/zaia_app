class UserProfileModel {
  final String id;
  final String name;
  final String email;
  final String location;
  final String? profileImageUrl;
  final String? coverImageUrl;
  final String? favoritePhrase;
  final List<String> skills;
  final List<String> completedChallenges;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
    this.profileImageUrl,
    this.coverImageUrl,
    this.favoritePhrase,
    this.skills = const [],
    this.completedChallenges = const [],
  });

  UserProfileModel copyWith({
    String? id,
    String? name,
    String? email,
    String? location,
    String? profileImageUrl,
    String? coverImageUrl,
    String? favoritePhrase,
    List<String>? skills,
    List<String>? completedChallenges,
  }) {
    return UserProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      location: location ?? this.location,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      favoritePhrase: favoritePhrase ?? this.favoritePhrase,
      skills: skills ?? this.skills,
      completedChallenges: completedChallenges ?? this.completedChallenges,
    );
  }
}
