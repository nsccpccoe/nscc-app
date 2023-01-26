import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegistrationController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController collegeNameController = TextEditingController();
  final TextEditingController graduationYearController =
      TextEditingController();
  final TextEditingController hackerRankLinkController =
      TextEditingController();
  final genderList = ["Female", "Male"];
  String? selectedValue;

  void updateDropDown(String value) {
    selectedValue = value;
    update();
  }
}
