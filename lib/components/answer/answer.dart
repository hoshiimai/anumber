import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';


class Answer {
  
  static Future<void> getAnswer(StateSetter setState, int initX, int initY, int initX1, int initY1) async {
    await Future.delayed(Duration(milliseconds: 700));
    setState(() {
      Infomation.answer[5][6] = 2;
    });
    await Future.delayed(Duration(milliseconds: 400));
    setState(() {
      initX = 5;
    });
    await Future.delayed(Duration(milliseconds: 700));
    setState(() {
      Infomation.answer[5][6] = 0;
      Infomation.answer[0][0] = 2;
    });
    // await Future.delayed(Duration(milliseconds: 400));
    // setState(() {
    //   initY = 0;
    // });
    await Future.delayed(Duration(milliseconds: 700));
    setState(() {
      Infomation.data[3][1] = 9;
    });
    await Future.delayed(Duration(milliseconds: 700));
    setState(() {
      Infomation.data[3][2] = 9;
    });
    await Future.delayed(Duration(milliseconds: 400));
    setState(() {
      initX1 = 3;
    });
    await Future.delayed(Duration(milliseconds: 700));
    setState(() {
      Infomation.answer[7][3] = 2;
    });
    await Future.delayed(Duration(milliseconds: 400));
    setState(() {
      initY1 = 3;
    });
    await Future.delayed(Duration(milliseconds: 700));
    setState(() {
      Infomation.answer[7][3] = 0;
      Infomation.data[1][4] = 9;
    });
    await Future.delayed(Duration(milliseconds: 700));
    setState(() {
      Infomation.data[2][4] = 9;
    });
    await Future.delayed(Duration(milliseconds: 400));
    setState(() {
      initY = 4;
      Infomation.answer[0][0] = 0;
    });
    await Future.delayed(Duration(milliseconds: 700));
    setState(() {
      Infomation.data[4][5] = 9;
      Infomation.answer[4][5] = 2;
    });
  }
}



