import 'package:flutter/material.dart';

class AppColors {
  static LinearGradient bgGradient = LinearGradient(
    colors: [
      Color(0xff0E3364),
      Colors.black,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient cyanGradient = LinearGradient(
    colors: [
      Color(0xff79DFC8),
      Color(0xff7A9CE0),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Color greyColor = Color(0xffB3B3B3);

  static const Color greyAccentColor = Color(0xff2F3859);

  static Color whiteColor = Color(0xffFFFFFF).withOpacity(0.9);

  static Color darkGreyColor = Color(0xff000000).withOpacity(0.27);

  static Color darkBlueColor = Color(0xff0E3364);
  static const Color lightBlue = Color(0xff8DEBFF);
  static Color bgWhite = Color(0xffffffff).withOpacity(0.05);
}
