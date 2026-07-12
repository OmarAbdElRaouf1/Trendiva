import 'package:flutter/material.dart';
import 'package:trendiva/features/aboutUs/presentation/views/about_us_view.dart';
import 'package:trendiva/features/auth/presentation/views/change_password_view.dart';
import 'package:trendiva/features/auth/presentation/views/forget_password_view.dart';
import 'package:trendiva/features/auth/presentation/views/login_view.dart';
import 'package:trendiva/features/auth/presentation/views/otp_screen.dart';
import 'package:trendiva/features/auth/presentation/views/signup_view.dart';
import 'package:trendiva/features/home/data/models/product_model.dart';
import 'package:trendiva/features/home/presentation/views/home_view.dart';
import 'package:trendiva/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:trendiva/features/product_details/presentation/views/product_details_view.dart';
import 'package:trendiva/features/profile/presentation/views/edit_profile_view.dart';
import 'package:trendiva/features/splash/presentation/views/splash_view.dart';
import 'package:trendiva/root_view.dart';

import 'routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());

      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.signupView:
        return MaterialPageRoute(builder: (_) => const SignupView());

      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.productDetails:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsView(product: product),
        );

      case Routes.rootView:
        return MaterialPageRoute(builder: (_) => const RootView());

      case Routes.forgetPasswordView:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());

      case Routes.otpView:
        final args = settings.arguments as OtpScreenArgs;
        return MaterialPageRoute(
          builder: (_) => OtpVerificationScreen(args: args),
        );
      case Routes.changePasswordView:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => ChangePasswordView(
            email: args['email']!,
            otp: args['otp']!,
          ),
        );

      case Routes.aboutUsView:
        return MaterialPageRoute(builder: (_) => const AboutUsView());

      case Routes.editProfileView:
        return MaterialPageRoute(builder: (_) => const EditProfileView());

      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
