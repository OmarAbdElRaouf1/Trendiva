import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/features/home/domain/entities/category_entity.dart';

class CategoryGridCard extends StatelessWidget {
  const CategoryGridCard({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: category.coverPictureUrl.isEmpty
                ? const _CategoryImageFallback()
                : CachedNetworkImage(
                    imageUrl: category.coverPictureUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (_, _) => const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (_, _, _) => const _CategoryImageFallback(),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Text(
              category.name,
              textAlign: TextAlign.center,
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
      width: double.infinity,
      color: context.colors.border.withValues(alpha: 0.25),
      child: Center(
        child: Icon(
          Icons.category_rounded,
          size: 42,
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}
