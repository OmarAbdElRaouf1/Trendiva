class ProductEntity {
  const ProductEntity({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.image,
    this.oldPrice,
    this.rating = 0,
    this.reviewCount = 0,
    this.description = '',
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
}
