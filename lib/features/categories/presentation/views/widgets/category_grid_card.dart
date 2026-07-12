import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendiva/core/utils/app_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/features/home/data/models/category_model.dart';

class CategoryGridCard extends StatelessWidget {
  const CategoryGridCard({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: category.coverPictureUrl.isEmpty
                ? const _CategoryImageFallback()
                : CachedNetworkImage(
                    imageUrl: category.coverPictureUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (_, _) => const _CategoryImageFallback(),
                    errorWidget: (_, _, _) => const _CategoryImageFallback(),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.productName,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryImageFallback extends StatelessWidget {
  const _CategoryImageFallback();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.tertiaryColor.withValues(alpha: .35),
      child: const Icon(Icons.category_outlined, color: AppColors.neutralColor),
    );
  }
}
