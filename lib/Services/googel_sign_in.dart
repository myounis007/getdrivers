import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_transfer_driver/Utils/routes/routes_name.dart';
import 'package:get_transfer_driver/screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Handle Google Sign-In Button Click
void handleGoogleButtonClk(BuildContext context) {
  signInWithGoogle().then((user) {
    log('User: ${user!.user}');
    log('User Info: ${user.additionalUserInfo}');
    Navigator.pushNamed(context, RoutesName.bottomNabBarView);
  }).catchError((error) {
    // Handle the error
    log('Error during Google Sign-In: $error');
  });
}

// Google Sign-In Function
Future<UserCredential?> signInWithGoogle() async {
  try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    // Handle error
    log('Error during Google Sign-In: $e');
    return null;
  }
}

//google signout
signOut(context) async {
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut().then((onValue) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LogInScreen()));
  });
}
