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
    required this.id,
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

  final String id;
  final String brand;
  final String name;
  final double price;
  final String image;
  final double? oldPrice;
  final double rating;
  final int reviewCount;
  final String description;
  final List<Review> reviews;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final originalPrice = (json['price'] as num).toDouble();
    final discountPercentage =
        (json['discountPercentage'] as num?)?.toDouble() ?? 0;
    final hasDiscount = discountPercentage > 0;

    return ProductModel(
      id: json['id'] as String,
      brand: _brandFromCategories(json['categories'] as List?),
      name: json['name'] as String,
      price: hasDiscount
          ? originalPrice - (originalPrice * discountPercentage / 100)
          : originalPrice,
      oldPrice: hasDiscount ? originalPrice : null,
      image: json['coverPictureUrl'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      reviewCount: json['reviewsCount'] as int? ?? 0,
      description: json['description'] as String? ?? '',
    );
  }

  static String _brandFromCategories(List? categories) {
    if (categories == null || categories.isEmpty) return '';
    final first = categories.first;
    if (first is String) return first;
    if (first is Map) return first['name']?.toString() ?? '';
    return '';
  }
}
