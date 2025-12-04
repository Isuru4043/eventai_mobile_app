class UserProfile {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });
}
