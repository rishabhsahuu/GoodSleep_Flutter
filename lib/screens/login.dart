// import 'package:bettersleep/controller/colors.dart';
// import 'package:bettersleep/services/services.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LogIn extends StatefulWidget {
//   LogIn({Key? key}) : super(key: key);

//   @override
//   _LoginInState createState() => _LoginInState();
// }

// class _LoginInState extends State<LogIn> {
//   TextEditingController _username = TextEditingController();
//   TextEditingController _email = TextEditingController();
//   TextEditingController _password = TextEditingController();
//   final _formstate = GlobalKey<FormState>();
//   final services = Get.put(Services());
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(65.0),
//           child: AppBar(
//             backgroundColor: black,
//             elevation: 0.0,
//             centerTitle: true,
//             title: RichText(
//                 text: const TextSpan(
//                     text: "Log",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 23,
//                         fontWeight: FontWeight.bold),
//                     children: [
//                   TextSpan(
//                     text: "IN",
//                   )
//                 ])),
//           ),
//         ),
//         backgroundColor: black,
//         body: SizedBox.expand(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.1,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)),
//                   width: MediaQuery.of(context).size.width * 0.8,
//                   padding: const EdgeInsets.all(20),
//                   child: Form(
//                       key: _formstate,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             validator: (value) {
//                               if (value!.length <= 0) {
//                                 return "Email is short";
//                               } else if (value.length < 8) {
//                                 return "Enter vailed Email";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             controller: _email,
//                             decoration: InputDecoration(
//                                 hintText: "Enter your Email",
//                                 fillColor: Colors.black,
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20))),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             onFieldSubmitted: (value) {
//                               if (_formstate.currentState!.validate()) {
//                                 services.login(
//                                     email: _email.text.trim().toLowerCase(),
//                                     password: _password.text.trim(),
//                                     context: context);

//                                 setState(() {
//                                   services.loading = false;
//                                 });
//                               }
//                             },
//                             obscureText: true,
//                             obscuringCharacter: "*",
//                             validator: (value) {
//                               if (value!.length <= 0) {
//                                 return "Password can't be empty";
//                               } else if (value.length < 7) {
//                                 return "Password is too short";
//                               } else {
//                                 return null;
//                               }
//                             },
//                             controller: _password,
//                             decoration: InputDecoration(
//                                 hintText: "Enter your Password",
//                                 fillColor: Colors.black,
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20))),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           services.loading
//                               ? ElevatedButton.icon(
//                                   style:
//                                       ElevatedButton.styleFrom(primary: black),
//                                   onPressed: () {
//                                     if (_formstate.currentState!.validate()) {
//                                       services.login(
//                                           email:
//                                               _email.text.trim().toLowerCase(),
//                                           password: _password.text.trim(),
//                                           context: context);

//                                       setState(() {
//                                         services.loading = false;
//                                       });
//                                     }
//                                   },
//                                   icon: Icon(Icons.add),
//                                   label: Text("Login In"))
//                               : ElevatedButton(
//                                   style:
//                                       ElevatedButton.styleFrom(primary: black),
//                                   onPressed: () {
//                                     setState(() {
//                                       services.loading = true;
//                                     });
//                                   },
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.03,
//                                     height: MediaQuery.of(context).size.height *
//                                         0.02,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2,
//                                       color: Colors.white,
//                                     ),
//                                   )),
//                           SizedBox(
//                               height:
//                                   MediaQuery.of(context).size.height * 0.001),
//                           ElevatedButton.icon(
//                               style: ElevatedButton.styleFrom(primary: black),
//                               onPressed: () {
//                                 Get.offNamed("/signup");
//                               },
//                               icon: Icon(Icons.account_box),
//                               label: Text("SignUp"))
//                         ],
//                       )),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
