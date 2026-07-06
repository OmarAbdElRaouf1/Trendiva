import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/category_item.dart';
import 'package:nti_final_project/features/home/presentation/views/widgets/section_header.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  static const _categories = [
    (icon: Icons.checkroom_outlined, label: 'Clothing'),
    (icon: Icons.directions_walk_outlined, label: 'Shoes'),
    (icon: Icons.watch_outlined, label: 'Accessories'),
    (icon: Icons.content_cut_outlined, label: 'Beauty'),
  ];

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
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];

              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CategoryItem(icon: category.icon, label: category.label),
              );
            },
          ),
        ),
      ],
    );
  }
}
