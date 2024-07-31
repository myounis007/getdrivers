import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screens/instructions_screen_buttons/driver_widget.dart';
import 'package:get_transfer_driver/screens/instructions_screen_buttons/how_to_get_started_widget.dart';
import 'package:get_transfer_driver/screens/instructions_screen_buttons/paymentof_orders.dart';
import 'package:get_transfer_driver/screens/instructions_screen_buttons/vehicle_widget.dart';
import 'package:get_transfer_driver/screens/instructions_screen_buttons/working_request_widget.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({super.key});

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  bool _showHowToGetStarted = false;
  bool _showWorkingRequest = false;
  bool _showPaymentOfOrders = false;
  bool _showVehicle = false;
  bool _showDriver = false;

  void _toggleVisibility(int index) {
    setState(() {
      if (index == 0) {
        _showHowToGetStarted = !_showHowToGetStarted;
        _showWorkingRequest = false;
        _showPaymentOfOrders = false;
        _showVehicle = false;
        _showDriver = false;
      } else if (index == 1) {
        _showHowToGetStarted = false;
        _showWorkingRequest = !_showWorkingRequest;
        _showPaymentOfOrders = false;
        _showVehicle = false;
        _showDriver = false;
      } else if (index == 2) {
        _showHowToGetStarted = false;
        _showWorkingRequest = false;
        _showPaymentOfOrders = !_showPaymentOfOrders;
        _showVehicle = false;
        _showDriver = false;
      } else if (index == 3) {
        _showHowToGetStarted = false;
        _showWorkingRequest = false;
        _showPaymentOfOrders = false;
        _showVehicle = !_showVehicle;
        _showDriver = false;
      } else if (index == 4) {
        _showHowToGetStarted = false;
        _showWorkingRequest = false;
        _showPaymentOfOrders = false;
        _showVehicle = false;
        _showDriver = !_showDriver;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Instructions'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              Text(
                'Instructions'.tr,
                // 'inst1'.tr,
                style: const TextStyle(fontSize: 20),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => _toggleVisibility(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'How to get started'.tr,
                            // 'inst2'.tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(_showHowToGetStarted
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _showHowToGetStarted,
                      child: const HowToGetStartedWidget(),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _toggleVisibility(1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Working with requests'.tr,
                            // 'inst3'.tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(_showWorkingRequest
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _showWorkingRequest,
                      child: const WorkingRequestWidget(),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _toggleVisibility(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment orders'.tr,
                            // 'inst4'.tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(_showPaymentOfOrders
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _showPaymentOfOrders,
                      child: const PaymentOfOrdersWidget(),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Center(
                      child: Text(
                        'Requirements'.tr,
                        // 'inst5'.tr,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    GestureDetector(
                      onTap: () => _toggleVisibility(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vehicles'.tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(_showVehicle
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _showVehicle,
                      child: const VehicleWidget(),
                    ),
                    SizedBox(height: height * 0.02),
                    GestureDetector(
                      onTap: () => _toggleVisibility(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Driver'.tr,
                            // 'invite5'.tr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(_showDriver
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _showDriver,
                      child: const DriverWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
