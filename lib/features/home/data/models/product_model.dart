import 'package:trendiva/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.brand,
    required super.name,
    required super.price,
    required super.image,
    super.oldPrice,
    super.rating,
    super.reviewCount,
    super.description,
  });

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
