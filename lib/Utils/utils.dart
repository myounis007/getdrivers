
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  // flutter toast package
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: Colors.black, textColor: Colors.white);
  }
  // flutter flushbar package

  static void flushbarMessage(String message, BuildContext context, Type buildContext) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          backgroundColor: Colors.red,
          title: 'error',
          message: message,
          borderRadius: BorderRadius.circular(10),
          icon: const Icon(
            Icons.error,
            size: 30,
          ),
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: const EdgeInsets.all(8),
        )..show(context));
  }

  //default snackbar
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(9),
        backgroundColor: Colors.pink,
        content: Text(message),
      ),
    );
  }
}
