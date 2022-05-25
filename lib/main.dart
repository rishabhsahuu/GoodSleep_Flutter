import 'package:bettersleep/screens/audioplaying.dart';
import 'package:bettersleep/screens/login.dart';

import 'package:bettersleep/screens/search.dart';
import 'package:bettersleep/screens/signup.dart';
import 'package:bettersleep/screens/splashscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'screens/homescreen.dart';
import 'screens/loginsignup.dart';
import 'screens/showaudios.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(BetterSleep());
}

class BetterSleep extends StatefulWidget {
  BetterSleep({Key? key}) : super(key: key);

  @override
  _BetterSleepState createState() => _BetterSleepState();
}

class _BetterSleepState extends State<BetterSleep> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splashscreen",
      routes: {
        "/splashscreen": (context) => SplashScreen(),
        "/home": (context) => HomeScreen(),
        // These routes is for login and signup
        // "/loginsignup": (context) => Loginsignupscreen(),
        // "/login": (context) => LogIn(),
        // "/signup": (context) => SignUp(),
        "/showaudios": (context) => Showaudios(),
        "/audioplaying": (context) => Audioplaying(),
        "/search": (context) => Search(),
      },
    );
  }
}
