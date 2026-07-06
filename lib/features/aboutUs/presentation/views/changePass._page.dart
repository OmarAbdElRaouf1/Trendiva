import 'package:flutter/material.dart';
import 'package:nti_final_project/features/aboutUs/presentation/views/Custom_Button.dart';
import 'package:nti_final_project/features/aboutUs/presentation/views/Password%20Strength%20Widget.dart';
import 'package:nti_final_project/features/aboutUs/presentation/views/Success_Password_page.dart';
import 'package:nti_final_project/features/aboutUs/presentation/views/custom_field.dart';
import 'package:nti_final_project/core/utils/app_colors.dart';

class change extends StatefulWidget {
  change({super.key});

  @override
  State<change> createState() => _changeState();
}

bool ishidden = true;

class _changeState extends State<change> {
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
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                Text(
                  "Create New Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '''Your new password must be different from
previous used passwords.''',
                  style: TextStyle(
                    color: Color(0xff3F4945),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24),
                customField(
                  title: "New Password",
                  name: "********",
                  obscureText: ishidden,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ishidden = !ishidden;
                      });
                    },
                    icon: Icon(
                      ishidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                PasswordStrength(),
                SizedBox(height: 24),
                customField(
                  title: "Confirm New Password",
                  name: "********",
                  obscureText: ishidden,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ishidden = !ishidden;
                      });
                    },
                    icon: Icon(
                      ishidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(color: AppColors.secondaryColor),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            SizedBox(width: 8),
                            Text(
                              "At least 8 characters",
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
                            Icon(Icons.check_circle_outline),
                            SizedBox(width: 8),
                            Text(
                              "Include at least one number",
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
                            Icon(Icons.check_circle_outline),
                            SizedBox(width: 8),
                            Text(
                              "One special character (@!%*+?)",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 48),
                CustomButton(
                  Title: "Reset Password",
                  onPressed: () => showDialog(
                    context: context,
                    barrierColor: Colors.black.withOpacity(.45),
                    barrierDismissible: false,
                    builder: (_) => const successPass(),
                  ),
                  //()=> Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => successPass()),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
