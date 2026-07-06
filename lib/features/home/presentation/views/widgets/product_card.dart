import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/helpers/extensions.dart';
import 'package:nti_final_project/core/routing/routes.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import 'package:nti_final_project/features/home/data/models/product_model.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/custom_icon_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(Routes.productDetails, arguments: product),
      child: Container(
        width: 170.w,
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
                    height: 170.h,
                    width: double.infinity,
                    child: Image.asset(product.image, fit: BoxFit.cover),
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
                    size: 46,
                    iconSize: 24,
                    onPressed: () {},
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
                  Text(
                    product.brand.toUpperCase(),
                    style: AppTextStyles.productBrand,
                  ),

                  Gap(4.h),

                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.productName,
                  ),

                  Gap(6.h),

                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: AppTextStyles.productPrice,
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
