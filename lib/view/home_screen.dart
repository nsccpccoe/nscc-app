import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/router/routes_names.dart';
import 'package:nscc_app/widgets/cyan_gradient.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.bgGradient,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              CyanGradient(
                "HOME SCREEN",
                gradient: AppColors.cyanGradient,
                style: MyTextStyles.poppins700,
              ),
              SizedBox(
                height: 100.h,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    RoutesNames.eventScreen,
                  );
                },
                child: CyanGradient(
                  "EVENTS",
                  gradient: AppColors.cyanGradient,
                  style: MyTextStyles.poppins600,
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    RoutesNames.registrationScreen,
                  );
                },
                child: CyanGradient(
                  "REGISTRATION",
                  gradient: AppColors.cyanGradient,
                  style: MyTextStyles.poppins600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
