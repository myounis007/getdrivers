import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Apis/Models/car_brands_model.dart';
import 'package:http/http.dart' as http;

class CarBrandsController extends GetxController {
  var isLoading = false.obs;
  var carBrands = <CarBrandsModel>[].obs;

  Future<void> fetchCarBrandsModelData() async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse(
          'https://gettransfer.maxcoretechnologies.com/public/api/car-brands'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        carBrands.value =
            data.map((carBrand) => CarBrandsModel.fromJson(carBrand)).toList();
      } else {
        throw Exception('Failed to load data ${response.statusCode}');
      }
    } finally {
      isLoading(false);
    }
  }
}
