import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nscc_app/view/authentication/login_screen.dart';
import 'package:nscc_app/view/event_details/festivals_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return LoginScreen();
    } else
      return FestivalScreen();
  }
}
