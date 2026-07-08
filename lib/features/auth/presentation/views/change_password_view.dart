import 'package:flutter/material.dart';
import 'package:trendiva/features/auth/presentation/widgets/change_password_app_bar.dart';
import 'package:trendiva/features/auth/presentation/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChangePasswordAppBar(),
      body: ChangePasswordViewBody(),
    );
  }
}
