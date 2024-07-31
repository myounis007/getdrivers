import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverWidget extends StatefulWidget {
  const DriverWidget({super.key});

  @override
  State<DriverWidget> createState() => _DriverWidgetState();
}

class _DriverWidgetState extends State<DriverWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('driver1'.tr),
          Text(
              '1- 3 years or more of a driving experience\nnd att least 21 years of age.'
                  .tr),
          // Text('driver2'.tr),
          Text('2-Safe and comfortable driving style.'.tr),
          Text('3- Adherence to local traffic regulations.'.tr),
          // Text('driver3'.tr),
          Text('4- Presentable appearance'.tr),
          // Text('driver4'.tr),
          Text('5- Meeting with a name sign on request and \n help with luggage'
              .tr),
          // Text('driver5'.tr),
          Text(
              '6- No phone talk while driving or forced\nconversation with passenger'
                  .tr),
          // Text('driver6'.tr),
          Text(
              '7- No price change after confirmation with\npassenger on MEQ Drives.com'
                  .tr)
          // Text('driver7'.tr)
        ],
      ),
    );
  }
}
