/*
****************************************
機能：アプリ起動時の画面
OUT：home.dart
----------------------------------------
履歴：
****************************************
*/

import 'package:anumber/app.dart';
import 'package:anumber/makeQuestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  MakeQuestion().getExcelValue();
  //AdMobの初期化処理
  // WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,//縦固定
  ]);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // debugモードのバナーを非表示にする
    home: MyApp(),
  ));
}



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('A Number'),
//       // ),
//       body: const Home(),
//     );
//   }
// }
