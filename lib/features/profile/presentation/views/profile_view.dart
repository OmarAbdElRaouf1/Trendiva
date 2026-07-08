import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/features/profile/presentation/views/widgets/profile_app_bar.dart';
import 'package:nti_final_project/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.profileBackgroundColor,
      appBar: ProfileAppBar(),
      body: ProfileViewBody(),
    );
  }
}
