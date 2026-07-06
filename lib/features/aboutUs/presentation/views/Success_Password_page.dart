import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/features/auth/presentation/views/widgets/login_view.dart';
import 'Custom_Button.dart';

class successPass extends StatelessWidget {
  const successPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.secondaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: const Color(0xffEEF5F2),
              child: Icon(Icons.check, size: 45, color: AppColors.primaryColor),
            ),

            const SizedBox(height: 30),

            const Text(
              "Password Changed Successfully",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.neutralColor,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Your password has been updated.\n"
              "You can now use your new password\n"
              "to log in to your account.",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.tertiaryColor, fontSize: 18),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: CustomButton(
                Title: "Back to Login",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
