import 'package:bettersleep/controller/colors.dart';
import 'package:bettersleep/screens/audioplaying.dart';
import 'package:bettersleep/services/appdataservice.dart';
import 'package:bettersleep/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homescreen.dart';
import 'search.dart';

class Navigationscreen extends StatefulWidget {
  Navigationscreen({Key? key}) : super(key: key);

  @override
  _NavigationscreenState createState() => _NavigationscreenState();
}

class _NavigationscreenState extends State<Navigationscreen> {
  // final services = Get.put(Services());
  final appdataservices = Get.put(Appdataservices());
  var _currentindex = 0;
  List<Widget> _widgets = <Widget>[HomeScreen(), Search(), Audioplaying()];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: blue, borderRadius: BorderRadius.circular(15)),
            child: BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: blue,
              items: [
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    ),
                    backgroundColor: blue),
                BottomNavigationBarItem(
                    label: "",
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    )),
                BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.music_video,
                    size: 30,
                  ),
                ),
              ],
              selectedItemColor: white,
              currentIndex: _currentindex,
              onTap: (value) {
                setState(() {
                  _currentindex = value;
                  appdataservices.isfromnavbar = true;
                });
              },
            ),
          ),
          backgroundColor: black,
          body: _widgets.elementAt(_currentindex)),
    );
  }
}
