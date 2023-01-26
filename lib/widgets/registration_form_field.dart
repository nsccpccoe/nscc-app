import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';

class RegistrationFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  RegistrationFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: MyTextStyles.poppins500
                .copyWith(fontSize: 12.sp, color: AppColors.whiteColor),
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              fillColor: AppColors.whiteColor,
              filled: true,
              hintText: hintText,
              hintStyle: MyTextStyles.poppins500
                  .copyWith(color: AppColors.darkGreyColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
