
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendiva/core/di/service_locator.dart';
import 'package:trendiva/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:trendiva/features/auth/presentation/views/widgets/change_password_app_bar.dart';
import 'package:trendiva/features/auth/presentation/views/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key, required this.email, required this.otp});

  final String email;
  final String otp;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>(),
      child: Scaffold(
        appBar: const ChangePasswordAppBar(),
        body: ChangePasswordViewBody(email: email, otp: otp),
      ),
    );
  }
}
