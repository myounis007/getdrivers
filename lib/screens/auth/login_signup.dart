import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screens/auth/send_otp.dart';
import 'package:get_transfer_driver/widgets/custom_button.dart';

import '../../Services/googel_sign_in.dart';

class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login or Sign Up'),
      ),
      body: Column(
        children: [
          CustomContinueButton(
            icon:
                const Icon(Icons.alternate_email_rounded, color: Colors.black),
            label: 'continue with email',
            onTap: () {
              Get.to(
                 EmailCodeView(),
              );
            },
            color: Colors.white,
          ),
          CustomContinueButton(
            icon: const Icon(Icons.phone_android_outlined, color: Colors.black),
            label: 'continue with phone',
            onTap: () {},
            color: Colors.white,
          ),
          CustomContinueButton(
            icon: Image.asset(
              'assets/google.png',
              fit: BoxFit.cover,
            ),
            label: 'continue with google',
            onTap: () {
              handleGoogleButtonClk(context);
            },
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(.89),
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'By registering, you agree to the ',
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  TextSpan(
                    text: 'GetTransfer Privacy Policy',
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text: ', as well as the ',
                    style: TextStyle(color: Colors.black38),
                  ),
                  TextSpan(
                    text: 'GetTransfer Services Agreement.',
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
