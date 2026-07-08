class Review {
  const Review({
    required this.author,
    required this.timeAgo,
    required this.rating,
    required this.comment,
    this.helpfulCount = 0,
  });

  final String author;
  final String timeAgo;
  final double rating;
  final String comment;
  final int helpfulCount;
}

class ProductModel {
  const ProductModel({
    required this.brand,
    required this.name,
    required this.price,
    required this.image,
    this.oldPrice,
    this.rating = 0,
    this.reviewCount = 0,
    this.description = '',
    this.reviews = const [],
  });

  final String brand;
  final String name;
  final double price;
  final String image;
  final double? oldPrice;
  final double rating;
  final int reviewCount;
  final String description;
  final List<Review> reviews;
}
