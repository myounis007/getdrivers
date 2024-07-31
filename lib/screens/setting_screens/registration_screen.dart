import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screen_widgets/button_widget.dart';

class RegistrationDetailsScreen extends StatefulWidget {
  const RegistrationDetailsScreen({super.key});

  @override
  State<RegistrationDetailsScreen> createState() =>
      _RegistrationDetailsScreenState();
}

class _RegistrationDetailsScreenState extends State<RegistrationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration details'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Verification status:'.tr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: width * 0.02),
                  Container(
                    height: height * 0.04,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Isn't checked".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'.tr),
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Complete postal code and address'.tr,
                ),
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Registration address'.tr),
              ),
              SizedBox(height: height * 0.02),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Taxpayer identification number'.tr,
                ),
              ),
              SizedBox(height: height * 0.07),
              ButtonWidget(
                title: 'SAVE'.tr,
                onTap: () {
                  // Save functionality goes here
                },
                color: Colors.deepPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
