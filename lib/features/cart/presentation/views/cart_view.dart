import 'package:flutter/material.dart';
import 'package:nti_final_project/core/widgets/custom_app_bar.dart';
import 'widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcf9f8),
      appBar: CustomAppBar(),
      body: CartViewBody(),
    );
  }
}
