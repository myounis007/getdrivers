// ignore_for_file: prefer_const_constructors

import 'package:email_otp/email_otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_transfer_driver/Languages/languages.dart';
import 'package:get_transfer_driver/firebase_options.dart';
import 'package:get_transfer_driver/screens/auth/login_signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utils/routes/routes_name.dart';
import 'widgets/bottom_navbar.dart';

Future<void> main() async {
  EmailOTP.config(
    appName: 'Sposync',
    otpType: OTPType.numeric,
    emailTheme: EmailTheme.v5,
    otpLength: 4,
    appEmail: 'myounis4707@gmail.com',
  );
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final locale = await getSavedLocale();

  //background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaeMessagingBackgroundHandler);

  runApp(
    MyApp(locale: locale),
  );
}

@pragma('vm:entry:point')
Future<void> _firebaeMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print(message.notification!.title.toString());
  }
}

Future<Locale?> getSavedLocale() async {
  final prefs = await SharedPreferences.getInstance();
  final languageCode = prefs.getString('t');
  final countryCode = prefs.getString('country_code');
  if (languageCode != null && countryCode != null) {
    return Locale(languageCode, countryCode);
  }
  return null;
}

class MyApp extends StatelessWidget {
  final Locale? locale;

  const MyApp({super.key, this.locale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: locale,
      theme: ThemeData(
        appBarTheme:
            AppBarTheme(centerTitle: true, backgroundColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryTextTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).primaryTextTheme,
        ),
      ),
      initialRoute: RoutesName.loginorsignup,
      getPages: [
        GetPage(
          name: RoutesName.loginorsignup,
          page: () => LoginOrSignup(),
        ),
        GetPage(
          name: RoutesName.bottomNabBarView,
          page: () => BottomNavScreen(),
        ),
        GetPage(
          name: RoutesName.deleteAccount,
          page: () => LoginOrSignup(),
        ),
      ],
    );
  }
}
