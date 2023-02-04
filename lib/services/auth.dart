import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nscc_app/widgets/custom_snackbar.dart';
// ;

class AuthMethods {
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      try {
        UserCredential firebaseUser =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // TODO: Firebase token for further API requests
        IdTokenResult tokenResult = await firebaseUser.user!.getIdTokenResult();
        // print(tokenResult.token);
      } catch (e) {
        print(e);
      }
    }
  }

//sign in with email and password

  Future<void> signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
      switch (e.code) {
        case "wrong-password":
          MyWidgets.showSnackbar(msg: "Email Already in Use", context: context);
          break;
        case "user-not-found":
          MyWidgets.showSnackbar(
              msg: "Account Does not Exists", context: context);
          break;
      }
    }
  }

  Future<void> signUp(
      {required BuildContext context,
      required String fullname,
      required String email,
      required String password}) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // print(e.message);
      MyWidgets.showSnackbar(msg: "Email Already in Use", context: context);
    }
  }

// Sign out method
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> resetPassword(String email) async {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
