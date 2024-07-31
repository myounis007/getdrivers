import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/widgets/button_emailotp.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
// ignore: depend_on_referenced_packages
import 'package:email_otp/email_otp.dart';

import '../career_profile.dart';

// ignore: must_be_immutable
class OtpScreenView extends StatefulWidget {
  const OtpScreenView({super.key});

  @override
  State<OtpScreenView> createState() => _OtpScreenViewState();
}

class _OtpScreenViewState extends State<OtpScreenView> {
  var otpController = OtpFieldController();

  String? otpPIn;

  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    final String emailText = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Code'),
      ),
      body: Column(
        children: [
          OTPTextField(
            controller: otpController,
            length: 4,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldWidth: 45,
            fieldStyle: FieldStyle.box,
            outlineBorderRadius: 15,
            style: const TextStyle(fontSize: 17),
            onChanged: (pin) {
              setState(() {
                otpPIn = pin;
              });
              log(pin);
            },
            onCompleted: (pin) {
              setState(() {
                otpPIn = pin;
              });
              log(pin);
            },
          ),
          if (_errorText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _errorText,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10),
              child: Text(textAlign: TextAlign.left, 'check your email'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: emailText.isNotEmpty
                    ? Text(textAlign: TextAlign.left, emailText)
                    : const Text('your entered email show here')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
                minWidth: 0,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: 50,
                onPressed: () async {
                  if (await EmailOTP.sendOTP(email: otpPIn!)) {
                    Fluttertoast.showToast(
                        msg: "otp to email send succesfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.deepPurple,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "OTP sent failed ❌",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.deepPurple,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                color: Colors.deepPurple,
                title: 'Resend code to email'),
          ),
          CustomButton(
              minWidth: 0,
              maxWidth: MediaQuery.of(context).size.width,
              minHeight: 50,
              onPressed: () {
                if (otpPIn != null && otpPIn!.length == 4) {
                  if (EmailOTP.verifyOTP(otp: otpPIn!) == true) {
                    Get.offAll(const CareerProfile());
                  }
                } else {
                  setState(() {
                    _errorText = 'please enter 4 digit pin';
                  });
                }
              },
              color: Colors.deepPurple,
              title: 'verify otp'),
        ],
      ),
    );
  }
}
