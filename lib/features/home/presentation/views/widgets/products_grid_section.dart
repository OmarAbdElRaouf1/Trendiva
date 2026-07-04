import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/product_card.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/section_header.dart';

class ProductsGridSection extends StatelessWidget {
  const ProductsGridSection({super.key});

  static const _products = [
    ProductModel(
      brand: 'Luxe Watch Co.',
      name: 'Emerald Heritage Watch',
      price: 249.00,
      image: 'assets/images/watch.png',
    ),
    ProductModel(
      brand: 'Maison Paris',
      name: 'Minimalist Satchel',
      price: 420.00,
      image: 'assets/images/bag.png',
    ),
    ProductModel(
      brand: 'Urban Step',
      name: 'City Drift Sneakers',
      price: 185.00,
      image: 'assets/images/shoes.png',
    ),
    ProductModel(
      brand: 'Botanica',
      name: 'Glow Serum Complex',
      price: 88.00,
      image: 'assets/images/medical.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'All Products',
          trailing: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: const Icon(
              Icons.tune,
              size: 18,
              color: AppColors.neutralColor,
            ),
          ),
        ),
        Gap(16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.50,
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: _products[index]);
          },
        ),
      ],
    );
  }
}
