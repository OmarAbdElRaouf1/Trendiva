import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:trendiva/core/helpers/extensions.dart';
import 'package:trendiva/core/utils/app_text_styles.dart';
import 'package:trendiva/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back, size: 25.sp),
        ),
        title: Text(
          'Edit Profile',
          style: AppTextStyles.profileAppBarTitle(context),
        ),
      ),
      body: const EditProfileViewBody(),
    );
  }
}
