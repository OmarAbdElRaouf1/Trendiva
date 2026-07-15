class CartItemEntity {
  const CartItemEntity({
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
}
