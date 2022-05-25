// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class Services extends GetxController {
//   bool loading = true;
//   List tokendatalist = [];
//   List? Logindatalist;

//   var uri = Uri.parse("http://139.59.44.251:8000/users");

//   login({required email, required password, required context}) async {
//     http.Response response = await http.post(
//         Uri.parse("http://139.59.44.251:8000/users/login"),
//         body: {"email": email, "password": password});
//     var fromjson = await jsonDecode(response.body);
//     print(fromjson);
//     Logindatalist = await fromjson;

//     // var check = Logindatalist![0]["Authentication"];

//     if (fromjson[0]["Authentication"]) {
//       final SharedPreferences preferences =
//           await SharedPreferences.getInstance();
//       var login =
//           await preferences.setString("token", Logindatalist![0]["token"]);
//       loading = true;
//       Get.offNamed("/splashscreen");
//     } else {
//       loading = true;
//       showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           content: Text(Logindatalist![0]["error"]),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'Retry'),
//               child: const Text('Retry'),
//             ),
//             TextButton(
//               onPressed: () => Get.offNamed("/signup"),
//               child: const Text('SignUp'),
//             ),
//           ],
//         ),
//       );
//     }
//     update();
//   }

//   signUp({required email, required password, required context}) async {
//     var response =
//         await http.post(uri, body: {"email": email, "password": password});

//     print(response.body);

//     if (response.body == "account is already created") {
//       loading = true;
//       update();
//       showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           content: const Text('Account is already Exist'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'Retry'),
//               child: const Text('Retry'),
//             ),
//             TextButton(
//               onPressed: () => Get.offNamed("/login"),
//               child: const Text('Login'),
//             ),
//           ],
//         ),
//       );
//     } else if (response.body == "Account Created Successfully") {
//       loading = true;
//       showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           content: const Text('Account Created Successfully'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Get.offNamed("/login"),
//               child: const Text('Login'),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   Future<List> token() async {
//     final SharedPreferences preferences = await SharedPreferences.getInstance();
//     var token = preferences.getString("token");

//     if (token != null) {
//       try {
//         http.Response response = await http.post(
//             Uri.parse("http://139.59.44.251:8000/users/login"),
//             body: {"token": token});
//         var data = await jsonDecode(response.body);
//         tokendatalist = data;

//         return tokendatalist;
//       } catch (e) {
//         print(e);
//         return tokendatalist;
//       }
//     } else {
//       return Future.error("");
//     }
//   }

//   logout(context) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.remove("token");
//     Get.toNamed("/loginsignup");
//     update();
//   }
// }
