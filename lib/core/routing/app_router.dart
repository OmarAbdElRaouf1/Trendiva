import 'package:flutter/material.dart';
import 'package:nti_final_project/features/auth/presentation/views/login_view.dart';
import 'package:nti_final_project/features/auth/presentation/views/signup_view.dart';
import 'package:nti_final_project/features/home/presentation/views/home_view.dart';
import 'package:nti_final_project/features/splash/presentation/views/splash_view.dart';
import 'package:nti_final_project/root_view.dart';

import 'routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.signupView:
        return MaterialPageRoute(builder: (_) => const SignupView());

      case Routes.rootView:
        return MaterialPageRoute(builder: (_) => const RootView());

      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}