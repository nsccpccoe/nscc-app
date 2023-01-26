import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';

// TODO : Change name to GradientButton
// TODO : Take input of gradient as done in Gradient Text
// TODO : Also take input named as VoidcallBack ontap and wrap container with GestureDetector and assign this ontap to it
class CyanGradientButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  CyanGradientButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: AppColors.cyanGradient,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: Text(
          text,
          style: MyTextStyles.poppins500
              .copyWith(fontSize: 14.sp, color: AppColors.greyAccentColor),
        ),
      ),
    );
  }
}
