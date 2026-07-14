import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/features/home/data/models/category_model.dart';
import 'package:trendiva/features/home/presentation/views/widgets/category_item.dart';
import 'package:trendiva/features/home/presentation/views/widgets/section_header.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key, required this.categories});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Categories',
          trailing: TextButton(
            onPressed: () {},
            child: Text('View All', style: AppTextStyles.linkText),
          ),
        ),
        Gap(16.h),

        SizedBox(
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];

              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CategoryItem(
                  image: category.coverPictureUrl,
                  label: category.name,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
