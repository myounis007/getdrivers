import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Apis/Models/CreateVehicleModel.dart';
import 'package:get_transfer_driver/screen_widgets/button_widget.dart';
import 'package:get_transfer_driver/screens/setting_screens/Vehicle/create_vehicle_screen.dart';
import '../../../Controllers/create_vehicle_controller.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  CreateVehicleModel model = Get.put(CreateVehicleModel());
  CreateVehicleController controller = CreateVehicleController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Vehicles'.tr,
            // 'vehicleB5'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.fetchCreateVehicleData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/car.webp'),
                    Text(
                      'No Vehicles added.'.tr,
                      // 'vehicleB6'.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Add vehicle to continue'.tr,
                      // 'vehicleB7'.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * .2,
                    ),
                    Center(
                      child: ButtonWidget(
                          title: 'Vehicles'.tr,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateVehicleScreen()));
                          },
                          color: Colors.deepPurple),
                    )
                  ],
                );
              }
            }));
  }
}
