class UserEntity {
  const UserEntity({
    required this.userId,
    required this.email,
    required this.fullName,
    this.profilePicture,
  });

  final String userId;
  final String email;
  final String fullName;
  final String? profilePicture;
}
