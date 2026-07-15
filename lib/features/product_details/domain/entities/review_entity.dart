class ReviewEntity {
  const ReviewEntity({
    required this.comment,
    required this.rating,
    required this.userName,
    this.createdAt,
    this.userPicture,
  });

  final String comment;
  final double rating;
  final String userName;
  final DateTime? createdAt;
  final String? userPicture;
}
