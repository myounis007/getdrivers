import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screens/rides_screens/calender_screen.dart';
import 'package:get_transfer_driver/screens/rides_screens/past_screen.dart';
import 'package:get_transfer_driver/screens/rides_screens/scheduled_screen.dart';

import '../../screen_widgets/tabbar_widget.dart';

class RidesScreen extends StatelessWidget {
  const RidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 20),
                tab_bar_widget(
                  widgets: [
                    Text(
                      'Scheduled'.tr,
                      // 'ride1'.tr,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text('Past'.tr, style: const TextStyle(fontSize: 16)),
                    // Text('ride2'.tr, style: const TextStyle(fontSize: 16)),
                    const Icon(
                      Icons.calendar_month,
                      size: 20,
                    )
                  ],
                ),
                const Expanded(
                  child: TabBarView(children: [
                    ScheduledScreen(),
                    PastScreen(),
                    CalenderScreen()
                  ]),
                ),
              ],
            ),
          )),
    );
  }
}
