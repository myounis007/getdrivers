// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Controllers/registercontroller.dart';
import 'package:get_transfer_driver/screen_widgets/login_button_widget.dart';
import 'package:get_transfer_driver/widgets/Colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/snackBar.dart';

class CareerProfile extends StatefulWidget {
  const CareerProfile({super.key});

  @override
  State<CareerProfile> createState() => _CareerProfileState();
}

class _CareerProfileState extends State<CareerProfile> {
  // TextFields Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController carrierNameController = TextEditingController();
  final TextEditingController refferalCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController ownerTypeController = TextEditingController();

  // Form Key
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final SignUpController controller = Get.put(SignUpController());

  bool _switchValue = false;
  bool isswitched = false;
  bool isChecked = false;

  // TextField DropDown Code
  String dropdownValue = 'individual'.tr;

  void showRoleSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Owner Type".tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <String>[
              'individual'.tr,
              'organization'.tr,
            ].map<Widget>((String value) {
              return ListTile(
                title: Text(value),
                onTap: () {
                  setState(() {
                    dropdownValue = value;
                    ownerTypeController.text = value; // Update the text field
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void setValues(String name, String phone, String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('name', name);
    sharedPreferences.setString('phone', phone);
    sharedPreferences.setString('email', email);
  }

  String? token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      token = sharedPreferences.getString('token');
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Carrier Profile'.tr,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                Text(
                  'Contact info'.tr,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.02),
                TextFormField(
                  controller: nameController,
                  decoration:
                      InputDecoration(labelText: 'First Name/Last Name'.tr),
                  validator:
                      RequiredValidator(errorText: 'Enter your name!'.tr).call,
                ),
                SizedBox(height: height * 0.02),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'E-mail'.tr),
                  validator:
                      RequiredValidator(errorText: 'Enter your email!'.tr).call,
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('I have a Refferal Code'.tr),
                    CupertinoSwitch(
                      activeColor: Colors.deepPurple,
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                          isswitched = !isswitched;
                        });
                      },
                    ),
                  ],
                ),
                isswitched
                    ? TextFormField(
                        controller: refferalCodeController,
                        decoration:
                            InputDecoration(labelText: 'Refferal Code'.tr),
                      )
                    : const SizedBox(),
                SizedBox(height: height * 0.02),
                Text(
                  'Carrier Info'.tr,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  validator: RequiredValidator(
                          errorText: 'Enter your carrier short name!'.tr)
                      .call,
                  controller: carrierNameController,
                  decoration:
                      InputDecoration(labelText: "Carrier's Short Name".tr),
                ),
                IntlPhoneField(
                  validator: (value) {
                    if (value == null || value.number.isEmpty) {
                      return 'Please enter a phone number'.tr;
                    }
                    return null;
                  },
                  controller: phoneController,
                  decoration:
                      InputDecoration(labelText: 'Country of Residence'.tr),
                ),
                SizedBox(height: height * 0.02),
                TextFormField(
                  validator:
                      RequiredValidator(errorText: 'Enter owner type!'.tr).call,
                  controller: ownerTypeController,
                  readOnly: true,
                  onTap: () {
                    showRoleSelectionDialog(context);
                  },
                  decoration: InputDecoration(labelText: 'Ownership Type'.tr),
                ),
                SizedBox(height: height * 0.02),
                Text('Select Language'.tr),
                Container(
                  height: height * 0.06,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LanguagePickerDropdown(
                      onValuePicked: (Language language) {
                        languageController.text = language.name;
                      },
                    ),
                  ),
                ),
                TextFormField(
                  validator:
                      RequiredValidator(errorText: 'Enter base location!'.tr)
                          .call,
                  controller: typeController,
                  decoration: InputDecoration(
                      labelText: 'Base location of your Transport'.tr),
                ),
                SizedBox(height: height * 0.03),
                Row(
                  children: [
                    Text('I have read and accepted '.tr),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Meq Drive LTD'.tr,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                    Checkbox(
                      value: isChecked,
                      onChanged: (val) {
                        setState(() {
                          isChecked = val!;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  'Pending'.tr,
                  style: TextStyle(
                      fontSize: 16, color: AppColors.deepPurpleLightColor),
                ),
                Text('You can change the area of your activity on the map'.tr),
                SizedBox(height: height * 0.05),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: LoginButton(
                      loading: controller.isLoading.value,
                      title: 'Register'.tr,
                      onTap: () async {
                        if (!isChecked) {
                          Snackbar.snackBar('MEQ Drivers',
                              "Please accept terms and conditions!".tr);
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          controller.signUp(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            refferalCodeController.text.trim(),
                            carrierNameController.text.trim(),
                            phoneController.text.trim(),
                            typeController.text.trim(),
                            languageController.text.trim(),
                            ownerTypeController.text.trim(),
                          );
                          setValues(nameController.text, phoneController.text,
                              emailController.text);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: height * .01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
