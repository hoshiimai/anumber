import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';

  int initX = -1;
  int initY = -1;

class InitProcess {
  
  static Future<void> getdata(StateSetter setState) async {
    await Future.delayed(Duration(milliseconds: 500));
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        await Future.delayed(Duration(milliseconds: 10));
        if (Infomation.animation[i][j] == 1) {
          setState(() {
            initX = j;
            initY = i;
            Infomation.animation[i][j] = 2;
          });
        } else if (Infomation.animation[i][j] == -1) {
          setState(() {
            initX = j;
            initY = i;
            Infomation.animation[i][j] = 2;
            Infomation.specifiedX = Infomation.selectedX;
            Infomation.specifiedY = Infomation.selectedY;
          });
        } else {
          setState(() {
            initX = j;
            initY = i;
          });
        }

        if (Infomation.init[i][j] != 0) {
          await Future.delayed(Duration(milliseconds: 10));
          setState(() {
            Infomation.zero[i][j] = Infomation.init[i][j];
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

      Infomation.historyList.add(List.from(
        Infomation.zero.map((row) => List<int>.from(row))
      ));
      Infomation.tmp_historyList.add(List.from(
        Infomation.tmp.map((row) => List<int>.from(row))
      ));
      Infomation.selected_historyList.add([Infomation.selectedX, Infomation.selectedY]);
      // Infomation.animation = Infomation.const_zero;
    });
  }
}
