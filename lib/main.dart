/*
****************************************
機能：アプリ起動時の画面
OUT：home.dart
----------------------------------------
履歴：
****************************************
*/

import 'package:anumber/app.dart';
// import 'package:anumber/makeQuestion.dart';
import 'package:flutter/material.dart';


import 'package:flutter/services.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';


void main() {
  // MakeQuestion().getExcelValue();
  //AdMobの初期化処理
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  // 向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,//縦固定
  ]);
  // ステータスバーを透過
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  // ));
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "Noto Sans JP", // ここを追加
      ),
    debugShowCheckedModeBanner: false, // debugモードのバナーを非表示にする
    home: MyApp(),
  ));
}
