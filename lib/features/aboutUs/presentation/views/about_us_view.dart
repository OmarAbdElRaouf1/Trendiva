import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/features/aboutUs/presentation/views/features_card.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.arrow_back, size: 25),
          actions: [
            Icon(Icons.notifications_none, size: 25),
            SizedBox(width: 19),
          ],
          title: Text(
            "Trendiva",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff00342B),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 530,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "assets/images/Image.png",
                        fit: BoxFit.cover,
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(.6),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 25,
                      // child: Padding(
                      //   padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ESTABLISHED 1994",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            "Effortless",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight(400),
                              color: AppColors.primaryColor,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Luxury,',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Defined.',
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 40,
                                    // fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 28),
                    Text(
                      "Our Story",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '''Trendiva began with a singular vision: to
reconcile the fast-paced world of
fashion with the timeless patience of
artisan craftsmanship. What started in a
small atelier has evolved into a global
symbol of sophisticated style.''',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '''Our commitment to effortless luxury is woven
into every thread of our sustainable silk
collections. We believe that true fashion
shouldn't cost the earth, which is why our
craftsmanship prioritizes ethical sourcing and
zero-waste production cycles.''',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 76),
                    FeatureCard(
                      icon: Icons.workspace_premium,
                      title: "Excellence",
                      subtitle: '''A relentless pursuit of perfection in
                    every stitch and silhouette.''',
                    ),

                    FeatureCard(
                      icon: Icons.eco_outlined,
                      title: "Sustainability",
                      subtitle: '''Protecting our planet through
                    renewable materials and ethical
                    labor.''',
                    ),

                    FeatureCard(
                      icon: Icons.lightbulb_outline,
                      title: "Innovation",
                      subtitle: '''Merging digital precision with
                    traditional textile heritage.''',
                    ),
                    SizedBox(height: 70),
                    Text(
                      "Trendiva HQ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          "24 Avenue Montaigne, Paris, France",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.mail_outline),
                        Text(
                          "concierge@trendiva.com",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.phone_outlined),
                        Text(
                          "+33 1 42 68 82 00",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 67),
                    Text(
                      "FOLLOW OUR JOURNEY",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      spacing: 32,
                      children: [
                        Icon(Icons.campaign_outlined),
                        Icon(Icons.camera_alt_outlined),
                        Icon(Icons.language),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "© 2024 Trendiva Fashion Group. All rights reserved.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    ;
  }
}
