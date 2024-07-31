import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_transfer_driver/widgets/snackBar.dart';
import 'package:http/http.dart' as http;
import 'package:get_transfer_driver/Apis/Models/car_model.dart';

class CarModelController extends GetxController {
  RxBool isLoading = false.obs;

  Future<CarModel> fetchCarModelData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          'https://gettransfer.maxcoretechnologies.com/public/api/car-models'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return CarModel.fromJson(data);
      } else {
        throw Exception('Failed to load data ${response.statusCode}');
      }
    } catch (e) {
      Snackbar.snackBar('MEQ Drivers', 'Failed to save data');
      throw Exception(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
