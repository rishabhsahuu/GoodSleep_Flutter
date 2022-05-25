import 'package:bettersleep/controller/colors.dart';
import 'package:bettersleep/screens/homescreen.dart';
import 'package:bettersleep/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'navigationbar.dart';

import 'loginsignup.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final services = Get.put(Services());
  Future splashscreendelay() {
    return Future.error("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: splashscreendelay(),
        // This is for login system
        // services.token(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Navigationscreen();
          }
          // This is for loginsignup
          // if (snapshot.hasError) {
          //   return Loginsignupscreen();
          // } else if (snapshot.hasData) {
          //   return Navigationscreen();
          // }
          else {
            return Center(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Good",
                      style: TextStyle(fontSize: 40, color: white)),
                  TextSpan(
                      text: "Sleep",
                      style: TextStyle(fontSize: 41, color: blue)),
                ]),
              ),
            );
          }
        },
      ),
    );
  }
}
