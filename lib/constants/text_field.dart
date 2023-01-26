import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';

Widget myInpField(
    {required String label,
    required TextEditingController controller,
    double width = 285,
    double height = 50,
    TextInputType keytype = TextInputType.name,
    int maxlen = 200,
    double hr = 15,
    double vr = 10,
    bool ispassword = false,
    bool digitsonly = false,
    String? Function(String?)? validate}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 5,
    ),
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: AppColors.whiteColor.withOpacity(0.95),
      borderRadius: BorderRadius.circular(8),
    ),
    margin: EdgeInsets.symmetric(horizontal: hr, vertical: vr),
    child: TextFormField(
      validator: validate,
      controller: controller,
      obscureText: ispassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        border: InputBorder.none,
        hintText: label,
        hintStyle: MyTextStyles.customStyle(
          fontsize: 14,
          fontWeight: FontWeight.w500,
        ),
        counterText: "",
        counter: null,
      ),
      inputFormatters:
          digitsonly ? [FilteringTextInputFormatter.digitsOnly] : [],
      keyboardType: keytype,
      maxLength: maxlen,
    ),
  );
}
