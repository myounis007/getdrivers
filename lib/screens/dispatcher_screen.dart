import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DispatcherScreen extends StatelessWidget {
  const DispatcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Drivers'.tr),
                  // Text('dispatcher1'.tr),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Driver name or vehicle license plate'.tr),
                // hintText: 'dispatcher2'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
