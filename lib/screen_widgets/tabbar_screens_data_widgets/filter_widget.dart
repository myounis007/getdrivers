import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final TextEditingController _firstDateController = TextEditingController();
  final TextEditingController _lastDateController = TextEditingController();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: height * 0.6,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter'.tr,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'By type'.tr),
                      // hintText: 'filter2'.tr,
                    ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      readOnly: true,
                      controller: _firstDateController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_today),
                        hintText: 'Start Date'.tr,
                      ),
                      // hintText: 'filter3'.tr,
                      onTap: () async {
                        _selectDate(context, _firstDateController);
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      readOnly: true,
                      controller: _lastDateController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.calendar_today),
                        hintText: 'Last Date'.tr,
                      ),
                      // hintText: 'filter4'.tr,
                      onTap: () async {
                        _selectDate(context, _lastDateController);
                      },
                    ),
                    SizedBox(height: height * 0.02),
                    CheckboxListTile(
                      value: isChecked,
                      onChanged: (val) {
                        setState(() {
                          isChecked = val!;
                        });
                      },
                      title: Text(
                        'No Competitors'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    CheckboxListTile(
                      value: isChecked1,
                      onChanged: (val) {
                        setState(() {
                          isChecked1 = val!;
                        });
                      },
                      title: Text(
                        'Only Urgent'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    CheckboxListTile(
                      activeColor: Colors.green,
                      value: isChecked2,
                      onChanged: (val) {
                        setState(() {
                          isChecked2 = val!;
                        });
                      },
                      title: Text(
                        'Show hidden requests'.tr,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('You can hide unwanted requests'.tr),
                    // Text('filter8'.tr)
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: height * 0.05,
        width: width * 0.25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.filter_alt_outlined),
            Text(
              'Filter'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
