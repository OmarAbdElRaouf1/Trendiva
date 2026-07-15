import 'package:flutter/material.dart';
import 'package:trendiva/core/widgets/simple_app_bar.dart';
import 'package:trendiva/features/privacy_policy/presentation/views/widgets/privacy_policy_view_body.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SimpleAppBar(title: 'Privacy Policy'),
      body: PrivacyPolicyViewBody(),
    );
  }
}
