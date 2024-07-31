import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Support'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email us'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.email_outlined)),
                TextButton(
                    onPressed: () {}, child: const Text('Info@MEQDrive.com'))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Follow us'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25)),
                child: Image.asset('assets/twit.png'),
              ),
            ),
            Center(child: Text('Twitter'.tr))
          ],
        ),
      ),
    );
  }
}
