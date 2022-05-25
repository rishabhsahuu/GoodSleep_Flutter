import 'dart:core';

import 'package:bettersleep/controller/colors.dart';

import 'package:bettersleep/services/appdataservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Audioplaying extends StatefulWidget {
  Audioplaying({Key? key}) : super(key: key);

  @override
  _AudioplayingState createState() => _AudioplayingState();
}

class _AudioplayingState extends State<Audioplaying> {
  var data = Get.arguments;
  var appdataservices = Get.put(Appdataservices());
  var time;

  List timeertime = [
    {"text": "5 min", "time": Duration(minutes: 5)},
    {"text": "10 min", "time": Duration(minutes: 10)},
    {"text": "20 min", "time": Duration(minutes: 20)},
    {"text": "30 min", "time": Duration(minutes: 30)},
    {"text": "1 hour", "time": Duration(hours: 1)},
    {"text": "2 hour", "time": Duration(hours: 2)},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appdataservices.fetchnavbardata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
      ),
      body: SizedBox.expand(
        child: GetBuilder<Appdataservices>(
          builder: (appdataservices) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.27,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    color: blue,
                    image: appdataservices.isfromnavbar
                        ? DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(appdataservices.imageurl))
                        : DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(data[1]))),
              ),
              appdataservices.isfromnavbar
                  ? Text(
                      appdataservices.audioname,
                      style: TextStyle(color: white, fontSize: 27),
                    )
                  : Text(
                      data[2],
                      style: TextStyle(color: white, fontSize: 27),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      iconSize: 30,
                      color: white,
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: black,
                            scrollable: true,
                            title: const Text(
                              'Choose specific time to stop audios',
                              style: TextStyle(color: Colors.white),
                            ),
                            content: SizedBox(
                              height: 200,
                              width: 150,
                              child: ListView.builder(
                                  itemCount: timeertime.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () async {
                                        // Workmanager().registerOneOffTask(
                                        //   "1",
                                        //   task1,
                                        // );

                                        time = appdataservices.startTimeout(
                                            timeertime[index]["time"]);
                                        Get.back();
                                      },
                                      title: Text(
                                        timeertime[index]["text"].toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Close'),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.timer)),
                  InkWell(
                    onTap: () {
                      appdataservices.isplaying ? false : true;
                      appdataservices.isfromnavbar
                          ? appdataservices.play(appdataservices.audiourl)
                          : appdataservices.play(data[0]);
                    },
                    child: CircleAvatar(
                      radius: 35,
                      child: Center(
                          child: appdataservices.isplaying
                              ? Icon(
                                  Icons.pause,
                                  size: 50,
                                  color: black,
                                )
                              : Icon(
                                  Icons.play_arrow_outlined,
                                  size: 50,
                                  color: black,
                                )),
                      backgroundColor: white,
                    ),
                  ),
                  IconButton(
                      iconSize: 30,
                      color: white,
                      onPressed: () async {
                        // appdataservices.stop();
                        audioPlayer.stop();
                        if (time != null) {
                          time.cancel();
                        }
                        setState(() {
                          appdataservices.isplaying = false;
                        });
                      },
                      icon: Icon(Icons.stop_circle_outlined)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
