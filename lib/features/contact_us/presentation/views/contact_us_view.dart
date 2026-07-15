import 'package:flutter/material.dart';
import 'package:trendiva/core/widgets/simple_app_bar.dart';
import 'package:trendiva/features/contact_us/presentation/views/widgets/contact_us_view_body.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SimpleAppBar(title: 'Contact Us'),
      body: ContactUsViewBody(),
    );
  }
}
