import 'package:flutter/material.dart';
import 'package:fruits_market/features/auth/presentation/views/login/login.dart';
import 'package:fruits_market/features/auth/presentation/views/sign_up/sign_up.dart';
import 'package:fruits_market/features/on_baording/presentation/views/on_boarding.dart';
import 'package:fruits_market/features/splash/presentation/views/splash.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Splash.routeName:
      return MaterialPageRoute(builder: (_) => const Splash());
    case OnBoarding.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoarding());
    case SignUp.routeName:
      return MaterialPageRoute(builder: (_) => const SignUp());
    case Login.routeName:
      return MaterialPageRoute(builder: (_) => const Login());
    default:
      return null;
  }
}
