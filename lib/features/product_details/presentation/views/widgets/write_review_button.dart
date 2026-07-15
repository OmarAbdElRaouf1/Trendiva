import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';

import '../../../../../core/routing/routes.dart';
import '../../cubit/reviews_cubit.dart';

class WriteReviewButton extends StatelessWidget {
  const WriteReviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => context.pushNamed(
          Routes.writeReviewView,
          arguments: context.read<ReviewsCubit>(),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
          side: BorderSide(color: context.colors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          'Write a Review',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: context.colors.textPrimary,
          ),
        ),
      ),
    );
  }
}
