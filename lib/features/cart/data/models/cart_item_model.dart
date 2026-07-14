class CartItemModel {
  const CartItemModel({
    required this.itemId,
    required this.productId,
    required this.productName,
    required this.productCoverUrl,
    required this.quantity,
    required this.discountPercentage,
    required this.basePricePerUnit,
    required this.finalPricePerUnit,
    required this.totalPrice,
  });

  final String itemId;
  final String productId;
  final String productName;
  final String productCoverUrl;
  final int quantity;
  final double discountPercentage;
  final double basePricePerUnit;
  final double finalPricePerUnit;
  final double totalPrice;

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      itemId: json['itemId'] as String,
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      productCoverUrl: json['productCoverUrl'] as String? ?? '',
      quantity: json['quantity'] as int,
      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble() ?? 0,
      basePricePerUnit: (json['basePricePerUnit'] as num).toDouble(),
      finalPricePerUnit: (json['finalPricePerUnit'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
    );
  }
}
