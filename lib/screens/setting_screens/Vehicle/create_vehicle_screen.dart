// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Apis/Models/settingsModel.dart';
import 'package:get_transfer_driver/Controllers/car_model_controller.dart';
import 'package:get_transfer_driver/Controllers/settings_controller.dart';
import 'package:get_transfer_driver/screen_widgets/login_button_widget.dart';
import 'package:get_transfer_driver/screens/setting_screens/Vehicle/edit-vehicle.dart';

class CreateVehicleScreen extends StatefulWidget {
  const CreateVehicleScreen({super.key});

  @override
  State<CreateVehicleScreen> createState() => _CreateVehicleScreenState();
}

class _CreateVehicleScreenState extends State<CreateVehicleScreen> {
  final CarModelController controller = Get.put(CarModelController());
  final SettingsController settingsController = Get.put(SettingsController());
  String? _selectedMake;
  String? selectedColor = 'Red';
  final List<String> _colors = [
    'Red',
    'Blue',
    'Green',
    'Black',
    'White',
    'Gray',
    'Yellow',
    'Purple'
  ];

  final TextEditingController vehicleMake = TextEditingController();
  final TextEditingController brandName = TextEditingController();
  final TextEditingController manufacture = TextEditingController();
  final TextEditingController passenger = TextEditingController();
  final TextEditingController luggage = TextEditingController();
  final TextEditingController licence = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create vehicle'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: height * .08,
                  width: width,
                  child: FutureBuilder<SettingsModel>(
                    future: settingsController.fetchSettingsData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Something went wrong!'),
                        );
                      } else if (!snapshot.hasData ||
                          snapshot.data!.data == null) {
                        return const Center(child: Text('No data available'));
                      } else {
                        final carBrandsList = snapshot.data!.data.carModels;
                        List<String> carBrands = carBrandsList
                            .map((brand) => brand.car)
                            .toSet()
                            .toList();

                        if (_selectedMake == null ||
                            !carBrands.contains(_selectedMake)) {
                          _selectedMake =
                              carBrands.isNotEmpty ? carBrands[0] : null;
                        }

                        return DropdownButtonFormField<String>(
                          value: _selectedMake,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedMake = newValue;
                            });
                          },
                          items: carBrands
                              .map<DropdownMenuItem<String>>((String brand) {
                            return DropdownMenuItem<String>(
                              value: brand,
                              child: Text(brand),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Vehicle Brand'.tr,
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: height * .08,
                  width: width,
                  child: FutureBuilder<SettingsModel>(
                    future: settingsController.fetchSettingsData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong!'));
                      } else if (!snapshot.hasData ||
                          snapshot.data!.data == null) {
                        return const Center(child: Text('No data available'));
                      } else {
                        final carBrandsList = snapshot.data!.data.carBrands;
                        List<String> carBrands = carBrandsList
                            .map((brand) => brand.car)
                            .toSet()
                            .toList();

                        if (_selectedMake == null ||
                            !carBrands.contains(_selectedMake)) {
                          _selectedMake =
                              carBrands.isNotEmpty ? carBrands[0] : null;
                        }

                        return DropdownButtonFormField<String>(
                          value: _selectedMake,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedMake = newValue;
                            });
                          },
                          items: carBrands
                              .map<DropdownMenuItem<String>>((String brand) {
                            return DropdownMenuItem<String>(
                              value: brand,
                              child: Text(brand),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Vehicle Make'.tr,
                          ),
                        );
                      }
                    },
                  ),
                ),
                _buildTextFormField('Manufacture year'.tr, vehicleMake),
                _buildDropdownButtonFormField(
                    'Color'.tr, selectedColor, _colors),
                _buildTextFormField('License plate'.tr, manufacture),
                _buildTextFormField('Number of passenger seats'.tr, passenger),
                _buildTextFormField('Number of luggage places'.tr, luggage),
                SizedBox(height: height * 0.31),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: LoginButton(
                      loading: controller.isLoading.value,
                      title: 'SAVE AND CONTINUE'.tr,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          controller.fetchCarModelData();
                          Get.to(const EditVehicleScreen());
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      String labelText, TextEditingController controller) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
    );
  }

  Widget _buildDropdownButtonFormField(
      String labelText, String? selectedValue, List<String> items) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
