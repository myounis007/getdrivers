// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:get_transfer_driver/screen_widgets/button_widget.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   String _selectedItem = 'select'.tr;
//   bool _switchValue = false;
//   bool _switchValue1 = false;
//   bool _switchValue2 = false;
//   bool _switchValue3 = false;
//   bool _switchValue4 = false;

//   void _updateAllSwitches(bool value) {
//     setState(() {
//       _switchValue = value;
//       _switchValue1 = value;
//       _switchValue2 = value;
//       _switchValue3 = value;
//       _switchValue4 = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.sizeOf(context).height;
//     double width = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'notifications'.tr,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   height: 50,
//                   width: 300,
//                   child: DropdownButton(
//                     value: _selectedItem,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         _selectedItem = newValue!;
//                       });
//                     },
//                     items: [
//                       'item1'.tr,
//                       'item2'.tr,
//                       'item3'.tr,
//                       'item4'.tr,
//                       'item5'.tr,
//                       'item6'.tr,
//                       'item7'.tr,
//                       'item8'.tr,
//                       'item9'.tr,
//                       'item10'.tr,
//                       'item11'.tr,
//                     ].map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 Switch(
//                   activeTrackColor: Colors.deepPurple,
//                   value: _switchValue,
//                   onChanged: (bool newValue) {
//                     _updateAllSwitches(newValue);
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: height * .05,
//                   width: width * 0.7,
//                   child: Text(
//                     'item12'.tr,
//                   ),
//                 ),
//                 Switch(
//                   activeTrackColor: Colors.deepPurple,
//                   value: _switchValue1,
//                   onChanged: (bool newValue) {
//                     setState(() {
//                       _switchValue1 = newValue;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: height * .05,
//                   width: width * .7,
//                   child: Text(
//                     'item13'.tr,
//                   ),
//                 ),
//                 Switch(
//                   activeTrackColor: Colors.deepPurple,
//                   value: _switchValue2,
//                   onChanged: (bool newValue) {
//                     setState(() {
//                       _switchValue2 = newValue;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: height * .012),
//                   height: height * .05,
//                   width: width * .7,
//                   child: Text(
//                     'item14'.tr,
//                   ),
//                 ),
//                 Switch(
//                   activeTrackColor: Colors.deepPurple,
//                   value: _switchValue3,
//                   onChanged: (bool newValue) {
//                     setState(() {
//                       _switchValue3 = newValue;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   height: height * .05,
//                   width: width * .7,
//                   child: Text(
//                     'item15'.tr,
//                   ),
//                 ),
//                 Switch(
//                   activeTrackColor: Colors.deepPurple,
//                   value: _switchValue4,
//                   onChanged: (bool newValue) {
//                     setState(() {
//                       _switchValue4 = newValue;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//             ButtonWidget(
//               title: 'detail17'.tr,
//               onTap: () {},
//               color: Colors.deepPurple,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Services/notifications_services.dart';
import 'package:get_transfer_driver/screen_widgets/button_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationServices notificationServices = NotificationServices();

  String _selectedItem = 'Select all'.tr; // Initialize with one of the items
  bool _switchValue = false;
  bool _switchValue1 = false;
  bool _switchValue2 = false;
  bool _switchValue3 = false;
  bool _switchValue4 = false;

  void _updateAllSwitches(bool value) {
    setState(() {
      _switchValue = value;
      _switchValue1 = value;
      _switchValue2 = value;
      _switchValue3 = value;
      _switchValue4 = value;
    });
  }

  List<String> items = [
    'Select all'.tr,
    'Economy'.tr,
    'Comfort'.tr,
    'Business'.tr,
    'Premium'.tr,
    'VIP'.tr,
    'SUV'.tr,
    'Van'.tr,
    'Minibus'.tr,
    'Bus'.tr,
    'Parcel'.tr,
  ];
  @override
  void initState() {
    // notificationServices.isTokenRefresh();
    super.initState();
    notificationServices.requestNotificationsPermission();
    notificationServices.firebaseInit(context);

    notificationServices.getDeviceToken().then((tokenvalue) {
      print('device token is:> $tokenvalue');
    });
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 270,
                  child: DropdownButton<String>(
                    value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                      });
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Switch(
                  activeTrackColor: Colors.deepPurple,
                  value: _switchValue,
                  onChanged: (bool newValue) {
                    _updateAllSwitches(newValue);

                    //notification permission

                    // device token for firebase to send notification
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            buildSwitchRow(
                context,
                'Receive notifications about new ride \nrequests by push'.tr,
                _switchValue1, (bool newValue) {
              setState(() {
                _switchValue1 = newValue;
              });
            }),
            const SizedBox(height: 20),
            buildSwitchRow(
                context,
                'Receive notifications about new ride \nrequests by email'.tr,
                _switchValue2, (bool newValue) {
              setState(() {
                _switchValue2 = newValue;
              });
            }),
            const SizedBox(height: 20),
            buildSwitchRow(
                context,
                'Receive pushes about nearby urgent \nrequests'.tr,
                _switchValue3, (bool newValue) {
              setState(() {
                _switchValue3 = newValue;
              });
            }),
            const SizedBox(height: 20),
            buildSwitchRow(
                context,
                'Receive notifications 24 hours prior to\nthe ride start'.tr,
                _switchValue4, (bool newValue) {
              setState(() {
                _switchValue4 = newValue;
              });
            }),
            const SizedBox(height: 30),
            ButtonWidget(
              title: 'SAVE'.tr,
              onTap: () {},
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwitchRow(BuildContext context, String text, bool value,
      ValueChanged<bool> onChanged) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: height * .05,
          width: width * 0.7,
          child: Text(text),
        ),
        Switch(
          activeTrackColor: Colors.deepPurple,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
