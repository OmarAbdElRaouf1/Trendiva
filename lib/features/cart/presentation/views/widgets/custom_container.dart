import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trendiva/features/cart/data/models/cart_item_model.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  final CartItemModel item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: item.productCoverUrl,
                      width: 150.w,
                      height: 150.h,
                      fit: BoxFit.cover,
                      placeholder: (_, _) => Container(
                        width: 150.w,
                        height: 150.h,
                        color: const Color(0xFFEDEDED),
                      ),
                      errorWidget: (_, _, _) => Container(
                        width: 150.w,
                        height: 150.h,
                        color: const Color(0xFFEDEDED),
                      ),
                    ),
                  ),
                  Gap(16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1C1B1B),
                          ),
                        ),
                        Gap(4.h),
                        Text(
                          '\$${item.finalPricePerUnit.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF7EBDAC),
                          ),
                        ),
                        Gap(9.h),
                        SizedBox(
                          height: 40.h,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: const Color(0xFFBFC9C4),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: onDecrement,
                                  icon: SvgPicture.asset(
                                    'assets/icons/cart_icons/minus.svg',
                                  ),
                                ),
                                Text(
                                  '${item.quantity}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF1C1B1B),
                                  ),
                                ),
                                IconButton(
                                  onPressed: onIncrement,
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
                  ),
                  IconButton(
                    onPressed: onRemove,
                    icon: SvgPicture.asset(
                      'assets/icons/cart_icons/delete.svg',
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
