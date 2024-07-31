import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/widgets/Colors.dart';

class HowToGetStartedWidget extends StatefulWidget {
  const HowToGetStartedWidget({super.key});

  @override
  State<HowToGetStartedWidget> createState() => _HowToGetStartedWidgetState();
}

class _HowToGetStartedWidgetState extends State<HowToGetStartedWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1- Please familiarize yourself with'.tr),
          // Text('start1'.tr),
          TextButton(
              onPressed: () {},
              child: Text(
                'MEQ Drives Service Liicense Contract.'.tr,
                // 'start2'.tr,
                style: TextStyle(
                    color: AppColors.blueColor,
                    decoration: TextDecoration.underline),
              )),
          Row(
            children: [
              Text('2- Fill your company info on'.tr),
              // Text('start3'.tr),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Registration details'.tr,
                    // 'start4'.tr,
                    style: TextStyle(
                        color: AppColors.blueColor,
                        decoration: TextDecoration.underline),
                  )),
            ],
          ),
          // Text('start5'.tr),
          Text(
              '3- Upload copies of your registration \n documents and passenger ransportation \nlicense to your profile on Document tab'
                  .tr),
          Text(
              '4- Add all your vehicle and upload their photos \n on vehicles tab. According to our statistics,\n offer with vehicle photos are often more\n appealing to passengers.'
                  .tr),
          // Text('start6'.tr),
          Text(
              '5- On the Payment details tab, select the \n currency and follow the instructions to register\n with payoneer after activating your account'
                  .tr),
          // Text('start7'.tr),
          Text(
              '6- You can change the selected operating \n area on Carrier profile tab'
                  .tr),
          // Text('start8'.tr),
        ],
      ),
    );
  }
}
