import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/widgets/custom_button.dart';
import 'package:trendiva/features/product_details/presentation/cubit/reviews_cubit.dart';
import 'package:trendiva/features/product_details/presentation/cubit/reviews_state.dart';
import 'package:trendiva/features/product_details/presentation/views/widgets/rating_picker.dart';

class WriteReviewView extends StatefulWidget {
  const WriteReviewView({super.key});

  @override
  State<WriteReviewView> createState() => _WriteReviewViewState();
}

class _WriteReviewViewState extends State<WriteReviewView> {
  final _commentController = TextEditingController();
  int rating = 0;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a star rating.')),
      );
      return;
    }
    if (_commentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please write a comment.')),
      );
      return;
    }

    try {
      await context.read<ReviewsCubit>().submitReview(
        comment: _commentController.text.trim(),
        rating: rating,
      );
      if (!mounted) return;
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not submit review: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final reviewsState = context.watch<ReviewsCubit>().state;
    final isSubmitting =
        reviewsState is ReviewsLoaded && reviewsState.isSubmitting;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Write a Review')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How would you rate this product?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: context.colors.textPrimary,
              ),
            ),
            Gap(16),
            Center(
              child: RatingPicker(
                rating: rating,
                onChanged: (value) => setState(() => rating = value),
              ),
            ),
            Gap(28),
            Text(
              'Your Review',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: context.colors.textPrimary,
              ),
            ),
            Gap(12),
            TextField(
              controller: _commentController,
              minLines: 5,
              maxLines: 8,
              style: TextStyle(color: context.colors.textPrimary),
              decoration: InputDecoration(
                hintText: 'Share your thoughts about this product...',
                hintStyle: TextStyle(color: context.colors.textMuted),
                filled: true,
                fillColor: context.colors.fieldFill,
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Gap(32),
            CustomButton(
              text: isSubmitting ? 'Submitting...' : 'Submit Review',
              onPressed: isSubmitting ? () {} : _submit,
            ),
          ],
        ),
      ),
    );
  }
}
