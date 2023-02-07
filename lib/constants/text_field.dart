import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';

class MyTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final double width;
  final double height;
  final TextInputType keytype;
  final int maxlen;
  final double hr;
  final double vr;
  final bool readOnly;
  final bool ispassword;
  final bool digitsonly;
  final String initialValue;
  final String? Function(String?)? validate;

  MyTextField({
    super.key,
    required this.label,
    required this.controller,
    this.width = 285,
    this.height = 50,
    this.keytype = TextInputType.name,
    this.maxlen = 200,
    this.hr = 15,
    this.vr = 10,
    this.readOnly = false,
    this.ispassword = false,
    this.digitsonly = false,
    this.initialValue = "",
    this.validate,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    if (widget.initialValue != "") {
      widget.controller.text = widget.initialValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: widget.width.w,
      height: widget.height.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.95),
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin:
          EdgeInsets.symmetric(horizontal: widget.hr.w, vertical: widget.vr.h),
      child: TextFormField(
        validator: widget.validate,
        controller: widget.controller,
        style: MyTextStyles.customStyle(
          fontsize: 14.sp,
          fontWeight: FontWeight.w500,
          fontcolor: widget.readOnly ? AppColors.greyColor : Colors.black,
        ),
        obscureText: widget.ispassword,
        readOnly: widget.readOnly,
        onFieldSubmitted: (value) {
          widget.controller.text = value;
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
          hintText: widget.label,
          hintStyle: MyTextStyles.customStyle(
            fontsize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          counterText: "",
          counter: null,
        ),
        inputFormatters:
            widget.digitsonly ? [FilteringTextInputFormatter.digitsOnly] : [],
        keyboardType: widget.digitsonly ? TextInputType.number : widget.keytype,
        maxLength: widget.maxlen,
      ),
    );
  }
}

Widget myInpField(
    {required String label,
    required TextEditingController controller,
    double width = 285,
    double height = 50,
    TextInputType keytype = TextInputType.name,
    int maxlen = 200,
    double hr = 15,
    double vr = 10,
    bool readOnly = false,
    bool ispassword = false,
    bool digitsonly = false,
    String initialValue = "",
    String? Function(String?)? validate}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5),
    width: width.w,
    height: height.h,
    decoration: BoxDecoration(
      color: AppColors.whiteColor.withOpacity(0.95),
      borderRadius: BorderRadius.circular(8.r),
    ),
    margin: EdgeInsets.symmetric(horizontal: hr.w, vertical: vr.h),
    child: TextFormField(
      validator: validate,
      controller: controller,
      style: MyTextStyles.customStyle(
        fontsize: 14.sp,
        fontWeight: FontWeight.w500,
        fontcolor: readOnly ? AppColors.greyColor : Colors.black,
      ),
      obscureText: ispassword,
      readOnly: readOnly,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        border: InputBorder.none,
        hintText: label,
        hintStyle: MyTextStyles.customStyle(
          fontsize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        counterText: "",
        counter: null,
      ),
      inputFormatters:
          digitsonly ? [FilteringTextInputFormatter.digitsOnly] : [],
      keyboardType: digitsonly ? TextInputType.number : keytype,
      maxLength: maxlen,
    ),
  );
}
