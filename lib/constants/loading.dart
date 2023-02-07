import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nscc_app/constants/colors.dart';

class Loadings {
  static Widget basic() {
    return SpinKitFadingFour(
      color: AppColors.lightBlue,
      size: 50.0,
    );
  }
}
