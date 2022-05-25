// import 'package:bettersleep/controller/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Loginsignupscreen extends StatefulWidget {
//   Loginsignupscreen({Key? key}) : super(key: key);

//   @override
//   _LoginsignupscreenState createState() => _LoginsignupscreenState();
// }

// class _LoginsignupscreenState extends State<Loginsignupscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: black,
//       body: SizedBox.expand(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.01,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   image: DecorationImage(
//                       fit: BoxFit.fill,
//                       image: AssetImage(
//                         "assets/images/relaxinmountain.jpg",
//                       ))),
//               margin: EdgeInsets.symmetric(horizontal: 50),
//               height: MediaQuery.of(context).size.height * 0.5,
//               width: MediaQuery.of(context).size.width * 0.7,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   color: white, borderRadius: BorderRadius.circular(20)),
//               height: MediaQuery.of(context).size.height * 0.3,
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.toNamed("/login");
//                     },
//                     child: Container(
//                       child: Center(
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                               color: white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       height: MediaQuery.of(context).size.width * 0.15,
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       decoration: BoxDecoration(
//                           color: black,
//                           borderRadius: BorderRadius.circular(20)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.02,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Get.toNamed("/signup");
//                     },
//                     child: Container(
//                       child: Center(
//                         child: Text(
//                           "SignUp",
//                           style: TextStyle(
//                               color: white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       height: MediaQuery.of(context).size.width * 0.15,
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       decoration: BoxDecoration(
//                           color: black,
//                           borderRadius: BorderRadius.circular(20)),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
