import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/screens/auth/enter_otp.dart';
import 'package:get_transfer_driver/widgets/button_emailotp.dart';
// ignore: depend_on_referenced_packages
import 'package:email_otp/email_otp.dart';
import '../../Controllers/text_field_controller.dart';

class EmailCodeView extends StatefulWidget {
  const EmailCodeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmailCodeViewState createState() => _EmailCodeViewState();
}

class _EmailCodeViewState extends State<EmailCodeView> {
  final _controller = Get.put(TextFieldController());
  final _emailtextFieldController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailtextFieldController.addListener(() {
      _controller.text = _emailtextFieldController.text;
    });
  }

  @override
  void dispose() {
    _emailtextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        _controller.clearText();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login or Sign Up'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => TextField(
                  controller: _emailtextFieldController,
                  onChanged: (value) => _controller.text = value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.alternate_email_outlined,
                      size: 30,
                    ),
                    labelText: 'Email',
                    hintText: 'Email',
                    errorText: _controller.isError
                        ? 'Please fill in this field'
                        : null,
                    suffixIcon: _controller.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _emailtextFieldController.clear();
                              _controller.clearText();
                            },
                          )
                        : (_controller.isError
                            ? const Icon(Icons.error, color: Colors.red)
                            : null),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      title: 'Request login Code',
                      minWidth: 0,
                      maxWidth: MediaQuery.of(context).size.width,
                      minHeight: 50,
                      onPressed: () async {
                        _controller.validateAndSubmit;

                        _isLoading = true;

                        bool isSent = await EmailOTP.sendOTP(
                          email: _emailtextFieldController.text,
                        );

                        _isLoading = false;

                        if (isSent) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("OTP Sent to Email Successfully"),
                            ),
                          );

                          String? emailText = _emailtextFieldController.text;
                          Get.to(const OtpScreenView(), arguments: emailText);
                        }
                      },
                      color: Colors.deepPurple),
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
        ),
      ),
    );
  }
}
