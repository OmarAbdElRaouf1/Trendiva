import 'package:flutter/material.dart';
import 'package:trendiva/features/aboutUs/presentation/views/widgets/about_us_app_bar.dart';
import 'package:trendiva/features/aboutUs/presentation/views/widgets/about_us_view_body.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AboutUsAppBar(),
      body: AboutUsViewBody(),
    );
  }
}
