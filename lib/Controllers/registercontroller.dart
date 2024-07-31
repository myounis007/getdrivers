import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screens/setting_screens/registration_screen.dart';
import 'package:get_transfer_driver/widgets/snackBar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;

  void signUp(
      String name,
      String email,
      String referalCode,
      String carrierShortName,
      String phone,
      String type,
      String language,
      String ownershipType) async {
    try {
      isLoading(true);

      // Create map variable
      Map<String, String> myBody = {
        'name': name,
        'email': email,
        'referal_code': referalCode,
        'carrier_short_name': carrierShortName,
        'phone': phone,
        'type': 'driver',
        'language': language,
        'ownership_type': ownershipType,
      };
      final response = await http.post(
        Uri.parse(
            'https://gettransfer.maxcoretechnologies.com/public/api/driver/register'),
        body: myBody,
        headers: {
          'Accept': 'application/json',
        },
      );

      log("My Body: $myBody");
      log("My Response: ${response.body}");

      if (response.statusCode == 200) {
        log('Response code: ${response.statusCode}');
        log('Successful response: ${response.statusCode}');
        var data = jsonDecode(response.body);

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('token', '${data['token']}');
        log('New token: ${data['token']}');

        Snackbar.snackBar('MEQ Drivers', 'Account created Successfully!');
        Get.to(() => const RegistrationDetailsScreen());
      } else {
        Snackbar.snackBar(
            'MEQ Drivers', 'Enter valid credentials ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
