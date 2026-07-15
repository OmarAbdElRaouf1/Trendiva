import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/features/contact_us/presentation/views/widgets/contact_detail_item.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'We\'re here to help',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: context.colors.textPrimary,
            ),
          ),
          const Gap(8),
          Text(
            'Have a question about an order, a product, or your account? '
            'Reach out to us through any of the channels below and our '
            'team will get back to you as soon as possible.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: context.colors.textSecondary,
            ),
          ),
          const Gap(28),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const ContactDetailItem(
                  icon: Icons.mail_outline,
                  label: 'Email',
                  value: 'concierge@trendiva.com',
                ),
                const Gap(20),
                const ContactDetailItem(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  value: '+33 1 42 68 82 00',
                ),
                const Gap(20),
                const ContactDetailItem(
                  icon: Icons.location_on_outlined,
                  label: 'Address',
                  value: '24 Avenue Montaigne, Paris, France',
                ),
                const Gap(20),
                const ContactDetailItem(
                  icon: Icons.schedule_outlined,
                  label: 'Support Hours',
                  value: 'Mon – Fri, 9:00 AM – 6:00 PM CET',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
