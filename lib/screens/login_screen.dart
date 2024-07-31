import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Controllers/login_controller.dart';
import 'package:get_transfer_driver/screen_widgets/login_button_widget.dart';
import 'package:get_transfer_driver/widgets/Colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'career_profile.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isEmail = false;
  final formKey = GlobalKey<FormState>();
  LoginController loginController = LoginController();
  TextEditingController phoneController = TextEditingController();

  var emailcontroler = TextEditingController();
  void setValues(String phone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('phone', phone);
  }

  String? token;

  @override
  void initState() {
    super.initState();
  }

  // Future<void> _loadToken() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     token = sharedPreferences.getString('token');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LogIn or Sign Up'.tr,
          // 'text1'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                isEmail
                    ? TextFormField(
                        controller: emailcontroler,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.email_outlined),
                          label: Text('Email'.tr),
                          // label: Text('text2'.tr),
                        ),
                      )
                    : IntlPhoneField(
                        cursorColor: AppColors.primaryColor,
                        controller: phoneController,
                        decoration: InputDecoration(
                            labelText: 'Registered Phone Number'.tr),
                        // decoration: InputDecoration(labelText: 'text3'.tr),
                      ),
                SizedBox(
                  height: height * 0.02,
                ),
                Obx(
                  () => LoginButton(
                    loading: loginController.isLoading.value,
                    title: 'LOGIN '.tr,
                    // title: 'text4'.tr,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        loginController.loginUser(phoneController.text);
                        

                        setValues(
                          phoneController.text,
                        );
                        
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Get.to(const CareerProfile());
                        },
                        child: const Text('Register now'))
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        isEmail = !isEmail;
                        setState(() {});
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.16,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 229, 195, 195),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isEmail
                                ? const Icon(Icons.alternate_email)
                                : const Icon(Icons.phone),
                            Text(
                              isEmail ? 'Email'.tr : 'Phone'.tr,
                              // isEmail ? 'text2'.tr : 'text5'.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        // handleGoogleButtonClk(context);
                      },
                      child: Container(
                          height: height * 0.06,
                          width: width * 0.16,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 229, 195, 195),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/google.png'),
                                height: 40,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Column(
                  children: [
                    Text('By registering, you are agree to the'.tr),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'MEQ Drive Privacy Policy'.tr,
                          // 'text7'.tr,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.deepPurpleAccent,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                // Text('text6'.tr),

                // Text('text8'.tr),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('As well as the'.tr),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'MEQ Drive Service Agreement'.tr,
                          // 'text9'.tr,
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.deepPurpleAccent,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
