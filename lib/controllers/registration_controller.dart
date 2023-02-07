import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nscc_app/model/fields_modal.dart';
import 'package:nscc_app/services/registration_service.dart';

class RegistrationController extends GetxController {
  final RegistrationService _service = RegistrationService();
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
  List<Fields> fields = [];
  bool isLoading = true;
  bool isRegisterLoading = false;
  bool isRegistered = false;

  void updateDropDown(String value) {
    selectedValue = value;
    update();
  }

  Future<void> getFields(String eventId, BuildContext context) async {
    try {
      Map<String, dynamic> result = await _service.getFields(eventId);
      log(result.toString());
      fields.clear();
      for (var item in result["data"]["fields"]) {
        fields.add(Fields.fromJson(item));
      }
      log(fields.length.toString());
      await getRegistrationStatus("codehive", context);
    } catch (e) {
      log(e.toString());
      //TODO: show error snackbar
    }
  }

  Future<bool> register(String eventId, BuildContext context) async {
    Map<String, dynamic> data = {};
    Map<String, dynamic> result = {};
    try {
      isRegisterLoading = true;
      update();
      for (var item in fields) {
        if (item.controller.text == "") {
          data[item.name] = item.value;
        } else {
          data[item.name] = item.controller.text;
        }
      }
      log("Request data : $data");
      result = await _service.register(eventId, data);
      log(result.toString());
      return result["data"]["registered"];
    } catch (e) {
      log(e.toString());
      return false;
    } finally {
      isRegisterLoading = false;
      update();
    }
  }

  Future<void> getRegistrationStatus(
      String eventId, BuildContext context) async {
    try {
      Map<String, dynamic> result =
          await _service.getRegistrationStatus(eventId);
      log(result.toString());
      isRegistered = result["data"]["registered"];
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }
}
