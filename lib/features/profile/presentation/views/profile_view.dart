import 'package:flutter/material.dart';
import 'package:trendiva/core/widgets/custom_app_bar.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppBar(), body: ProfileViewBody());
  }
}
