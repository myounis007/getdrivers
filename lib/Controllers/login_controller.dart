import 'dart:convert';
import 'dart:developer';

import 'package:get_transfer_driver/widgets/bottom_navbar.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Apis/Models/login_model.dart';
import '../widgets/snackBar.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  // Get Token Function

  Future<LoginModel?> loginUser(phone) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(
            'https://gettransfer.maxcoretechnologies.com/public/api/driver/login'),
        body: {'phone': phone},
      );

      if (response.statusCode == 200) {
        log('Successful response= ${response.statusCode}');
        var data = jsonDecode(response.body);
// get token
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        final token = await sharedPreferences.setString(
            'login_token', '${data['token']}');
        log('>>>>>>$token');

        Snackbar.snackBar('MEQ Drivers', 'Login Successfully!');
        Get.offAll(const BottomNavScreen());
        return LoginModel.fromJson(data);
      } else {
        Snackbar.snackBar(
            'MEQ Drivers', 'user not found ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error: $e');
      Get.snackbar('error', "MEQ Drivers, An error occurred!");
      return null;
    } finally {
      isLoading(false);
    }
  }
}
