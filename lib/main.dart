import 'package:flutter/material.dart';
import 'package:nti_final_project/core/routing/app_router.dart';
import 'package:nti_final_project/features/aboutUs/presentation/views/about_us_view.dart';
import 'package:nti_final_project/features/aboutUs/presentation/views/changePass._page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: AboutUsView(),
      //change(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      title: 'Flutter Demo',
    );
  }
}
