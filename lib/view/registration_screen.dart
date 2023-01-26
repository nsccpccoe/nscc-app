import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_field.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/controllers/registration_controller.dart';
import 'package:nscc_app/widgets/gradient_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nscc_app/widgets/cyan_gradient_button.dart';
import 'package:nscc_app/widgets/registration_title_text.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final registrationController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            // TODO : Create a commong app bar widget called as MyAppBar()
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Icon(
              Icons.menu,
            ),
            title: SvgPicture.asset(
              "assets/svg/nscc_club_name.svg",
              width: 170.w,
              height: 35.h,
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 45.h,
                    ),
                    Container(
                      height: 800.h,
                      width: 320.w,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Registration Form",
                            style: MyTextStyles.poppins400
                                .copyWith(color: AppColors.whiteColor),
                          ),
                          GradientText(
                            "CodeHive Contest",
                            style: MyTextStyles.poppins700
                                .copyWith(fontSize: 25.sp),
                            gradient: AppColors.cyanGradient,
                          ),
                          Text(
                            "Competitive Programming Contest",
                            style: MyTextStyles.poppins400.copyWith(
                                fontSize: 10.sp, color: AppColors.greyColor),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.darkBlueColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 70.w, vertical: 10.h),
                              side: BorderSide(
                                color: AppColors.whiteColor,
                                width: 1.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                            ),
                            child: Text(
                              "Prizes and Goodies - Learn More",
                              style: MyTextStyles.poppins400.copyWith(
                                  fontSize: 10.sp, color: AppColors.greyColor),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          RegistrationTitleText(text: "Full Name"),
                          myInpField(
                            label: "Enter Full Name",
                            controller: controller.nameController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RegistrationTitleText(text: "Email ID"),
                          myInpField(
                            label: "Enter Email ID",
                            controller: controller.emailController,
                            keytype: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RegistrationTitleText(text: "Gender"),
                          // TODO : This is drop down not an text field
                          myInpField(
                            label: "Enter Gender",
                            controller: controller.genderController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RegistrationTitleText(text: "College Name"),
                          myInpField(
                            label: "Enter College Name",
                            controller: controller.collegeNameController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RegistrationTitleText(text: "Graduation Year"),
                          // TODO : Give max length
                          myInpField(
                            label: "Enter Graduation Year",
                            controller: controller.graduationYearController,
                            digitsonly: true,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RegistrationTitleText(
                              text: "HackerRank Profile Link"),
                          myInpField(
                            label: "Enter HackerRank Profile Link",
                            controller: controller.hackerRankLinkController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    // TODO : Shift this onTap implementation inside CyanGradientButton
                    GestureDetector(
                      onTap: () {},
                      child: CyanGradientButton(
                        height: 50.h,
                        width: 280.w,
                        text: "Register for CodeHive Contest",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
