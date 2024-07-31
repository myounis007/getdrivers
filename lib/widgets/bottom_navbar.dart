import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_transfer_driver/screens/rides_screens/Rides_screen.dart';
import 'package:get_transfer_driver/screens/chats_screen.dart';
import 'package:get_transfer_driver/screens/dispatcher_screen.dart';
import 'package:get_transfer_driver/screens/requests_screen.dart';
import 'package:get_transfer_driver/screens/setting_screens/settings_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int index = 0;
  List screens = [
    const RequestsScreen(),
    const RidesScreen(),
    ChatsScreen(),
    const DispatcherScreen(),
    const SettingsScreen()
  ];

  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          buttonBackgroundColor: Colors.white,
          color: Colors.deepPurple,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOutCubic,
          items: [
            IconTheme(
              data: IconThemeData(
                  color: myIndex == 0 ? Colors.deepPurple : Colors.white),
              child: const Icon(Icons.location_city),
            ),
            IconTheme(
              data: IconThemeData(
                  color: myIndex == 1 ? Colors.deepPurple : Colors.white),
              child: const Icon(Icons.calendar_month_outlined),
            ),
            IconTheme(
              data: IconThemeData(
                  color: myIndex == 2 ? Colors.deepPurple : Colors.white),
              child: const Icon(Icons.wechat_sharp),
            ),
            IconTheme(
              data: IconThemeData(
                  color: myIndex == 3 ? Colors.deepPurple : Colors.white),
              child: const Icon(Icons.navigation),
            ),
            IconTheme(
              data: IconThemeData(
                  color: myIndex == 4 ? Colors.deepPurple : Colors.white),
              child: const Icon(Icons.settings),
            ),
          ]),
      body: screens[myIndex],
    );
  }
}
