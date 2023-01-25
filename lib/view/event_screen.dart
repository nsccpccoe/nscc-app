import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/widgets/cyan_gradient.dart';
import 'package:lottie/lottie.dart';
import 'package:nscc_app/widgets/gradient_border.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back,
        ),
        title: Text(
          "Pandora Tech Festival",
          style: MyTextStyles.poppins400
              .copyWith(fontSize: 16.sp, color: AppColors.whiteColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppColors.bgGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/svg/illustration_webxplore.svg",
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CyanGradient(
                    "WebXplore",
                    style: MyTextStyles.poppins700.copyWith(fontSize: 30.sp),
                    gradient: AppColors.cyanGradient,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Hackathon",
                    style: MyTextStyles.poppins700
                        .copyWith(color: AppColors.whiteColor),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CyanGradient(
                    "22/01/2023 8:00 AM - 29/01/2023 1159 PM IST",
                    style: MyTextStyles.poppins500.copyWith(fontSize: 12.sp),
                    gradient: AppColors.cyanGradient,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Unleash your web development skills in our 8-day hackathon! Explore trending tech, build and showcase your website, win prizes and goodies.",
                    style: MyTextStyles.poppins400
                        .copyWith(color: AppColors.greyColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CyanGradient(
                    "Description",
                    style: MyTextStyles.poppins700,
                    gradient: AppColors.cyanGradient,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "- Unleash your web development skills in our 8-day hackathon! \n - Explore trending tech, build and showcase your website, \n - win prizes and goodies.",
                    style: MyTextStyles.poppins400
                        .copyWith(color: AppColors.greyColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CyanGradient(
                    "Rules",
                    style: MyTextStyles.poppins700,
                    gradient: AppColors.cyanGradient,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    "1. Unleash your web development skills in our 8-day hackathon! \n 2. Explore trending tech, build and showcase your website, \n 3. win prizes and goodies.",
                    style: MyTextStyles.poppins400
                        .copyWith(color: AppColors.greyColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CyanGradient(
                    "Prizes & Goodies",
                    style: MyTextStyles.poppins700,
                    gradient: AppColors.cyanGradient,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: UnicornOutlineButton(
                      strokeWidth: 2,
                      radius: 20.r,
                      gradient: AppColors.cyanGradient,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "First Year",
                            style: MyTextStyles.poppins400.copyWith(color: AppColors.whiteColor),
                          ),
                          SizedBox(
                            height: 85.h,
                          ),
                          Text(
                            "Rs 500/-",
                            style: MyTextStyles.poppins400.copyWith(fontSize: 20.sp, color: AppColors.whiteColor),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
                // Center(
                //   child: Lottie.asset("assets/animation/animation_rupee.json"),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
