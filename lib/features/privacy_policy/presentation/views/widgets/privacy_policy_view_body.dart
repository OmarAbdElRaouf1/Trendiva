import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/features/privacy_policy/presentation/views/widgets/policy_section.dart';

class PrivacyPolicyViewBody extends StatelessWidget {
  const PrivacyPolicyViewBody({super.key});

  static const _sections = [
    (
      title: 'Introduction',
      body:
          'Trendiva ("we", "us", "our") respects your privacy. This policy '
          'explains what information we collect when you use the app, how '
          'we use it, and the choices you have.',
    ),
    (
      title: 'Information We Collect',
      body:
          'We collect the information you provide directly, such as your '
          'name, email address, shipping address, and order history, as '
          'well as information collected automatically, like device type '
          'and app usage, to help us improve the service.',
    ),
    (
      title: 'How We Use Your Information',
      body:
          'We use your information to process orders, provide customer '
          'support, personalize your shopping experience, and send you '
          'updates about your orders. We do not sell your personal '
          'information to third parties.',
    ),
    (
      title: 'Sharing Your Information',
      body:
          'We share information only with service providers that help us '
          'operate the app — such as payment processing and delivery — '
          'and only to the extent needed to provide those services.',
    ),
    (
      title: 'Cookies & Tracking',
      body:
          'The app may use local storage on your device to remember your '
          'preferences, such as your theme setting and cart contents, so '
          'your experience stays consistent between sessions.',
    ),
    (
      title: 'Data Security',
      body:
          'We use industry-standard measures to protect your data, '
          'including encrypted connections between the app and our '
          'servers. No method of transmission is 100% secure, but we work '
          'to protect your information at every step.',
    ),
    (
      title: 'Your Rights',
      body:
          'You can review and update your profile information at any '
          'time from the app, and you may request that we delete your '
          'account and associated data by contacting our support team.',
    ),
    (
      title: 'Changes to This Policy',
      body:
          'We may update this policy from time to time. If we make '
          'significant changes, we\'ll let you know through the app.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Last updated: July 2026',
            style: TextStyle(fontSize: 12, color: context.colors.textMuted),
          ),
          const Gap(20),
          for (final section in _sections) ...[
            PolicySection(title: section.title, body: section.body),
            const Gap(24),
          ],
        ],
      ),
    );
  }
}
