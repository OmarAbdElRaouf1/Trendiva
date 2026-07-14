import 'package:flutter/material.dart';
import 'package:trendiva/core/widgets/custom_app_bar.dart';
import 'package:trendiva/features/categories/presentation/views/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: CategoriesViewBody(),
    );
  }
}
