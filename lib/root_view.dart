import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/features/cart/presentation/views/cart_view.dart';
import 'package:nti_final_project/features/home/presentation/views/home_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late final PageController pageController;
  late final List<Widget> screens;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
    screens = [
      HomeView(),
      const CartView(),
      const Placeholder(),
      const Placeholder(),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onTabChange(int index) {
    setState(() => currentIndex = index);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) => setState(() => currentIndex = index),
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: GNav(
              selectedIndex: currentIndex,
              onTabChange: _onTabChange,
              gap: 8,
              color: Colors.white,
              activeColor: AppColors.primaryColor,
              tabBackgroundColor: Colors.white,
              tabBorderRadius: 30,
              iconSize: 24,
              curve: Curves.easeOutCubic,
              duration: const Duration(milliseconds: 350),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              textStyle: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              tabs: const [
                GButton(icon: CupertinoIcons.home, text: "Home"),
                GButton(icon: CupertinoIcons.cart, text: "Cart"),
                GButton(icon: CupertinoIcons.clock, text: "Orders"),
                GButton(icon: CupertinoIcons.person, text: "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
