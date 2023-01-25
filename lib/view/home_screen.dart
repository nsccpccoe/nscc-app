import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';
import 'package:nscc_app/widgets/text_gradient.dart';

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
          child: TextGradient(
            "HOME SCREEN",
            gradient: AppColors.cyanGradient,
            style: MyTextStyles.poppins700,
          ),
        ),
      ),
    );
  }
}
