import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentReportScreen extends StatefulWidget {
  const PaymentReportScreen({super.key});

  @override
  State<PaymentReportScreen> createState() => _PaymentReportScreenState();
}

class _PaymentReportScreenState extends State<PaymentReportScreen> {
  TextEditingController dateController = TextEditingController();

  // DateTime _dateTime = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment Reports'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: height * 0.08,
                    width: width * 0.5,
                    child: TextFormField(
                        readOnly: true,
                        controller: dateController,
                        decoration: InputDecoration(
                          suffixIcon:
                              const Icon(Icons.arrow_drop_down_outlined),
                          hintText: 'Select Date'.tr,
                        ),
                        onTap: () async {
                          _selectDate(context);
                        })),
                SizedBox(
                  width: width * 0.03,
                ),
                Container(
                  height: height * 0.05,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'DOWNLOAD'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
