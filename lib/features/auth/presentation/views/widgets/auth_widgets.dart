import 'package:flutter/material.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';
import 'package:nti_final_project/core/utils/app_text_styles.dart';

const logoPath = 'assets/images/trendiva_logo.png';

Widget gap(double h) => SizedBox(height: h);
Widget gapW(double w) => SizedBox(width: w);

Widget logo({double size = 58, double radius = 16}) => ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        logoPath,
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );

Widget card(List<Widget> children) => Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(children: children),
    );

Widget field({
  required String label,
  required String hint,
  required TextEditingController controller,
  IconData? icon,
  Widget? suffix,
  Widget? end,
  bool hide = false,
  TextInputType? type,
  double vertical = 16,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      end == null
          ? Text(label, style: AppTextStyles.authLabel)
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: AppTextStyles.authLabel),
                end,
              ],
            ),

      gap(8),

      TextField(
        controller: controller,
        obscureText: hide,
        obscuringCharacter: '•',
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.authHint,
          prefixIcon: icon == null
              ? null
              : Icon(
                  icon,
                  size: 20,
                  color: Colors.black54,
                ),
          suffixIcon: suffix,
          filled: true,
          fillColor: AppColors.authFieldColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: vertical,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ],
  );
}

Widget eye(bool hidden, VoidCallback onTap) => IconButton(
      onPressed: onTap,
      icon: Icon(
        hidden ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        size: 20,
        color: Colors.black54,
      ),
    );

Widget authButton({
  required String text,
  required VoidCallback onTap,
  IconData? icon,
  double height = 52,
  double alpha = 0.3,
}) {
  return SizedBox(
    width: double.infinity,
    height: height,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        shadowColor: AppColors.primaryColor.withValues(alpha: alpha),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: icon == null
          ? Text(text, style: AppTextStyles.authButton)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text, style: AppTextStyles.authButton),
                gapW(8),
                Icon(icon, size: 18),
              ],
            ),
    ),
  );
}

Widget switchText(String text, String action, VoidCallback onTap) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.authSmallText.copyWith(fontSize: 14),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            action,
            style: AppTextStyles.authLink,
          ),
        ),
      ],
    );

Widget brand() => Row(
      children: [
        logo(size: 32, radius: 9),
        gapW(8),
        Text(
          'Trendiva',
          style: AppTextStyles.authLogoTitle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );

Widget terms(bool value, ValueChanged<bool?> onChanged) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            value: value,
            activeColor: AppColors.primaryColor,
            onChanged: onChanged,
          ),
        ),
        gapW(8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.authSmallText.copyWith(
                fontSize: 12,
                height: 1.4,
              ),
              children: [
                const TextSpan(text: 'I agree to the '),
                TextSpan(
                  text: 'Terms & Conditions',
                  style: AppTextStyles.authLink.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: ' and Privacy\nPolicy'),
              ],
            ),
          ),
        ),
      ],
    );