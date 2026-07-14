import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/routing/routes.dart';
import 'package:trendiva/core/theme/app_theme_colors.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/core/widgets/custom_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.surfaceMuted,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 45.r,
              backgroundColor: context.colors.chipTint,
              child: SvgPicture.asset(
                'assets/images/success_dialog.svg',
                width: 30.w,
                height: 30.h,
              ),
            ),
            Gap(30.h),
            Text(
              'Password Changed Successfully',
              textAlign: TextAlign.center,
              style: AppTextStyles.successDialogTitle(context),
            ),
            Gap(20.h),
            Text(
              message ??
                  'Your password has been updated. You can now use your new '
                      'password to log in to your account.',
              textAlign: TextAlign.center,
              style: AppTextStyles.successDialogText(context),
            ),
            Gap(30.h),
            CustomButton(
              text: 'Back to Login',
              onPressed: () {
                context.pushAndRemoveUntil(Routes.loginView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
