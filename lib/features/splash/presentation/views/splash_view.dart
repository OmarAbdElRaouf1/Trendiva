import 'package:flutter/material.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/utils/pref_helper.dart';
import '../widgets/splash_logo_box.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;
      final token = await PrefHelper.getToken();
      if (!mounted) return;
      final isLoggedIn = token != null && token.isNotEmpty;
      Navigator.pushReplacementNamed(
        context,
        isLoggedIn ? Routes.rootView : Routes.onBoardingView,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff004D40), Color(0xff003D34)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SplashLogoBox(),
              SizedBox(height: 28),
              Text(
                'Trendiva',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Redefining Trendy Shopping',
                style: TextStyle(
                  color: Color(0xffA8D8CF),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 34),
              Text(
                '•••',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'CURATING YOUR STYLE',
                style: TextStyle(
                  color: Color(0xffB7DCD5),
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
