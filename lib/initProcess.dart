import 'package:anumber/question.dart';
import 'package:flutter/material.dart';

  // bool _isTappable = false;
  int selectedX = -1;
  int selectedY = -1;
  int initX = -1;
  int initY = -1;
  int specifiedX = -1;
  int specifiedY = -1;
  // bool cell = false;
  // bool _timeRunning = false;
  // bool _timer = true;

class InitProcess {
  
  static Future<void> getdata(StateSetter setState) async {
    await Future.delayed(Duration(milliseconds: 500));
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        await Future.delayed(Duration(milliseconds: 10));
        if (Data.animation[i][j] == 1) {
          setState(() {
            initX = j;
            initY = i;
            Data.animation[i][j] = 2;
          });
        } else if (Data.animation[i][j] == -1) {
          setState(() {
            initX = j;
            initY = i;
            Data.animation[i][j] = 2;
            specifiedX = 5;
            specifiedY = 4;
          });
        } else {
          setState(() {
            initX = j;
            initY = i;
          });
        }

        if (Data.init[i][j] != 0) {
          await Future.delayed(Duration(milliseconds: 10));
          setState(() {
            Data.zero[i][j] = Data.init[i][j];
          });
        }
      }
    }
    await Future.delayed(Duration(milliseconds: 10));
    setState(() {
      initX = -1;
      initY = -1;
    });
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      initX = -1;
      initY = -1;
      selectedX = 5;
      selectedY = 4;
      Data.animation = Data.ans;
    });
  }
}
