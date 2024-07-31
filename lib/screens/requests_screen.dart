import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screens/tabbar_firstscreen_screens/new_screen.dart';
import 'package:get_transfer_driver/screens/tabbar_firstscreen_screens/with_my_screen.dart';
import '../screen_widgets/tabbar_widget.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                tab_bar_widget(
                  widgets: [
                    Text(
                      'New'.tr,
                      // 'new1'.tr,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'With my offers'.tr,
                      // 'new5'.tr,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const Expanded(
                  child:
                      TabBarView(children: [NewScreen(), WithMyOfferScreen()]),
                )
              ],
            ),
          )),
    );
  }
}
