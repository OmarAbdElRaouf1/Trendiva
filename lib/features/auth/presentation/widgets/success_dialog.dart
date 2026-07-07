import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_final_project/core/helpers/extensions.dart';
import 'package:nti_final_project/core/routing/routes.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';
import 'package:nti_final_project/core/widgets/custom_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.secondaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 45.r,
              backgroundColor: const Color(0xffEEF5F2),
              child: SvgPicture.asset(
                'assets/images/success_dialog.svg',
                width: 30.w,
                height: 30.h,
              ),
            ),
            Gap(30.h),
            const Text(
              'Password Changed Successfully',
              textAlign: TextAlign.center,
              style: AppTextStyles.successDialogTitle,
            ),
            Gap(20.h),
            Text(
              'Your password has been updated. You can now use your new '
              'password to log in to your account.',
              textAlign: TextAlign.center,
              style: AppTextStyles.successDialogText,
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
