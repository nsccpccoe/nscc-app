import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/widgets/gradient_button.dart';
import 'package:nscc_app/widgets/gradient_text.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final Function onpress;
  final String buttonLabel;
  final int titleFontSize;
  final bool isdatevisible;
  const EventCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.onpress,
    this.buttonLabel = "Register",
    this.titleFontSize = 30,
    this.isdatevisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            subtitle,
            style: MyTextStyles.poppins400,
          ),
        ),
        GradientText(
          title,
          gradient: AppColors.cyanGradient,
          style: MyTextStyles.poppins700.copyWith(fontSize: titleFontSize.sp),
        ),
        isdatevisible
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  date,
                  style: MyTextStyles.poppins500,
                ),
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: GradientButton(
            onTap: () {
              onpress();
            },
            height: 30.h,
            width: 80.w,
            text: buttonLabel,
            gradient: AppColors.cyanGradient,
          ),
        )
      ]),
    );
  }
}
