import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screen_widgets/tabbar_screens_data_widgets/filter_widget.dart';
import '../../screen_widgets/tabbar_screens_data_widgets/first_container_widget.dart';
import '../../screen_widgets/tabbar_screens_data_widgets/search_widget.dart';

class PastScreen extends StatefulWidget {
  const PastScreen({super.key});

  @override
  State<PastScreen> createState() => _PastScreenState();
}

class _PastScreenState extends State<PastScreen> {
  bool is_checked = false;

  bool istextfield = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FirstWidget(),
              SizedBox(
                width: width * 0.02,
              ),
              const FilterWidget(),
              istextfield
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        istextfield = !istextfield;
                        setState(() {});
                      },
                      icon: const Icon(Icons.search)),
            ],
          ),
        ),
        istextfield
            ? searchWidget(() {
                istextfield = !istextfield;
                setState(() {});
              })
            : const SizedBox(),
        Text('No elements to show, please select other filters'.tr)
      ]),
    ));
  }
}
