import 'package:bettersleep/controller/colors.dart';
import 'package:bettersleep/services/appdataservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final search = Get.put(Appdataservices());
  final searchcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.all(5),
                  child: TextFormField(
                      onFieldSubmitted: (value) {
                        print("tap");

                        search.fetchsearchresult(text: searchcontroller.text);
                      },
                      textInputAction: TextInputAction.search,
                      controller: searchcontroller,
                      decoration: InputDecoration(
                        fillColor: white,
                        hintText: "Enter a Audio name",
                        suffixIcon: InkWell(
                          onTap: () {
                            print("tap");

                            search.fetchsearchresult(
                                text: searchcontroller.text);
                          },
                          child: Icon(Icons.search),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<Appdataservices>(
        builder: (search) => SizedBox.expand(
          child: FutureBuilder(
              future: search.search,
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    " no result found",
                    style: TextStyle(color: white, fontSize: 19),
                  ));
                } else if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                    ),
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            child: ListTile(
                              leading: Image.network(snapshot.data[index]["_id"]
                                      ["imagefilepath"]
                                  .toString()),
                              onTap: () {
                                search.navbaraudiodata(
                                    audio: snapshot.data[index]["_id"]
                                        ["audiofilepath"],
                                    image: snapshot.data[index]["_id"]
                                        ["imagefilepath"],
                                    name: snapshot.data[index]["_id"]
                                        ["audioname"]);
                                search.isfromnavbar = false;
                                Get.toNamed("/audioplaying", arguments: [
                                  snapshot.data[index]["_id"]["audiofilepath"],
                                  snapshot.data[index]["_id"]["imagefilepath"],
                                  snapshot.data[index]["_id"]["audioname"],
                                  search.playfromsearch(snapshot.data[index]
                                      ["_id"]["audiofilepath"])
                                ]);
                              },
                              textColor: white,
                              title: Text(
                                snapshot.data[index]["_id"]["audioname"]
                                    .toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return Center(
                      child: Text(
                    " Search Audios using Search bar",
                    style: TextStyle(color: white, fontSize: 19),
                  ));
                }
              }),
        ),
      ),
    );
  }
}
