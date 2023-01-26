import 'package:flutter/material.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';

class PrimaryBtn extends StatelessWidget {
  final String label;
  final Function() onpress;
  final double hr, vr, width;
  PrimaryBtn({
    super.key,
    required this.label,
    required this.onpress,
    this.width = 100,
    this.hr = 0,
    this.vr = 5,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: hr, vertical: vr),
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          decoration: BoxDecoration(
            gradient: AppColors.cyanGradient,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            label,
            style: MyTextStyles.customStyle(
              fontsize: 14,
              fontWeight: FontWeight.w500,
              fontcolor: AppColors.greyAccentColor,
            ),
          )),
    );
  }
}
