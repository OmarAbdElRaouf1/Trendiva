import 'package:flutter/material.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/features/help_center/presentation/views/widgets/faq_tile.dart';

class HelpCenterViewBody extends StatelessWidget {
  const HelpCenterViewBody({super.key});

  static const _faqs = [
    (
      question: 'How do I track my order?',
      answer:
          'Once your order ships, you can track it anytime from Profile > '
          'Orders. You\'ll see the current status and an estimated delivery '
          'date for each order.',
    ),
    (
      question: 'What is your return policy?',
      answer:
          'Items can be returned within 14 days of delivery, as long as '
          'they are unused and in their original packaging. Refunds are '
          'issued to your original payment method once the return is '
          'received.',
    ),
    (
      question: 'Can I change or cancel my order?',
      answer:
          'Orders can be changed or cancelled within 1 hour of placing '
          'them. After that, the order may already be processing and '
          'can\'t be modified — you can still return it once delivered.',
    ),
    (
      question: 'What payment methods do you accept?',
      answer:
          'We accept all major credit and debit cards. Payment is '
          'processed securely at checkout and your card details are never '
          'stored on our servers.',
    ),
    (
      question: 'How do I reset my password?',
      answer:
          'On the login screen, tap "Forgot Password?" and enter your '
          'email. We\'ll send you a verification code to set a new '
          'password.',
    ),
    (
      question: 'Do you ship internationally?',
      answer:
          'Yes, we currently ship to most countries. Shipping cost and '
          'delivery time are calculated at checkout based on your '
          'address.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: _faqs.length,
      separatorBuilder: (_, _) =>
          Divider(height: 1, color: context.colors.divider),
      itemBuilder: (context, index) {
        final faq = _faqs[index];
        return FaqTile(question: faq.question, answer: faq.answer);
      },
    );
  }
}
