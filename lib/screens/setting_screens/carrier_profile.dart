import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screen_widgets/button_widget.dart';

class CarriersProfileScreen extends StatefulWidget {
  const CarriersProfileScreen({super.key});

  @override
  State<CarriersProfileScreen> createState() => _CarriersProfileScreenState();
}

class _CarriersProfileScreenState extends State<CarriersProfileScreen> {
  String _selectedLanguage = 'English';
  final List<Map<String, dynamic>> _languages = [
    {'name': 'English'},
    {'name': 'Spanish'},
    {'name': 'Nederlands'},
    {'name': 'Francais'},
    {'name': 'Italiano'},
    {'name': 'Polski'},
    {'name': 'Magyar'},
    // Add more languages with their respective flags here
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrier Profile'.tr,
          // 'register1'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Carrier Short Name'.tr),
              // decoration: InputDecoration(labelText: 'register2'.tr),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Country of Residence'.tr),
              // decoration: InputDecoration(labelText: 'register3'.tr),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Ownership Type'.tr),
              // decoration: InputDecoration(labelText: 'register4'.tr),
            ),
            DropdownButtonFormField<String>(
              hint: Text('Select Language'.tr),
              // hint: Text('register5'.tr),
              value: _selectedLanguage,
              items: _languages.map<DropdownMenuItem<String>>(
                  (Map<String, dynamic> language) {
                return DropdownMenuItem<String>(
                  value: language['name'],
                  child: Row(
                    children: [
                      Text(language['name']),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Base location of your transport'.tr),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Referral Code'.tr),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
                'You can set default options and auto-cancellation \n rules for each vehicle in Vehicle settings'
                    .tr),
            // Text('register10'.tr),
            SizedBox(
              height: height * 0.08,
            ),
            ButtonWidget(
                title: 'SAVE'.tr, onTap: () {}, color: Colors.deepPurple)
          ]),
        ),
      ),
    );
  }
}
