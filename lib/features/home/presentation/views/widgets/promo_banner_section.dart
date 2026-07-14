import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/features/home/data/models/offer_model.dart';

class PromoBannerSection extends StatelessWidget {
  const PromoBannerSection({super.key, required this.offers});

  final List<OfferModel> offers;

  @override
  Widget build(BuildContext context) {
    if (offers.isEmpty) return const SizedBox.shrink();

    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 248,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        separatorBuilder: (_, _) => Gap(12.w),
        itemBuilder: (context, index) {
          return PromoCard(width: width * .78, offer: offers[index]);
        },
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({super.key, required this.width, required this.offer});

  final double width;
  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: offer.coverUrl,
              fit: BoxFit.cover,
              placeholder: (_, _) => const _BannerFallback(),
              errorWidget: (_, _, _) => const _BannerFallback(),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withValues(alpha: .55),
                    Colors.black.withValues(alpha: .10),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("LIMITED OFFER", style: AppTextStyles.bannerTag),

                  Gap(10.h),

                  Text(
                    offer.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bannerTitle,
                  ),

                  Gap(5.h),

                  Text(
                    offer.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bannerSubtitle,
                  ),

                  Gap(22.h),

                  SizedBox(
                    height: 46.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(horizontal: 28.w),
                      ),
                      child: Text(
                        "Shop Now",
                        style: AppTextStyles.bannerButton,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BannerFallback extends StatelessWidget {
  const _BannerFallback();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2B2B28), Color(0xFF4A4A42)],
        ),
      ),
    );
  }
}
