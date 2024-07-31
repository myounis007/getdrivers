import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleWidget extends StatefulWidget {
  const VehicleWidget({super.key});

  @override
  State<VehicleWidget> createState() => _VehicleWidgetState();
}

class _VehicleWidgetState extends State<VehicleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '1- Compliance with technical standards of the\n country of operation'
                  .tr),
          // Text('vehicleB1'.tr),
          Text('2- Valid registration, insurance and inspection \n certificate'
              .tr),
          // Text('vehicleB2'.tr),
          Text(
              '3- Good apperance, no captions or company\nname,phone number and advertisement are\ndepicted in the image.'
                  .tr),
          // Text('vehicleB3'.tr),
          Text('4- No tobacco or any other smoke inside.'.tr)
          // Text('vehicleB4'.tr)
        ],
      ),
    );
  }
}
