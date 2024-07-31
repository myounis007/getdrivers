import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Controllers/distance_controller.dart';
import 'package:get_transfer_driver/Services/googel_sign_in.dart';
import 'package:get_transfer_driver/screen_widgets/listtile_widget.dart';
import 'package:get_transfer_driver/screens/setting_screens/account_setting.dart';
import 'package:get_transfer_driver/screens/setting_screens/carrier_profile.dart';
import 'package:get_transfer_driver/screens/setting_screens/document.dart';
import 'package:get_transfer_driver/screens/setting_screens/instructions_screen.dart';
import 'package:get_transfer_driver/screens/setting_screens/notification_screen.dart';
import 'package:get_transfer_driver/screens/setting_screens/payment_details.dart';
import 'package:get_transfer_driver/screens/setting_screens/payment_report.dart';
import 'package:get_transfer_driver/screens/setting_screens/registration_screen.dart';
import 'package:get_transfer_driver/screens/setting_screens/support_screen.dart';
import 'package:get_transfer_driver/screens/setting_screens/user_screen.dart';
import 'package:get_transfer_driver/screens/setting_screens/Vehicle/vehicles_screen.dart';
import 'package:language_picker/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _selectedCurrency;
  String? _selectedDistanceUnit;
  Language? _selectedLanguage;
  DistanceController distanceController = Get.put(DistanceController());
  void _showCurrencyPicker(BuildContext context) {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) {
        setState(() {
          _selectedCurrency = currency.name;
        });
      },
    );
  }

  void _showDistanceUnitPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        double height = MediaQuery.sizeOf(context).height;
        String? selectedUnit =
            _selectedDistanceUnit; // Local variable to keep track of the selection within the modal

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: height * .26,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Select Distance Unit'),
                    trailing: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder(
                          future: distanceController.fetchDistanceData(),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                title: Text(snapshot.data!.data![index].distance
                                    .toString()),
                                trailing: selectedUnit ==
                                        snapshot.data!.data![index].distance
                                            .toString()
                                    ? const Icon(Icons.done,
                                        color: Colors.green)
                                    : null,
                                onTap: () {
                                  setModalState(() {
                                    selectedUnit = snapshot
                                        .data!.data![index].distance
                                        .toString();
                                  });
                                  setState(() {
                                    _selectedDistanceUnit = snapshot
                                        .data!.data![index].distance
                                        .toString();
                                  });
                                  Navigator.of(context).pop();
                                },
                              );
                            }
                          }));
                    },
                  ),
                ],
              ),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisSize: MainAxisSize.min,
              //   children: <Widget>[
              //     ListTile(
              //       title: const Text('Select Distance Unit'),
              //       trailing: IconButton(
              //         icon: const Icon(Icons.close),
              //         onPressed: () => Navigator.of(context).pop(),
              //       ),
              //     ),
              //     const Divider(),
              //     ListTile(
              //       title: const Text('Miles'),
              //       trailing: selectedUnit == 'Miles'
              //           ? const Icon(Icons.done, color: Colors.green)
              //           : null,
              //       onTap: () {
              //         setModalState(() {
              //           selectedUnit = 'Miles';
              //         });
              //         setState(() {
              //           _selectedDistanceUnit = 'Miles';
              //         });
              //         Navigator.of(context).pop();
              //       },
              //     ),
              //   ],
              // ),
            );
          },
        );
      },
    );
  }

  Future<void> _saveLocale(String languageCode, String countryCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
    await prefs.setString('country_code', countryCode);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              // listTileWidget(
              //     'Account setting', Icons.person, Icons.keyboard_arrow_right,
              //     () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: ((context) => const AccountSettingScreen())));
              // }),
              listTileWidget('Account settings'.tr, Icons.person,
                  Icons.keyboard_arrow_right, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AccountSettingScreen())));
              }),
              const Divider(),
              listTileWidget('Notifications'.tr, Icons.notification_important,
                  Icons.keyboard_arrow_right, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const NotificationScreen())));
              }),
              const Divider(),
              listTileWidget(
                  'Vehicles'.tr, Icons.car_crash, Icons.keyboard_arrow_right,
                  () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const VehiclesScreen())));
              }),
              const Divider(),
              listTileWidget(
                  'Users'.tr, Icons.person, Icons.keyboard_arrow_right, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const UserScreen())));
              }),
              const Divider(),
              listTileWidget('Carrier profile'.tr, Icons.error_outline,
                  Icons.keyboard_arrow_right, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const CarriersProfileScreen())));
              }),
              const Divider(),
              listTileWidget('Registration details'.tr, Icons.edit_document,
                  Icons.keyboard_arrow_right, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const RegistrationDetailsScreen())));
              }),
              const Divider(),
              listTileWidget('Payment Details'.tr, Icons.attach_money,
                  Icons.keyboard_arrow_right, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const PaymentDetailScreen())));
              }),
              const Divider(),
              listTileWidget('Payment Reports'.tr, Icons.payment,
                  Icons.keyboard_arrow_right, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const PaymentReportScreen())));
              }),
              const Divider(),
              listTileWidget(
                  'Documents'.tr, Icons.badge, Icons.keyboard_arrow_right, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const DocumentsScreen())));
              }),
              const Divider(),
              listTileWidget('Instructions'.tr, Icons.menu_book,
                  Icons.keyboard_arrow_right, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const InstructionsScreen())));
              }),
              const Divider(),
              listTileWidget('Support'.tr, Icons.question_mark_sharp,
                  Icons.keyboard_arrow_right, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SupportScreen())));
              }),
              const Divider(),
              ListTile(
                title: Text(
                    '${'Currency'.tr}(${_selectedCurrency ?? 'select'.tr})'),
                leading: const Icon(Icons.attach_money),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  _showCurrencyPicker(context);
                },
              ),
              const Divider(),
              ListTile(
                title: Text(
                  '${'Distance unit'.tr} (${_selectedDistanceUnit != null ? _selectedDistanceUnit!.tr : 'select'.tr})',
                ),
                leading: const Icon(Icons.social_distance),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  _showDistanceUnitPicker(context);
                  distanceController.fetchDistanceData();
                },
              ),

              const Divider(),
              // ListTile(
              //   title:
              //       Text('Language (${_selectedLanguage?.name ?? 'Select'})'),
              //   leading: const Icon(Icons.language),
              //   trailing: const Icon(Icons.keyboard_arrow_right),
              //   onTap: () {
              //     _showLanguagePicker(context);
              //   },
              // ),
              ListTile(
                title: Text(
                    '${'Languages'.tr}(${_selectedLanguage?.name ?? 'select'.tr})'),
                leading: const Icon(Icons.language),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  // _showLanguagePicker(context);
                  showModalBottomSheet(
                    context: context,
                    builder: ((context) {
                      return Container(
                        height: height * .15,
                        width: width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Select Language',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: height * .012,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: width * .5,
                                            margin: const EdgeInsets.all(10),
                                            height: height * .7,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(29)
                                                // color: Colors.white,
                                                ),
                                            child: Material(
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'en', 'US');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'en', 'US'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'English (USA)'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'ur', 'PK');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'ur', 'PK'));

                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title:
                                                            const Text('Urdu '),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'hi', 'IN');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'hi', 'IN'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title:
                                                            const Text('Hindi'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'fr', 'FR');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'fr', 'FR'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'French'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'de', 'DE');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'de', 'DE'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'German'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'zh', 'CN');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'zh', 'CN'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'Chinese'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'ja', 'JP');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'ja', 'JP'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'Japanese'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'ru', 'RU');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'ru', 'RU'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'Russian'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'ar', 'AR');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'ar'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'Arabic'),
                                                      ),

                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'pt', 'PT');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'pt', 'PT'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'Portuguese'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'it', 'IT');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'it', 'IT'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'Italian'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'ko', 'KR');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'ko', 'KR'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'Korean'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'nl', 'NL');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'nl', 'NL'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title:
                                                            const Text('Dutch'),
                                                      ),
                                                      ListTile(
                                                        onTap: () async {
                                                          await _saveLocale(
                                                              'tr', 'TR');
                                                          Get.updateLocale(
                                                              const Locale(
                                                                  'tr', 'TR'));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        leading: const Icon(
                                                          Icons.language,
                                                          color:
                                                              Colors.deepPurple,
                                                          size: 26,
                                                        ),
                                                        title: const Text(
                                                            'Turkish'),
                                                      ),
                                                      // ListTile(
                                                      //   onTap: () {
                                                      //     Get.updateLocale(
                                                      //         const Locale(
                                                      //             'ur', 'PK'));
                                                      //     Navigator.pop(context);
                                                      //   },
                                                      //   title: const Text('Urdu'),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }));
                              },
                              child: Container(
                                height: height * .06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Selected Language',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  // Get.updateLocale(Locale('ur', 'PK'));
                },
                child: Container(
                  height: height * 0.05,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        print('user signout succesfully ');
                        Utils.flushbarMessage;
                        signOut(context);
                      },
                      child: Text(
                        'Logout'.tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const Text('version 20.0.5(4273)')
            ],
          ),
        ),
      ),
    );
  }
}
