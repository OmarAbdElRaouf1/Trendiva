import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/features/aboutUs/presentation/views/about_us_view.dart';
import 'package:trendiva/features/auth/presentation/views/change_password_view.dart';
import 'package:trendiva/features/auth/presentation/views/forget_password_view.dart';
import 'package:trendiva/features/auth/presentation/views/login_view.dart';
import 'package:trendiva/features/auth/presentation/views/otp_screen.dart';
import 'package:trendiva/features/auth/presentation/views/signup_view.dart';
import 'package:trendiva/features/contact_us/presentation/views/contact_us_view.dart';
import 'package:trendiva/features/help_center/presentation/views/help_center_view.dart';
import 'package:trendiva/features/home/domain/entities/product_entity.dart';
import 'package:trendiva/features/home/presentation/views/home_view.dart';
import 'package:trendiva/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:trendiva/features/privacy_policy/presentation/views/privacy_policy_view.dart';
import 'package:trendiva/features/product_details/presentation/cubit/reviews_cubit.dart';
import 'package:trendiva/features/product_details/presentation/views/all_reviews_view.dart';
import 'package:trendiva/features/product_details/presentation/views/product_details_view.dart';
import 'package:trendiva/features/product_details/presentation/views/write_review_view.dart';
import 'package:trendiva/features/profile/presentation/cubit/profile_cubit.dart';
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
        final product = settings.arguments as ProductEntity;
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

      case Routes.helpCenterView:
        return MaterialPageRoute(builder: (_) => const HelpCenterView());

      case Routes.privacyPolicyView:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyView());

      case Routes.contactUsView:
        return MaterialPageRoute(builder: (_) => const ContactUsView());

      case Routes.editProfileView:
        final cubit = settings.arguments as ProfileCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: const EditProfileView(),
          ),
        );

      case Routes.allReviewsView:
        final cubit = settings.arguments as ReviewsCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: const AllReviewsView(),
          ),
        );

      case Routes.writeReviewView:
        final cubit = settings.arguments as ReviewsCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: const WriteReviewView(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
