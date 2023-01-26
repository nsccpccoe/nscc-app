import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';

class CyanGradientButton extends StatelessWidget {
  final double height;
  final double width;
  String text;
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
