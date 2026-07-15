import 'package:flutter/material.dart';
import 'package:trendiva/core/widgets/simple_app_bar.dart';
import 'package:trendiva/features/help_center/presentation/views/widgets/help_center_view_body.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SimpleAppBar(title: 'Help Center'),
      body: HelpCenterViewBody(),
    );
  }
}
