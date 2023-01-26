import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/controllers/registration_controller.dart';
import 'package:nscc_app/widgets/cyan_gradient.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nscc_app/widgets/cyan_gradient_button.dart';
import 'package:nscc_app/widgets/registration_form_field.dart';

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
                      height: 650.h,
                      width: 320.w,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor.withOpacity(0.2),
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
                          CyanGradient(
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
                          RegistrationFormField(
                            hintText: "Enter Full Name",
                            labelText: "Full Name",
                            controller: controller.nameController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RegistrationFormField(
                            hintText: "Enter Email ID",
                            labelText: "Email ID",
                            controller: controller.emailController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RegistrationFormField(
                            hintText: "Enter Gender",
                            labelText: "Gender",
                            controller: controller.genderController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RegistrationFormField(
                            hintText: "Enter College Name",
                            labelText: "College Name",
                            controller: controller.collegeNameController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RegistrationFormField(
                            hintText: "Enter Graduation Year",
                            labelText: "Graduation Year",
                            controller: controller.graduationYearController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RegistrationFormField(
                            hintText: "Enter HackerRank Profile Link",
                            labelText: "HackerRank Profile Link",
                            controller: controller.hackerRankLinkController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
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
