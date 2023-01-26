import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// ;

class AuthMethods {
  //  UserCredential user = FirebaseAuth.instance;
  // AuthMethods(this._auth);
  // Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithGoogle() async {
    //first trigger authentication
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //obtain the auth details
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      //create a new credentials
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      try {
        UserCredential firebaseUser =
            await FirebaseAuth.instance.signInWithCredential(credential);

        print(firebaseUser.user!.email);
        print(firebaseUser.user!.displayName);
        // if (firebaseUser.user != null) {
        // Check is already sign up

        // }
        // return firebaseUser;
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
    //creating a provider
    //  UserCredential user;
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      print("fonr");
      print(user.user!.email);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
      switch (e.code) {
        case "wrong-password":
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Email Already in Use")));
          break;
        case "user-not-found":
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Account Does not Exists")));
          break;
      }
    }
  }

  Future<void> signUp(
      {required BuildContext context,
      required String fullname,
      required String email,
      required String password}) async {
    final _username = email.replaceAll(RegExp(r'@(\w*)\.(\w*)'), "").trim();

    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      Map<String, dynamic> _userdata = {
        'username': _username,
        'useremail': email.trim(),
        'displayname': fullname.trim(),
        'followerList': {},
        'address': '',
        'gender': '',
        'mobileNumber': '',
        'privacy': "Everyone",
      };
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Email Already in Use")));
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
