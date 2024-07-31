import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Apis/Models/account_delete_model.dart';
import '../Utils/routes/routes_name.dart';

class AccountDeleteController extends GetxController {
  Future<AccountDeleteModel?> deleteAccount(
      String name, String phone, String email, BuildContext context) async {
    // Validate the input data
    if (name.isEmpty || phone.isEmpty || email.isEmpty) {
      throw Exception('All fields are required');
    }

    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString('login_token');

      if (token == null) {
        throw Exception('Unauthorized: No token found');
      }

      final response = await http.delete(
        Uri.parse(
            'https://gettransfer.maxcoretechnologies.com/public/api/delete-account'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Content-type': 'application/x-www-form-urlencoded',
        },
        body: jsonEncode(
          {
            'name': name,
            'phone': phone,
            'email': email,
          },
        ),
      );

      log(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Get.toNamed(RoutesName.deleteAccount);
        // Use Get.toNamed instead of Navigator.pushNamed
        Get.snackbar('Deletion Account', 'Account delete Succesfully',
            backgroundColor: Colors.deepPurple,
            colorText: Colors.white,
            duration: const Duration(seconds: 1));
        return AccountDeleteModel.fromJson(data);
      } else {
        Get.snackbar('Deletion Account', 'Failed to delete Account',
            backgroundColor: Colors.deepPurple,
            colorText: Colors.white,
            duration: const Duration(seconds: 1));
        throw Exception('Failed to delete account: ${response.reasonPhrase}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('An error occurred: $e');
    }
  }
}
