
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nscc_app/router/routes_names.dart';
import 'package:nscc_app/services/auth.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  var isLoading = false.obs;
  // Rx<bool> isLoggedIn = false.obs;
  late String email;
  late String password;
  late String fullname;

  // login controller
  Future<void> login(BuildContext context) async {
    try {
      isLoading.value = true;
      update();

      await AuthMethods().signIn(
        context: context,
        email: email,
        password: password,
      );
      Get.offAllNamed(RoutesNames.festivalScreen);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> signup(BuildContext context) async {
    try {
      isLoading.value = true;
      update();

      await AuthMethods().signUp(
        context: context,
        email: email,
        fullname: fullname,
        password: password,
      );
      // isLoading.value = false;
      // update();
      Get.offAllNamed(RoutesNames.loginScreen);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void logout() {
    // isLoggedIn.value = false;
  }
}
