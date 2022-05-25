import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

final audioPlayer = AudioPlayer(playerId: "audio");

class Appdataservices extends GetxController {
  var uri = Uri.parse("http://139.59.44.251:8000/");
  List? getdatalist;

  bool isplaying = false;
  bool isfromnavbar = true;
  String imageurl = "";
  String audiourl = "";
  String audioname = "";
  Future<List?> getdata() async {
    try {
      http.Response response = await http.get(uri);

      var fromjson = await jsonDecode(response.body);

      getdatalist = await fromjson;

      return getdatalist;
    } catch (e) {
      return getdatalist;
    }
  }

  Future? search;

  fetchsearchresult({required text}) async {
    search = searchdata(text: text);
    update();
  }

  List searchdatalist = [];
  Future<List?> searchdata({required text}) async {
    http.Response response = await http.post(
        Uri.parse("http://139.59.44.251:8000/search"),
        body: {"search": text});

    var fromjson = await jsonDecode(response.body);

    List nulldata = [];
    searchdatalist = nulldata;
    searchdatalist = await fromjson;

    if (fromjson[0]["error"] == null) {
      return fromjson;
    } else {
      return Future.error("error");
    }
  }

  List navbarlist = [];
  navbaraudiodata({image, audio, name}) async {
    final preference = await SharedPreferences.getInstance();

    preference.setString("image", image);
    preference.setString("audio", audio);
    preference.setString("name", name);
  }

  fetchnavbardata() async {
    final preference = await SharedPreferences.getInstance();
    audiourl = preference.getString("audio")!;
    imageurl = preference.getString("image")!;
    audioname = preference.getString("name")!;
  }

  play(url) async {
    if (!isplaying) {
      int result = await audioPlayer.play(url, isLocal: false);

      if (result == 1) {
        audioPlayer.setReleaseMode(ReleaseMode.LOOP);
        isplaying = true;
        update();
        audioPlayer.onPlayerCompletion.listen((event) {
          isplaying = false;
          update();
        });
      }
    } else {
      audioPlayer.pause();
      isplaying = false;
    }
    update();
  }

  playfromsearch(url) async {
    int result = await audioPlayer.play(url, isLocal: false);

    if (result == 1) {
      audioPlayer.setReleaseMode(ReleaseMode.LOOP);
      isplaying = true;
      update();
      audioPlayer.onPlayerCompletion.listen((event) {
        isplaying = false;
        update();
      });
    }
  }

  stop() async {
    await audioPlayer.stop();
    isplaying = false;

    update();
  }

  startTimeout(duration) {
    return new Timer(duration, stop);
  }
}

class User {
  dynamic key;

  User(this.key);

  @override
  String toString() {
    return '{ ${this.key}}';
  }
}
