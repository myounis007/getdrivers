import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screen_widgets/button_widget.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  bool is_checked = false;
  bool is_checked2 = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Invite'.tr,
          // 'invite1'.tr,
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
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email'.tr,
                // labelText: 'invite2'.tr,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Roles'.tr,
              // 'invite3'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Row(
              children: [
                Checkbox(
                    value: is_checked,
                    onChanged: (val) {
                      setState(() {
                        is_checked = val!;
                      });
                    }),
                Text(
                  "Carrier's manager".tr,
                  // 'invite4'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: const Icon(Icons.question_mark_outlined),
                ),
                Checkbox(
                    value: is_checked2,
                    onChanged: (val) {
                      setState(() {
                        is_checked2 = val!;
                      });
                    }),
                Text(
                  'Driver'.tr,
                  // 'invite5'.tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: const Icon(Icons.question_mark_outlined),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                  child: ButtonWidget(
                      title: 'SEND INVITE'.tr,
                      // title: 'invite6'.tr,
                      onTap: () {},
                      color: Colors.deepPurple)),
            )
          ],
        ),
      ),
    );
  }
}
