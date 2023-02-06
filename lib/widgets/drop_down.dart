import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nscc_app/constants/colors.dart';
import 'package:nscc_app/constants/text_styles.dart';

class DropDown extends StatefulWidget {
  final TextEditingController controller;
  final List<String> items;
  final double height;
  final double width;
  final Function(String)? onChange;
  final String? initialValue;
  final String hintText;
  DropDown({
    super.key,
    required this.controller,
    required this.items,
    this.height = 48,
    this.width = 285,
    this.onChange,
    this.initialValue,
    required this.hintText,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? selectedString;

  @override
  void initState() {
    if (widget.items.contains(widget.initialValue)) {
      selectedString = widget.initialValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height.h,
      width: widget.width.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.95),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: DropdownButton<String>(
          isExpanded: true,
          underline: SizedBox(),
          borderRadius: BorderRadius.circular(8.r),
          items: widget.items
              .map(
                (e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedString = value;
              widget.controller.text = value!;
            });
            if (widget.onChange != null) {
              widget.onChange!(value!);
            }
          },
          value: selectedString,
          hint: Text(
            widget.hintText,
            style: MyTextStyles.poppins500
                .copyWith(fontSize: 14.sp, color: AppColors.greyColor),
          ),
        ),
      ),
    );
  }
}
