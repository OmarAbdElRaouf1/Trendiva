import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/custom_icon_button.dart';

class ProductModel {
  const ProductModel({
    required this.brand,
    required this.name,
    required this.price,
    required this.image,
  });

  final String brand;
  final String name;
  final double price;
  final String image;
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                child: SizedBox(
                  height: 170,
                  width: double.infinity,
                  child: Image.asset(product.image, fit: BoxFit.cover),
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: RoundIconButton(
                  icon: Icons.favorite,
                  iconColor: Colors.white,
                  backgroundColor: Colors.white.withOpacity(.25),
                  onPressed: () {},
                ),
              ),

              Positioned(
                bottom: -18,
                right: 14,
                child: RoundIconButton(
                  icon: Icons.add,
                  backgroundColor: const Color(0xff003D34),
                  iconColor: Colors.white,
                  size: 46,
                  iconSize: 24,
                  onPressed: () {},
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.brand.toUpperCase(),
                  style: AppTextStyles.productBrand,
                ),

                const SizedBox(height: 4),

                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.productName,
                ),

                const SizedBox(height: 6),

                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: AppTextStyles.productPrice,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
