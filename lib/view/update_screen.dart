import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/widgets/gradient_border.dart';
import 'package:nscc_app/widgets/gradient_button.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppColors.bgGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // width: 30.w,
                  height: 300.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: SvgPicture.asset(
                            "assets/svg/nscc_club_name.svg",
                            height: 65.h,
                            width: 430.w,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Unleash your web development skills in our 8-day hackathon! Explore trending tech, build and showcase your website, win prizes and goodies.",
                          style: MyTextStyles.poppins400.copyWith(
                            color: AppColors.greyColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UnicornOutlineButton(
                              strokeWidth: 2,
                              radius: 4.r,
                              minWidth: 120.w,
                              minHeight: 45.h,
                              gradient: AppColors.cyanGradient,
                              child: Text(
                                "Exit",
                                style: MyTextStyles.poppins500
                                    .copyWith(fontSize: 14.sp),
                              ),
                              onPressed: () {
                                FlutterExitApp.exitApp();
                              },
                            ),
                            GradientButton(
                              height: 45.h,
                              width: 120.w,
                              text: "Update",
                              gradient: AppColors.cyanGradient,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
