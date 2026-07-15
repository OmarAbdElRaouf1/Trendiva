import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/widgets/retry_button.dart';
import 'package:trendiva/features/cart/domain/entities/cart_entity.dart';
import 'package:trendiva/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:trendiva/features/cart/presentation/cubit/cart_state.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'cart_skeleton.dart';
import 'custom_container.dart';
import 'order_summary.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return switch (state) {
            CartInitial() || CartLoading() => const CartSkeleton(),
            CartError(:final message) => Center(
              child: RetryButton(message: 'Failed to load cart: $message'),
            ),
            CartLoaded(:final cart) => _CartContent(cart: cart),
          };
        },
      ),
    );
  }
}

class _CartContent extends StatelessWidget {
  const _CartContent({required this.cart});

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();

    if (cart.items.isEmpty) {
      return Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 24.sp, color: context.colors.primary),
        ),
      );
    }

    return ListView(
      children: [
        Gap(32.h),
        Text(
          'Your Shopping Bag',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        Gap(4.h),
        Text(
          '${cart.items.length} items in your cart',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: context.colors.textSecondary,
          ),
        ),
        Gap(24.h),
        for (final item in cart.items) ...[
          CustomContainer(
            item: item,
            onIncrement: () =>
                cubit.addItem(productId: item.productId, quantity: 1),
            onDecrement: () => item.quantity <= 1
                ? cubit.removeItem(item.itemId)
                : cubit.decrementItem(itemId: item.itemId, quantity: 1),
            onRemove: () => cubit.removeItem(item.itemId),
          ),
          Gap(24.h),
        ],
        OrderSummary(
          orderTitle: 'Subtotal',
          orderPrice: '\$${cart.subtotal.toStringAsFixed(2)}',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: context.colors.textMuted,
        ),
        Gap(8.h),
        OrderSummary(
          orderTitle: 'Shipping',
          orderPrice: 'free',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: context.colors.textMuted,
        ),
        Gap(8.h),
        OrderSummary(
          orderTitle: 'Total',
          orderPrice: '\$${cart.subtotal.toStringAsFixed(2)}',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: context.colors.textPrimary,
        ),
        Gap(16.h),
        CustomButton(
          text: 'Proceed to Checkout',
          onPressed: () {},
          icon: Icons.arrow_forward,
        ),
        Gap(20.h),
      ],
    );
  }
}
