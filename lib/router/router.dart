// Add routes used in application

import 'package:get/get.dart';
import 'package:nscc_app/router/routes_names.dart';
import 'package:nscc_app/view/home_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesNames.homeScreen,
      page: () => HomeScreen(),
    ),
    
  ];
}
