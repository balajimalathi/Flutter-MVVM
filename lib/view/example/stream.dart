// import 'dart:collection';
// import 'package:buildbase/core/base/model/base_model.dart';
// import 'package:buildbase/core/constants/enums/connectivity.dart'; 
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Person {
//   Person({required this.name, required this.initialAge});

//   final String name;
//   final int initialAge;

//   Stream<String> get age async* {
//     var i = initialAge;
//     while (i < 85) {
//       await Future.delayed(Duration(seconds: 1), () {
//         i++;
//       });
//       yield i.toString();
//     }
//   }
// }

// void main() {
//   runApp(
//     ChangeNotifierProvider<InternetModel>(
//       create: (_) => InternetModel(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Future Provider"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Consumer<InternetModel>(
//             builder: (context, age, child) {
//               return Column(
//                 children: <Widget>[
//                   Text("Watch Yohan Age..."),
//                   Text("name: Yohan"),
//                   Text(age.connectivityStatus.toString()),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
