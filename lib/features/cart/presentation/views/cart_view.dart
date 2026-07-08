import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';

import 'widgets/custom_container.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcf9f8),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCF9F8),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/app_bar_icons/options.svg'),
        ),
        title: Text(
          'Trendiva',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF00342B),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/app_bar_icons/notification.svg',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            CustomContainer(),
            Gap(24.h),
            CustomContainer(),
            Gap(24.h),
            CustomContainer(),
            Gap(16.h),
            Row(children: [

              ],
            ),
            Gap(8.h),
            Row(),
            Gap(16.h),
            ElevatedButton(onPressed: () {}, child: Text('')),
          ],
        ),
      ),
    );
  }
}
