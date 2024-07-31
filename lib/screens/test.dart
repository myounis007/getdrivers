import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
              height: height * .1,
            ),
            Row(
              children: [
                SizedBox(
                    width: width * .4,
                    child: Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Enter name'),
                    ))),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                    width: 150,
                    child: Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Enter name'),
                    ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
