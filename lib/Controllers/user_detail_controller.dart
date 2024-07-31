import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Apis/Models/user_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserDetailController extends GetxController {
  var isLoading = false.obs;
  var userDetail = Rxn<Data>();

  String? token;

  @override
  void onInit() {
    super.onInit();
    myFunction();
  }

  void myFunction() async {
    token = await SignUpController.getToken();
    log('Token retrieved: $token');
    if (token != null) {
      await fetchUserData(); // Fetch data after retrieving the token
    }
  }

  Future<void> fetchUserData() async {
    log('Token used for request: $token');
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://gettransfer.maxcoretechnologies.com/public/api/user_detail'),
        headers: {"Authorization": "Bearer $token"},
      );

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        log('Data received: $data');

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', '${data['token']}');
        log('Token saved: ${data['token']}');

        userDetail.value = Data.fromJson(data['data']);
        log('User Data Model: ${userDetail.value}');
      } else {
        log('Failed response: ${response.statusCode}');
        userDetail.value = null;
      }
    } catch (e) {
      log('Error: $e');
      Fluttertoast.showToast(
          msg: "MEQ Drivers', 'An error occurred!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurple,
          textColor: Colors.white,
          fontSize: 16.0);
      userDetail.value = null;
    } finally {
      isLoading(false);
    }
  }
}

class SignUpController extends GetxController {
  static Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('login_token');
  }
}
