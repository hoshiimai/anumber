import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';

int initX = -1;
int initX1 = -1;
int initY = -1;
int initY1 = -1;

class Answer {
  static void makeAnswerList(StateSetter setState) {
    List<Function> steps = [
      () {
        addAnswerList();
      },

      () {
        // Infomation.answer[6][1] = 999;
        Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(1)] = 999;
        addAnswerList();
      },

      () {
        initX = Infomation.lineList.indexOf(6);
        addAnswerList();
      },

      () {
        // Infomation.answer[6][1] = 0;
        // Infomation.answer[8][6] = 999;
        Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(1)] = 0;
        Infomation.answer[Infomation.lineList.indexOf(8)][Infomation.columnList.indexOf(6)] = 999;
        addAnswerList();
      },

      () {
        initX1 = Infomation.lineList.indexOf(8);
        addAnswerList();
      },

      () {
        // Infomation.data[7][4] = 1;
        // Infomation.data[7][5] = 1;
        Infomation.data[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(4)] = Infomation.kotae;
        Infomation.data[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(5)] = Infomation.kotae;
        addAnswerList();
      },

      () {
        initY = Infomation.columnList.indexOf(6);
        addAnswerList();
      },

      () {
        // Infomation.answer[8][6] = 0;
        // Infomation.answer[2][8] = 999;
        Infomation.answer[Infomation.lineList.indexOf(8)][Infomation.columnList.indexOf(6)] = 0;
        Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(8)] = 999;
        addAnswerList();
      },

      () {
        initY1 = Infomation.columnList.indexOf(8);
        addAnswerList();
      },

      () {
        // Infomation.answer[2][8] = 0;
        // Infomation.data[4][7] = Infomation.kotae;
        // Infomation.data[5][7] = Infomation.kotae;
        Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(8)] = 0;
        Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(8)] = Infomation.kotae;
        Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(8)] = Infomation.kotae;

        addAnswerList();
      },

      () {
        // Infomation.data[4][0] = Infomation.kotae;
        // Infomation.data[5][0] = Infomation.kotae;
        // Infomation.data[5][2] = Infomation.kotae;
        Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(0)] = Infomation.kotae;
        Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(0)] = Infomation.kotae;
        Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(2)] = Infomation.kotae;
        addAnswerList();
      },

      () {
        initX = Infomation.lineList.indexOf(4);
        initX1 = Infomation.lineList.indexOf(5);
        initY = -1;
        initY1 = -1;
        addAnswerList();
      },

      () {
        // Infomation.data[0][4] = 1;
        // Infomation.data[0][5] = 1;
        // Infomation.data[1][4] = 1;
        // Infomation.data[1][5] = 1;
        Infomation.data[Infomation.lineList.indexOf(0)][Infomation.columnList.indexOf(4)] = Infomation.kotae;
        Infomation.data[Infomation.lineList.indexOf(0)][Infomation.columnList.indexOf(5)] = Infomation.kotae;
        Infomation.data[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(4)] = Infomation.kotae;
        Infomation.data[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(5)] = Infomation.kotae;
        addAnswerList();
      },

      () {
        initY = Infomation.columnList.indexOf(4);
        initY1 = Infomation.columnList.indexOf(5);
        addAnswerList();
      },

      () {
        // Infomation.data[3][3] = 1;
        // Infomation.answer[3][3] = 999;
        Infomation.data[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(3)] = Infomation.kotae;
        Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(3)] = 999;
        addAnswerList();
      },

      () {
        Infomation.init = Infomation.dataList.first;
        Infomation.data = Infomation.dataList.first;
        Infomation.answer = Infomation.answerList.first;
        initX = -1;
        initY = -1;
        initX1 = -1;
        initY1 = -1;
      }
    ];

    for (var step in steps) {
      setState(() {
        step();
      });
    }
  }

  static void addAnswerList() {
    Infomation.dataList.add(List.from(
      Infomation.data.map((row) => List<int>.from(row))
    ));
    Infomation.answerList.add(List.from(
      Infomation.answer.map((row) => List<int>.from(row))
    ));
    Infomation.xyList.add([initX, initY, initX1, initY1]);
  }
}



