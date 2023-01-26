import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(40.h);


  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
