import 'package:bettersleep/services/appdataservice.dart';
import 'package:bettersleep/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bettersleep/controller/colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final appdataservices = Get.put(Appdataservices());
  // final services = Get.put(Services());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        //this is for logout app
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         services.logout(context);
        //       },
        //       icon: Icon(Icons.logout))
        // ],
      ),
      backgroundColor: black,
      body: FutureBuilder(
        future: appdataservices.getdata(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                        "/showaudios",
                        arguments: index,
                      );
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(snapshot.data[index]
                                            ["thumbnail"]
                                        .toString())),
                                color: white,
                                borderRadius: BorderRadius.circular(20)),
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.width * 0.37,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(snapshot.data[index]["categories"],
                              style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))
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
