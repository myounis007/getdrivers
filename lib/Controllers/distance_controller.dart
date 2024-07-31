import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_transfer_driver/Apis/Models/distance_model.dart';
import 'package:http/http.dart' as http;

class DistanceController extends GetxController {
  Future<DistanceModel> fetchDistanceData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://gettransfer.maxcoretechnologies.com/public/api/distance-model'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return DistanceModel.fromJson(data);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
