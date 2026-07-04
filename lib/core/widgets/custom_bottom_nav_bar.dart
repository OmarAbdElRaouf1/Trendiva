import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(35),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: GNav(
          selectedIndex: currentIndex,
          onTabChange: onTap,
          gap: 8,
          rippleColor: Colors.transparent,
          hoverColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          color: Colors.white70,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.white24,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          tabs: const [
            GButton(icon: Icons.home_rounded, text: 'Home'),

            GButton(icon: Icons.shopping_bag_outlined, text: 'Cart'),
            GButton(icon: Icons.person_outline, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
