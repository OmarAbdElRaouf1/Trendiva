import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/routing/app_router.dart';

void main() {
  runApp(const Trendiva());
}

class Trendiva extends StatelessWidget {
  const Trendiva({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      title: 'Flutter Demo',
    );
  }
}