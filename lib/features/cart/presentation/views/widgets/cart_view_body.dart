import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'custom_container.dart';
import 'order_summary.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Gap(32.h),
          Text(
            'Your Shopping Bag',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1C1B1B),
            ),
          ),
          Gap(4.h),

          Text(
            '3 items in your cart',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF3F4945),
            ),
          ),
          Gap(24.h),
          CustomContainer(
            productAsset: 'assets/icons/cart_assets/emerald_slik_slip.png',
            productName: 'Emerald Silk Slip',
            size: 'M',
            color: 'Emerald',
            price: '240.00',
          ),
          Gap(24.h),
          CustomContainer(
            productAsset: 'assets/icons/cart_assets/sandals.png',
            productName: 'Sculptural Bone\nSandals',
            size: '38',
            color: 'Bone',
            price: '185.00',
          ),
          Gap(24.h),
          CustomContainer(
            productAsset: 'assets/icons/cart_assets/cashmere_knit.png',
            productName: 'Textured\nCashmere Knit',
            size: 'S',
            color: 'Ivory',
            price: '320.00',
          ),
          Gap(16.h),
          OrderSummary(
            orderTitle: 'Subtotal',
            orderPrice: '\$745.00',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF5D5F5C),
          ),
          Gap(8.h),
          OrderSummary(
            orderTitle: 'Shipping',
            orderPrice: 'free',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF5D5F5C),
          ),
          Gap(8.h),
          OrderSummary(
            orderTitle: 'Total',
            orderPrice: '\$745.00',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1C1B1B),
          ),
          Gap(16.h),
          CustomButton(
            text: 'Proceed to Checkout',
            onPressed: () {},
            icon: Icons.arrow_forward,
          ),
          Gap(20.h),
        ],
      ),
    );
  }
}
