import 'package:trendiva/features/cart/domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.itemId,
    required super.productId,
    required super.productName,
    required super.productCoverUrl,
    required super.quantity,
    required super.discountPercentage,
    required super.basePricePerUnit,
    required super.finalPricePerUnit,
    required super.totalPrice,
  });

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
