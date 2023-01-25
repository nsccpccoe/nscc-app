import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/widgets/cyan_gradient.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
        ),
        title: Text("TO ADD SVG"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppColors.bgGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 45.h,
              ),
              Container(
                height: 520.h,
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
                          .copyWith(color: AppColors.greyColor),
                    ),
                    CyanGradient(
                      "CodeHive Contest",
                      style: MyTextStyles.poppins700.copyWith(fontSize: 25.sp),
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
                      
                      child: Text(
                        "Prizes and Goodies - Learn More",
                        style: MyTextStyles.poppins400.copyWith(
                            fontSize: 10.sp, color: AppColors.greyColor),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
