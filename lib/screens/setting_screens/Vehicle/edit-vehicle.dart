// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screen_widgets/login_button_widget.dart';
import 'package:get_transfer_driver/screens/setting_screens/Vehicle/add_photos_screen.dart';
import 'package:get_transfer_driver/screens/setting_screens/Vehicle/model.dart';

class EditVehicleScreen extends StatefulWidget {
  const EditVehicleScreen({super.key});

  @override
  State<EditVehicleScreen> createState() => _EditVehicleScreenState();
}

class _EditVehicleScreenState extends State<EditVehicleScreen> {
  List<bool> isSelected = [false, false, false, false, false, false];
  int num = 0;
  int num1 = 0;
  String? _selectedItem;

  final List<VehicleModel> myData = [
    VehicleModel(image: 'assets/wifi.png', text: 'Free Wifi'.tr),
    VehicleModel(image: 'assets/water.png', text: 'Water'.tr),
    VehicleModel(image: 'assets/phone-charger.png', text: 'Charger'.tr),
    VehicleModel(image: 'assets/disabled.png', text: 'Disabled'.tr),
    VehicleModel(image: 'assets/air-conditioner.png', text: 'Air Condition'.tr),
    VehicleModel(image: 'assets/partition.png', text: 'Partition'.tr),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Edit Vehicles'.tr),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * .24,
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: height * .18,
                        width: width * .4,
                        child: Column(
                          children: [
                            Image.asset('assets/car.webp'),
                            SizedBox(height: height * .02),
                            Text(
                              'No Photo Uploaded'.tr,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * .18,
                        width: width * .35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Acura Integra'.tr),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text('2018'),
                                const SizedBox(width: 4),
                                const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.black,
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  height: height * .04,
                                  width: width * .16,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black26),
                                  ),
                                  child: const Center(child: Text('FGHJAL')),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Economy'.tr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.person, size: 18),
                                Icon(Icons.close, size: 10),
                                Text('2'),
                                SizedBox(width: 4),
                                Icon(Icons.shop, size: 18),
                                Icon(Icons.close, size: 10),
                                Text('3'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * .015),
              Text(
                'Default Options'.tr,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(height: height * .015),
              SizedBox(
                height: height * .16,
                width: width,
                child: ListView.builder(
                  itemCount: myData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected[index] = !isSelected[index];
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 6),
                            height: height * .12,
                            width: width * .22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                width: 2,
                                color: isSelected[index]
                                    ? Colors.deepPurpleAccent.shade200
                                    : Colors.black12,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        myData[index].image,
                                        height: height * .05,
                                        color: isSelected[index]
                                            ? Colors.deepPurpleAccent.shade200
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  if (isSelected[
                                      index]) // Conditionally show the checkbox
                                    Checkbox(
                                      activeColor: isSelected[index]
                                          ? Colors.deepPurpleAccent.shade200
                                          : Colors.deepPurple,
                                      shape: const CircleBorder(),
                                      value: isSelected[index],
                                      onChanged: (value) {
                                        setState(() {
                                          isSelected[index] = value!;
                                        });
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Text(
                          myData[index].text,
                          style: TextStyle(
                            color: isSelected[index]
                                ? Colors.deepPurpleAccent.shade200
                                : Colors.black,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 70,
                width: 400,
                child: DropdownButtonFormField<String>(
                  value: _selectedItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                  },
                  items: <String>[
                    'vehicle2'.tr,
                    'vehicle3'.tr,
                    'vehicle4'.tr,
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Default Driver'.tr,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Get.to(AddPhotosScreen());
                },
                child: Container(
                  height: height * .18,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2, color: Colors.black12),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: Text(
                              'Vehicle Photos'.tr,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios, size: 18),
                          ),
                          Text(
                            'Offers with your vehicle photos are more likely to be chosen by passengers.'
                                .tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: height * .3,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 2, color: Colors.black12),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Auto cancel Offers'.tr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Set time margin to automatically cancel unbooked offers overlapping with the booked ride time.'
                              .tr,
                        ),
                        const SizedBox(height: 8),
                        Text('Time period in minutes'.tr),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (num > 0) num--;
                                });
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            Container(
                              height: height * .044,
                              width: width * .16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 1.2,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Center(child: Text('$num')),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  num++;
                                });
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            Text('Before Ride'.tr),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (num1 > 0) num1--;
                                });
                              },
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            Container(
                              height: height * .044,
                              width: width * .16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 1.2,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Center(child: Text('$num1')),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  num1++;
                                });
                              },
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            Text('After Ride'.tr),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              LoginButton(title: 'Save', onTap: () {}),
              SizedBox(
                height: height * .02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
