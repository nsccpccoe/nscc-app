// Add routes used in application

import 'package:get/get.dart';
import 'package:nscc_app/router/routes_names.dart';
import 'package:nscc_app/view/authentication/login_screen.dart';
import 'package:nscc_app/view/authentication/signup_screen.dart';
import 'package:nscc_app/view/event_details/event_screen.dart';
import 'package:nscc_app/view/event_details/registration_screen.dart';
import 'package:nscc_app/view/home_screen.dart';
import 'package:nscc_app/view/update_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesNames.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RoutesNames.eventScreen,
      page: () => EventScreen(),
    ),
    GetPage(
      name: RoutesNames.registrationScreen,
      page: () =>RegistrationScreen(),
    ),
    GetPage(
      name: RoutesNames.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutesNames.signupScreen,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: RoutesNames.updateScreen,
      page: () =>UpdateScreen(),
    ),
    
  ];
}
