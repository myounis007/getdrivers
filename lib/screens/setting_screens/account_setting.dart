import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Controllers/account_delete_controller.dart';
import 'package:get_transfer_driver/Controllers/user_detail_controller.dart';
import 'package:get_transfer_driver/screen_widgets/button_widget.dart';
import 'package:get_transfer_driver/screen_widgets/listtile_widget.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  final AccountDeleteController accountDeleteController =
      Get.put(AccountDeleteController());
  final UserDetailController userDetailController =
      Get.put(UserDetailController());

  @override
  void initState() {
    super.initState();
    userDetailController.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Account settings'.tr,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Obx(() {
        if (userDetailController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (userDetailController.userDetail.value == null) {
          return const Center(child: Text('No data available'));
        } else {
          final userDetails = userDetailController.userDetail.value;
          final userName = userDetails?.name ?? 'No Name';
          final userPhone = userDetails?.phone ?? 'No Phone';
          final userEmail = userDetails?.email ?? 'No Email';
          return Column(
            children: [
              listTileWidget(
                  userName, Icons.person, Icons.keyboard_arrow_right, () {}),
              const Divider(),
              listTileWidget(
                  userPhone, Icons.phone, Icons.keyboard_arrow_right, () {}),
              const Divider(),
              listTileWidget(
                  userEmail, Icons.email, Icons.keyboard_arrow_right, () {}),
              const Divider(),
              SizedBox(height: height * 0.02),
              ButtonWidget(
                title: 'DELETE MY ACCOUNT'.tr,
                onTap: () {
                  log('User Info: $userName, $userPhone, $userEmail');
                  accountDeleteController.deleteAccount(
                      userName, userPhone, userEmail, context);
                },
                color: Colors.deepPurple,
              ),
            ],
          );
        }
      }),
    );
  }
}
