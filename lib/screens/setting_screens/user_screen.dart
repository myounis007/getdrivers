import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screens/setting_screens/invite_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        tooltip: 'Increment',
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const InviteScreen()));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      appBar: AppBar(
        title: Text(
          'Users'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.06,
              width: width * .9,
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    hintText: 'Email, phone, name'.tr,
                    suffixIcon: const Icon(Icons.search)),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.2,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black38),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mr john smith'.tr,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      height: height * 0.03,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(child: Text('+923048675464')),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Text('mrkhan804@mail.com'),
                    Text("Carrier's main manager, Carrier's manager, Driver".tr)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
