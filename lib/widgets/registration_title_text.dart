import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/text_styles.dart';

class RegistrationTitleText extends StatelessWidget {
  final String text;
  RegistrationTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: MyTextStyles.poppins500.copyWith(fontSize: 12.sp),
        ),
      ),
    );
  }
}
