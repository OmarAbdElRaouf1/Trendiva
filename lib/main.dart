import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:nti_final_project/core/routing/app_router.dart';
import 'package:nti_final_project/core/routing/routes.dart';
import 'package:nti_final_project/features/aboutUs/presentation/views/about_us_view.dart';

void main() {
  runApp(const Trendiva());
}

class Trendiva extends StatelessWidget {
  const Trendiva({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(360, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trendiva',

        initialRoute: Routes.loginView,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
