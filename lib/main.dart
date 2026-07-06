import 'package:flutter/material.dart';
import 'package:nti_final_project/core/routing/app_router.dart';
import 'package:nti_final_project/features/profile/presentation/views/profile_view.dart';

import 'features/cart/presentation/views/cart_view.dart';

void main() {
  runApp(const Trendiva());
}

class Trendiva extends StatelessWidget {
  const Trendiva({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      title: 'Flutter Demo',
      home: ProfileView(),
    );
  }
}
