import 'package:bettersleep/controller/colors.dart';
import 'package:bettersleep/services/appdataservice.dart';
import 'package:bettersleep/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Showaudios extends StatefulWidget {
  Showaudios({Key? key}) : super(key: key);

  @override
  _ShowaudiosState createState() => _ShowaudiosState();
}

class _ShowaudiosState extends State<Showaudios> {
  // final services = Get.put(Services());
  final appdataservices = Get.put(Appdataservices());
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: appdataservices.getdata(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data[data]["data"].length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      appdataservices.navbaraudiodata(
                          image: snapshot.data[data]["data"][index]
                              ["imagefilepath"],
                          audio: snapshot.data[data]["data"][index]
                              ["audiofilepath"],
                          name: snapshot.data[data]["data"][index]
                              ["audioname"]);
                      appdataservices.isfromnavbar = false;
                      Get.toNamed("/audioplaying", arguments: [
                        snapshot.data[data]["data"][index]["audiofilepath"],
                        snapshot.data[data]["data"][index]["imagefilepath"],
                        snapshot.data[data]["data"][index]["audioname"]
                      ]);
                      appdataservices.playfromsearch(
                          snapshot.data[data]["data"][index]["audiofilepath"]);
                      appdataservices.fetchnavbardata();
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(snapshot.data[data]
                                        ["data"][index]["imagefilepath"])),
                                color: white,
                                borderRadius: BorderRadius.circular(20)),
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.37,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.036,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Center(
                              child: Text(
                                  snapshot.data[data]["data"][index]
                                      ["audioname"],
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
