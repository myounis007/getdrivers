import 'package:flutter/material.dart';
import 'package:get_transfer_driver/screens/auth/login_signup.dart';

import '../../widgets/bottom_navbar.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.bottomNabBarView:
        return MaterialPageRoute(
          builder: (BuildContext context) => const BottomNavScreen(),
        );
      case RoutesName.loginorsignup:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginOrSignup(),
        );
      case RoutesName.deleteAccount:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginOrSignup(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('no routes found'),
              ),
            );
          },
        );
    }
  }
}
