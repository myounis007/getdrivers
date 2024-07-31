import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkingRequestWidget extends StatefulWidget {
  const WorkingRequestWidget({super.key});

  @override
  State<WorkingRequestWidget> createState() => _WorkingRequestWidgetState();
}

class _WorkingRequestWidgetState extends State<WorkingRequestWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '1- Requests tab contains all passengers\n requests and your offers. There, are three\n attempts to correct your price offer or cancel \n your unchosen offer'
                  .tr),
          // Text('work1'.tr),
          Text(
              '2- Price qoute should be final and include\n Get Transfer.com comission'
                  .tr),
          // Text('work2'.tr),
          Text(
              '3- When s passenger chooses you as a carrier,\n you recieve an email with the ride confirmation\n you can contact the passenger via our website\n chat or phone.Scheduled rides appear\n on Rides tab'
                  .tr),
          // Text('work3'.tr),
          Text(
              '4- If the passenger cnce the ride(or does\n not show up at the meeting point), you will\n receive payment in accordance with section\n 5.6'
                  .tr),
          // Text('work4'.tr),
        ],
      ),
    );
  }
}
