import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/widgets/Colors.dart';

class Snackbar {
  static snackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: AppColors.deepPurpleLightColor,
      backgroundGradient: LinearGradient(
        colors: [Colors.deepPurple.shade600, Colors.deepPurple.shade300],
      ),
    );
  }
}
