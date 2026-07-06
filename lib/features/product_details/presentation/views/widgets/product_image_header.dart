import 'package:flutter/material.dart';
import 'package:nti_final_project/core/helpers/extensions.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/custom_icon_button.dart';

class ProductImageHeader extends StatelessWidget {
  const ProductImageHeader({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 380,
          width: double.infinity,
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        Positioned(
          top: 12,
          left: 16,
          child: RoundIconButton(
            icon: Icons.arrow_back_ios_new,
            size: 42,
            onPressed: () => context.pop(),
          ),
        ),
        Positioned(
          top: 12,
          right: 16,
          child: RoundIconButton(
            icon: Icons.favorite_border,
            size: 42,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
