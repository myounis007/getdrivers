// Create Vehicle Controller
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Apis/Models/CreateVehicleModel.dart';

class CreateVehicleController extends GetxController {
  var isLoading = false.obs;
  Future<CreateVehicleModel> fetchCreateVehicleData() async {
    final response = await http.get(Uri.parse(
        'https://gettransfer.maxcoretechnologies.com/public/api/get-ride'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return CreateVehicleModel.fromJson(data);
    } else {
      throw Exception('Failed to load data ${response.statusCode}');
    }
  }
}
