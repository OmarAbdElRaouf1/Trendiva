import 'package:flutter/material.dart';
import 'package:nti_final_project/features/aboutUs/presentation/views/widgets/features_card.dart';

class AboutFeaturesSection extends StatelessWidget {
  const AboutFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeatureCard(
          icon: Icons.workspace_premium,
          title: 'Excellence',
          subtitle:
              'A relentless pursuit of perfection in every stitch and '
              'silhouette.',
        ),
        FeatureCard(
          icon: Icons.eco_outlined,
          title: 'Sustainability',
          subtitle:
              'Protecting our planet through renewable materials and ethical '
              'labor.',
        ),
        FeatureCard(
          icon: Icons.lightbulb_outline,
          title: 'Innovation',
          subtitle:
              'Merging digital precision with traditional textile heritage.',
        ),
      ],
    );
  }
}
