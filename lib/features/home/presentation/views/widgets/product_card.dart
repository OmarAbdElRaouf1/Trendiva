import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:trendiva/features/home/domain/entities/product_entity.dart';
import 'package:trendiva/features/home/presentation/views/widgets/custom_icon_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.productDetails, arguments: product),
      child: Container(
        width: 170.w,
        decoration: BoxDecoration(
          color: context.colors.surface,
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
                    height: 170.h,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                      placeholder: (_, _) =>
                          Container(color: context.colors.border),
                      errorWidget: (_, _, _) =>
                          Container(color: context.colors.border),
                    ),
                  ),
                ),

                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: RoundIconButton(
                    icon: Icons.favorite,
                    iconColor: Colors.white,
                    backgroundColor: Colors.white.withValues(alpha: .25),
                    onPressed: () {},
                  ),
                ),

                Positioned(
                  bottom: -18.h,
                  right: 14.w,
                  child: RoundIconButton(
                    icon: Icons.add,
                    backgroundColor: AppColors.accentColor,
                    iconColor: Colors.white,
                    size: 50.w,
                    iconSize: 24,
                    onPressed: () {
                      context.read<CartCubit>().addItem(productId: product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('${product.name} added to cart'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            Gap(24.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.brand.isNotEmpty) ...[
                    Text(
                      product.brand.toUpperCase(),
                      style: AppTextStyles.productBrand(context),
                    ),
                    Gap(4.h),
                  ],

                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.productName,
                  ),
                  Gap(6.h),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: AppTextStyles.productPrice(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
