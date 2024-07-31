import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Apis/Models/settingsModel.dart';
import 'package:http/http.dart' as http;

class SettingsController extends GetxController {
  // Observable variables
  var isLoading = false.obs;
  // var settings = SettingsModel.empty().obs;
  var errorMessage = ''.obs;

  Future<SettingsModel> fetchSettingsData() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.get(Uri.parse(
          'https://gettransfer.maxcoretechnologies.com/public/api/car/settings'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // settings.value = SettingsModel.fromJson(data);
        return SettingsModel.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.body}');
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
