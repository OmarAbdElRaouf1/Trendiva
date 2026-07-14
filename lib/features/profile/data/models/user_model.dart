class UserModel {
  const UserModel({
    required this.userId,
    required this.email,
    required this.fullName,
    this.profilePicture,
  });

  final String userId;
  final String email;
  final String fullName;
  final String? profilePicture;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      profilePicture: json['profilePicture'] as String?,
    );
  }
}
