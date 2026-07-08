import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.productName,
    required this.productAsset,
    required this.size,
    required this.color,
    required this.price,
  });

  final String productName;
  final String productAsset;
  final String size;
  final String color;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  SvgPicture.asset(productAsset),
                  Gap(16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1C1B1B),
                        ),
                      ),
                      Gap(1.w),
                      Gap(4.h),
                      Text(
                        'Size: $size | Color: $color',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5D5F5C),
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        '\$$price',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF7EBDAC),
                        ),
                      ),
                      // Gap(9.h),
                      SizedBox(
                        height: 40.h,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Color(0xFFBFC9C4)),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/cart_icons/minus.svg',
                                ),
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1C1B1B),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/cart_icons/add.svg',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/cart_icons/delete.svg'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
