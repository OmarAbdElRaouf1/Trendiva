import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_final_project/features/profile/presentation/views/widgets/item_prefrences.dart';
import 'package:nti_final_project/features/profile/presentation/views/widgets/item_support.dart';

import 'widgets/profile_stats.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcf9f8),
      appBar: AppBar(
        backgroundColor: Color(0xFFFCF9F8),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/app_bar_icons/options.svg'),
        ),
        title: Text(
          'Trendiva',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF00342B),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/app_bar_icons/notification.svg',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(3), // سمك البوردر
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF004D40),
                    width: 2,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage(
                    'assets/photos/profile_photo.png',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Mahmoud Elsebaei',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1C1B1B),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'mahmoudelsebaei@trendiva.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF3F4945),
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileStats(numOfStats: '12', textOfStats: 'ORDERS'),
                  SizedBox(width: 16),
                  ProfileStats(numOfStats: '08', textOfStats: 'WISHLIST'),
                  SizedBox(width: 16),

                  ProfileStats(numOfStats: '24', textOfStats: 'REVIEWS'),
                ],
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PREFERENCES & ACCOUNT',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5D5F5C),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  spacing: 1,
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/profile_icons/acc_settings.svg',
                          ),
                          SizedBox(width: 24),
                          ItemPreferences(
                            title: 'Account Settings',
                            description: 'Change Password, Security',
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/icons/profile_icons/show.svg',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(
                      color: Color(0xFFE5E2E1),
                      indent: 15,
                      endIndent: 15,
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/profile_icons/theme.svg',
                          ),
                          SizedBox(width: 24),
                          ItemPreferences(
                            title: 'App Theme',
                            description: 'Switch between Light/Dark',
                          ),
                          Spacer(),
                          Switch(
                            value: false,
                            onChanged: (value) {},
                            activeThumbColor: Color(0xFF00342B),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              SizedBox(height: 8),

              // هعملها custom
              SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SUPPORT',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5D5F5C),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  spacing: 1,
                  children: [
                    ItemSupport(
                      iconSupport: 'assets/icons/profile_icons/help_center.svg',
                      textSupport: 'Help Center',
                    ),
                    Divider(
                      color: Color(0xFFE5E2E1),
                      indent: 15,
                      endIndent: 15,
                    ),

                    ItemSupport(
                      iconSupport:
                          'assets/icons/profile_icons/privacy_policy.svg',
                      textSupport: 'Privacy Policy',
                    ),
                    Divider(
                      color: Color(0xFFE5E2E1),
                      indent: 15,
                      endIndent: 15,
                    ),

                    ItemSupport(
                      iconSupport: 'assets/icons/profile_icons/about_us.svg',
                      textSupport: 'About Us',
                    ),
                    Divider(
                      color: Color(0xFFE5E2E1),
                      indent: 15,
                      endIndent: 15,
                    ),

                    ItemSupport(
                      iconSupport: 'assets/icons/profile_icons/contact_us.svg',
                      textSupport: 'Contact Us',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 8),
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xFFfdf0ee),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    SvgPicture.asset('assets/icons/profile_icons/logout.svg'),
                    SizedBox(width: 24),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFBA1A1A),
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Trendiva Version 2.4.0 (Emerald Build)',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3F4945),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/navigation_bar_icons/home.svg',
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/navigation_bar_icons/search.svg',
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/navigation_bar_icons/bag.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/navigation_bar_icons/account.svg',
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
