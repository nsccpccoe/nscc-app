import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';

class GradientButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Gradient gradient;
  final VoidCallback onTap;
  GradientButton({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.gradient,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: Text(
            text,
            style: MyTextStyles.poppins500
                .copyWith(fontSize: 14.sp, color: AppColors.greyAccentColor),
          ),
        ),
      ),
    );
  }
}
