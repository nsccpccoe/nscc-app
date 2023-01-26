import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nscc_app/constants/text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
              "2021 Newton School Coding Club, Pimpri Chinchwad \n College of Engineering. All Rights reserved ",
              style: MyTextStyles.poppins400,
              textAlign: TextAlign.center,
            );
  }
}