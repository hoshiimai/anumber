import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';

// static int initX = -1;
// static int initX1 = -1;
// static int initY = -1;
// static int initY1 = -1;

class Answer {
  static Future<void> makeAnswerList(StateSetter setState) async {
    // if(Infomation.id == 1){ //初級1 --行列ブロック
    //   List<Function> steps = [
    //     () {
    //       addAnswerList();
    //     },

    //     () {
    //       //検証用
    //       // Infomation.answerCandidate[6][0] = 1;
    //       // Infomation.answerCandidate[6][1] = 2;
    //       // Infomation.answerCandidate[6][2] = 3;
    //       // Infomation.answerCandidate[7][1] = 5;
    //       // Infomation.answerCandidate[7][2] = 6;
    //       // Infomation.answerCandidate[8][0] = 7;
    //       // Infomation.answerCandidate[8][1] = 8;
    //       // Infomation.answerCandidate[8][2] = 9;
    //       //


    //       Infomation.answerCandidate[7][0] = 4;
    //       Infomation.answerCandidate[16][0] = 4;
    //       Infomation.answerCandidate[7][9] = 4;
    //       Infomation.answerCandidate[16][6] = 4;
    //       Infomation.answerCandidate[22][6] = 4;
    //       Infomation.answerCandidate[22][9] = 4;

    //       Infomation.answerCandidate[1][0] = 4;
    //       Infomation.answerCandidate[1][6] = 4;
    //       Infomation.answerCandidate[13][9] = 4;
    //       Infomation.answerCandidate[25][9] = 4;
    //       Infomation.answerCandidate[25][21] = 4;

    //       addAnswerList();
    //     },

    //     () {
    //       Infomation.animation_candidate[7][0] = 999;
    //       Infomation.animation_candidate[8][0] = 111;
    //       Infomation.animation_candidate[9][0] = 111;
    //       Infomation.animation_candidate[10][0] = 111;
    //       Infomation.animation_candidate[11][0] = 111;
    //       Infomation.animation_candidate[12][0] = 111;
    //       Infomation.animation_candidate[13][0] = 111;
    //       Infomation.animation_candidate[14][0] = 111;
    //       Infomation.animation_candidate[15][0] = 111;
    //       Infomation.animation_candidate[16][0] = 999;

    //       Infomation.animation_candidate[7][1] = 555;
    //       Infomation.animation_candidate[7][2] = 555;
    //       Infomation.animation_candidate[7][3] = 555;
    //       Infomation.animation_candidate[7][4] = 555;
    //       Infomation.animation_candidate[7][5] = 555;
    //       Infomation.animation_candidate[7][6] = 555;
    //       Infomation.animation_candidate[7][7] = 555;
    //       Infomation.animation_candidate[7][8] = 555;
    //       Infomation.animation_candidate[7][9] = 999;

    //       Infomation.animation_candidate[16][1] = 555;
    //       Infomation.animation_candidate[16][2] = 555;
    //       Infomation.animation_candidate[16][3] = 555;
    //       Infomation.animation_candidate[16][4] = 555;
    //       Infomation.animation_candidate[16][5] = 555;
    //       Infomation.animation_candidate[16][6] = 999;

    //       Infomation.animation_candidate[22][6] = 999;
    //       Infomation.animation_candidate[22][7] = 555;
    //       Infomation.animation_candidate[22][8] = 555;
    //       Infomation.animation_candidate[22][9] = 999;

    //       Infomation.animation_candidate[8][9] = 111;
    //       Infomation.animation_candidate[9][9] = 111;
    //       Infomation.animation_candidate[10][9] = 111;
    //       Infomation.animation_candidate[11][9] = 111;
    //       Infomation.animation_candidate[12][9] = 111;
    //       Infomation.animation_candidate[13][9] = 111;
    //       Infomation.animation_candidate[14][9] = 111;
    //       Infomation.animation_candidate[15][9] = 111;
    //       Infomation.animation_candidate[16][9] = 111;
    //       Infomation.animation_candidate[17][9] = 111;
    //       Infomation.animation_candidate[18][9] = 111;
    //       Infomation.animation_candidate[19][9] = 111;
    //       Infomation.animation_candidate[20][9] = 111;
    //       Infomation.animation_candidate[21][9] = 111;

    //       Infomation.animation_candidate[17][6] = 111;
    //       Infomation.animation_candidate[18][6] = 111;
    //       Infomation.animation_candidate[19][6] = 111;
    //       Infomation.animation_candidate[20][6] = 111;
    //       Infomation.animation_candidate[21][6] = 111;
    //       Infomation.endList.add([21, 25]);


    //       // Infomation.animation_candidate[1][0] = 444;
    //       // Infomation.animation_candidate[1][6] = 444;
    //       Infomation.animation_candidate[13][9] = 444;
    //       // Infomation.animation_candidate[25][9] = 444;
    //       Infomation.animation_candidate[25][21] = 999;
    //       Infomation.animation_candidate[25][9] = 999;
    //       addAnswerList();
    //     },

    //     () {
    //       Infomation.init = Infomation.dataList.first;
    //       Infomation.data = Infomation.dataList.first;
    //       Infomation.answer = Infomation.answerList.first;
    //       Infomation.initX = -1;
    //       Infomation.initY = -1;
    //       Infomation.initX1 = -1;
    //       Infomation.initY1 = -1;
    //     }
    //   ];
    //   for (var step in steps) {
    //     setState(() {
    //       step();
    //     });
    //   }
//-------------------------------------------------------------------------------------------------------------------------------
    if(Infomation.level == "初級") {
      if(Infomation.id == 1){ // 初級1 --行列ブロック
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)] = 999;
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)] = 0;
            Infomation.initY = Infomation.lineList.indexOf(3);
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(3)] = 999;
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(3)] = 0;
            Infomation.initY1 = Infomation.lineList.indexOf(5);
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(1)] = 999;
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(1)] = 0;
            Infomation.initX = Infomation.columnList.indexOf(1);
            addAnswerList();
          },

          () {
            Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(0)] = Infomation.kotae;
            Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(0)] = 999;
            addAnswerList();
          },

          () {
            Infomation.init = Infomation.dataList.first;
            Infomation.data = Infomation.dataList.first;
            Infomation.answer = Infomation.answerList.first;
            Infomation.initX = -1;
            Infomation.initY = -1;
            Infomation.initX1 = -1;
            Infomation.initY1 = -1;
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      } else if(Infomation.id == 2) { // 初級2 --189
        Infomation.sortingList.add(
          Infomation.init[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(2)],
        );
        Infomation.sortingList.add(
          Infomation.init[Infomation.lineList.indexOf(0)][Infomation.columnList.indexOf(6)],
        );
        Infomation.sortingList.add(
          Infomation.init[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(8)],
        );
        Infomation.sortingList.add(
          Infomation.init[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(6)],
        );
        Infomation.sortingList.add(
          Infomation.init[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(0)],
        );
        Infomation.sortingList.add(
          Infomation.init[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(6)],
        );
        Infomation.sortingList.add(
          Infomation.init[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)],
        );
        Infomation.sortingList.add(
          Infomation.init[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(7)],
        );
        Infomation.sortingList.add(
          Infomation.kotae
        );

        List<Function> steps = [
          () {
            addAnswerList();
          },

          () { // 画面に表示する「○/○」の分母を2にするため必要
            addAnswerList();
          },
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
      }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━      
    } else if(Infomation.level == "中級") {
      if(Infomation.id == 1){ // 中級1
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(1)] = 999;
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(9) + my(1)]
                                      [Infomation.candidateColumnList.indexOf(18) + mx(1)] = Infomation.numMap[1-1];    
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(15) + my(1)]
                                      [Infomation.candidateColumnList.indexOf(18) + mx(1)] = Infomation.numMap[1-1];    

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(9) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(18) + mx(1)] = 999;    
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(15) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(18) + mx(1)] = 999;    

            Infomation.initY = Infomation.lineList.indexOf(4);
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(1)] = 0;
            Infomation.initY = -1;
            Infomation.initX = Infomation.columnList.indexOf(6);
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(5)] = 999;
            addAnswerList();
          },

          () {
            Infomation.initY = Infomation.lineList.indexOf(6);
            Infomation.data[Infomation.lineList.indexOf(8)][Infomation.columnList.indexOf(8)] = Infomation.kotae;
            Infomation.answer[Infomation.lineList.indexOf(8)][Infomation.columnList.indexOf(8)] = 999;
            addAnswerList();
          },

          () {
            Infomation.init = Infomation.dataList.first;
            Infomation.data = Infomation.dataList.first;
            Infomation.answer = Infomation.answerList.first;
            Infomation.answerCandidate = Infomation.candidateList.first;
            Infomation.initX = -1;
            Infomation.initY = -1;
            Infomation.initX1 = -1;
            Infomation.initY1 = -1;
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      } else if(Infomation.id == 2) { // 中級2
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(0)][Infomation.columnList.indexOf(0)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(2)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(5)] = 999;
            addAnswerList();
          },

          () {
            Infomation.initY = Infomation.lineList.indexOf(0);
            Infomation.initY1 = Infomation.lineList.indexOf(2);
            Infomation.initY2 = Infomation.lineList.indexOf(3);
            Infomation.initY3 = Infomation.lineList.indexOf(4);
            addAnswerList();
          },

          () {
            Infomation.data[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(7)] = Infomation.kotae;
            Infomation.data[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(8)] = Infomation.kotae;
            Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(7)] = Infomation.kotae;
            Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(8)] = Infomation.kotae;
            Infomation.answer[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(7)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(8)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(7)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(8)] = 999;
            addAnswerList();
          },

          () {            
            Infomation.initY = -1;
            Infomation.initY1 =-1;
            Infomation.initY2 =-1;
            Infomation.initY3 =-1;

            Infomation.initX = Infomation.columnList.indexOf(0);
            Infomation.initX1 = Infomation.columnList.indexOf(2);
            Infomation.initX2 = Infomation.columnList.indexOf(5);
            Infomation.initX3 = Infomation.columnList.indexOf(7);
            Infomation.initX4 = Infomation.columnList.indexOf(8);
            Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = 0;
            addAnswerList();
          },

          () {            
            Infomation.data[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(1)] = Infomation.kotae;
            Infomation.frameBorderX = Infomation.columnList.indexOf(0);
            Infomation.frameBorderY = Infomation.lineList.indexOf(6);
            addAnswerList();
          },

          () {
            Infomation.init = Infomation.dataList.first;
            Infomation.data = Infomation.dataList.first;
            Infomation.answer = Infomation.answerList.first;
            Infomation.answerCandidate = Infomation.candidateList.first;
            Infomation.initX = -1;
            Infomation.initY = -1;
            Infomation.initX1 = -1;
            Infomation.initY1 = -1;
            Infomation.initX = -1;
            Infomation.initX1 = -1;
            Infomation.initX2 = -1;
            Infomation.initX3 = -1;
            Infomation.initX4 = -1;
            Infomation.initY = -1;
            Infomation.initY1 = -1;
            Infomation.initY2 = -1;
            Infomation.initY3 = -1;
            Infomation.initY4 = -1;
            Infomation.frameBorderX = -2;
            Infomation.frameBorderY = -2;
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      } else if(Infomation.id == 3) {
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(5)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(8)] = 999;
            addAnswerList();
          },

          () {
            Infomation.initY = Infomation.lineList.indexOf(6);
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(21) + my(1)]
                                      [Infomation.candidateColumnList.indexOf(6) + mx(1)] = Infomation.numMap[1-1];       
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(22) + my(6)]
                                      [Infomation.candidateColumnList.indexOf(8) + mx(6)] = Infomation.numMap[6-1];     
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(24) + my(1)]
                                      [Infomation.candidateColumnList.indexOf(6) + mx(1)] = Infomation.numMap[1-1];  
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(25) + my(6)]
                                      [Infomation.candidateColumnList.indexOf(8) + mx(6)] = Infomation.numMap[6-1];

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(21) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(6) + mx(1)] = 999;       
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(22) + my(6)]
                                          [Infomation.candidateColumnList.indexOf(8) + mx(6)] = 999;       
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(24) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(6) + mx(1)] = 999;       
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(25) + my(6)]
                                          [Infomation.candidateColumnList.indexOf(8) + mx(6)] = 999;       
            addAnswerList();
          },

          () {
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(21) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(6) + mx(1)] = 0;       
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(22) + my(6)]
                                          [Infomation.candidateColumnList.indexOf(8) + mx(6)] = 0;       
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(24) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(6) + mx(1)] = 0;       
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(25) + my(6)]
                                          [Infomation.candidateColumnList.indexOf(8) + mx(6)] = 0;                  

            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(18) + my(3)]
                                      [Infomation.candidateColumnList.indexOf(2) + mx(3)] = Infomation.numMap[3-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(5)]
                                      [Infomation.candidateColumnList.indexOf(1) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(18) + my(3)]
                                      [Infomation.candidateColumnList.indexOf(8) + mx(3)] = Infomation.numMap[3-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(5)]
                                      [Infomation.candidateColumnList.indexOf(7) + mx(5)] = Infomation.numMap[5-1];

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(18) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(2) + mx(3)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(5)]
                                          [Infomation.candidateColumnList.indexOf(1) + mx(5)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(18) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(8) + mx(3)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(5)]
                                          [Infomation.candidateColumnList.indexOf(7) + mx(5)] = 999;

            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(5)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(8)] = 0;                                          
            Infomation.initY = -1;
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(5)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(8)] = 0;

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(18) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(2) + mx(3)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(5)]
                                          [Infomation.candidateColumnList.indexOf(1) + mx(5)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(18) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(8) + mx(3)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(5)]
                                          [Infomation.candidateColumnList.indexOf(7) + mx(5)] = 0;
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(0)][Infomation.columnList.indexOf(4)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(4)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(4)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(1)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(5)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(8)] = 999;

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(18) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(2) + mx(3)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(5)]
                                          [Infomation.candidateColumnList.indexOf(1) + mx(5)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(18) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(8) + mx(3)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(5)]
                                          [Infomation.candidateColumnList.indexOf(7) + mx(5)] = 999;
            addAnswerList();
          },

          () {
            Infomation.data[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(4)] = Infomation.kotae;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(4)] = 999;
            addAnswerList();
          },

          () {
            Infomation.init = Infomation.dataList.first;
            Infomation.data = Infomation.dataList.first;
            Infomation.answer = Infomation.answerList.first;
            Infomation.answerCandidate = Infomation.candidateList.first;
            Infomation.animation_candidate = Infomation.animationCandidateList.first;
            Infomation.initY = -1;
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      } else if(Infomation.id == 4) { // 中級4
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(0)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(0)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(7)] = 999;
            addAnswerList();
          },

          () {
            Infomation.initY = Infomation.lineList.indexOf(2);
            Infomation.initX = Infomation.columnList.indexOf(0);
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(1) + my(5)]
                                      [Infomation.candidateColumnList.indexOf(7) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(1) + my(6)]
                                      [Infomation.candidateColumnList.indexOf(8) + mx(6)] = Infomation.numMap[6-1];   
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(4) + my(5)]
                                      [Infomation.candidateColumnList.indexOf(4) + mx(5)] = Infomation.numMap[5-1];   
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(4) + my(6)]
                                      [Infomation.candidateColumnList.indexOf(5) + mx(6)] = Infomation.numMap[6-1];

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(1) + my(5)]
                                          [Infomation.candidateColumnList.indexOf(7) + mx(5)] = 999;   
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(1) + my(6)]
                                          [Infomation.candidateColumnList.indexOf(8) + mx(6)] = 999;   
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(4) + my(5)]
                                          [Infomation.candidateColumnList.indexOf(4) + mx(5)] = 999;   
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(4) + my(6)]
                                          [Infomation.candidateColumnList.indexOf(5) + mx(6)] = 999;
            addAnswerList();
          },
          
          () {
            Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(0)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(0)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(7)] = 0;            
            Infomation.initY = -1;
            Infomation.initX = -1;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(1) + my(5)]
                                          [Infomation.candidateColumnList.indexOf(7) + mx(5)] = 0;   
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(1) + my(6)]
                                          [Infomation.candidateColumnList.indexOf(8) + mx(6)] = 0;   
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(4) + my(5)]
                                          [Infomation.candidateColumnList.indexOf(4) + mx(5)] = 0;   
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(4) + my(6)]
                                          [Infomation.candidateColumnList.indexOf(5) + mx(6)] = 0;
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(5)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(6)] = 999;
            addAnswerList();
          },

          () {
            Infomation.initY = Infomation.lineList.indexOf(1);
            Infomation.initY1 = Infomation.lineList.indexOf(2);
            Infomation.data[Infomation.lineList.indexOf(0)][Infomation.columnList.indexOf(0)] = Infomation.kotae;
            addAnswerList();
          },

          () {
            Infomation.init = Infomation.dataList.first;
            Infomation.data = Infomation.dataList.first;
            Infomation.answer = Infomation.answerList.first;
            Infomation.answerCandidate = Infomation.candidateList.first;
            Infomation.animation_candidate = Infomation.animationCandidateList.first;
            Infomation.initX = -1;
            Infomation.initY = -1;
            Infomation.initY1 = -1;
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      } else if(Infomation.id == 5) { // 中級5
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(8)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(8)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(8)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(8)][Infomation.columnList.indexOf(6)] = 999;
            addAnswerList();
          },

          () {
            Infomation.initX = Infomation.columnList.indexOf(6);
            Infomation.initX1 = Infomation.columnList.indexOf(8);

            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(0) + my(1)]
                                      [Infomation.candidateColumnList.indexOf(21) + mx(1)] = Infomation.numMap[1-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(0) + my(2)]
                                      [Infomation.candidateColumnList.indexOf(22) + mx(2)] = Infomation.numMap[2-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(0) + my(3)]
                                      [Infomation.candidateColumnList.indexOf(23) + mx(3)] = Infomation.numMap[3-1];

            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(3) + my(1)]
                                      [Infomation.candidateColumnList.indexOf(21) + mx(1)] = Infomation.numMap[1-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(3) + my(2)]
                                      [Infomation.candidateColumnList.indexOf(22) + mx(2)] = Infomation.numMap[2-1]; 
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(3) + my(3)]
                                      [Infomation.candidateColumnList.indexOf(23) + mx(3)] = Infomation.numMap[3-1];

            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(1)]
                                      [Infomation.candidateColumnList.indexOf(21) + mx(1)] = Infomation.numMap[1-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                                      [Infomation.candidateColumnList.indexOf(22) + mx(2)] = Infomation.numMap[2-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(3)]
                                      [Infomation.candidateColumnList.indexOf(23) + mx(3)] = Infomation.numMap[3-1];



            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(0) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(21) + mx(1)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(0) + my(2)]
                                          [Infomation.candidateColumnList.indexOf(22) + mx(2)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(0) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(23) + mx(3)] = 999;

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(3) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(21) + mx(1)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(3) + my(2)]
                                          [Infomation.candidateColumnList.indexOf(22) + mx(2)] = 999; 
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(3) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(23) + mx(3)] = 999;

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(21) + mx(1)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                                          [Infomation.candidateColumnList.indexOf(22) + mx(2)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(23) + mx(3)] = 999;

            addAnswerList();
          },

          () {
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(8)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(8)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(8)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(8)][Infomation.columnList.indexOf(6)] = 0;

            Infomation.initX = -1;
            Infomation.initX1 = -1;

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(0) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(21) + mx(1)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(0) + my(2)]
                                          [Infomation.candidateColumnList.indexOf(22) + mx(2)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(0) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(23) + mx(3)] = 0;

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(3) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(21) + mx(1)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(3) + my(2)]
                                          [Infomation.candidateColumnList.indexOf(22) + mx(2)] = 0; 
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(3) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(23) + mx(3)] = 0;

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(1)]
                                          [Infomation.candidateColumnList.indexOf(21) + mx(1)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                                          [Infomation.candidateColumnList.indexOf(22) + mx(2)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(3)]
                                          [Infomation.candidateColumnList.indexOf(23) + mx(3)] = 0;

            Infomation.answer[Infomation.lineList.indexOf(0)][Infomation.columnList.indexOf(3)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(6)] = 999;
            addAnswerList();
          },

          () {
            Infomation.initX = Infomation.columnList.indexOf(6);
            Infomation.initY = Infomation.lineList.indexOf(0);
            Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(8)] = Infomation.kotae;
            addAnswerList();
          },

          () {
            Infomation.init = Infomation.dataList.first;
            Infomation.data = Infomation.dataList.first;
            Infomation.answer = Infomation.answerList.first;
            Infomation.answerCandidate = Infomation.candidateList.first;
            Infomation.animation_candidate = Infomation.animationCandidateList.first;
            Infomation.initX = -1;
            Infomation.initX1 = -1;
            Infomation.initY = -1;
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
      }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    }
  }
//-------------------------------------------------------------------------------------------------------------------------------
  static void addAnswerList() {
    Infomation.dataList.add(List.from(
      Infomation.data.map((row) => List<int>.from(row))
    ));

    Infomation.answerList.add(List.from(
      Infomation.answer.map((row) => List<int>.from(row))
    ));

    Infomation.candidateList.add(List.from(
      Infomation.answerCandidate.map((row) => List<int>.from(row))
    ));

    Infomation.animationCandidateList.add(List.from(
      Infomation.animation_candidate.map((row) => List<int>.from(row))
    ));

    Infomation.xyList.add([
      Infomation.initX, Infomation.initY, 
      Infomation.initX1, Infomation.initY1,
      Infomation.initX2, Infomation.initY2,
      Infomation.initX3, Infomation.initY3,
      Infomation.initX4, Infomation.initY4,
      Infomation.frameBorderX, Infomation.frameBorderY
    ]);
  }



  static Future<void> auto189(StateSetter setState) async {
    for(var i=1; i<=9; i++) {
      if(Infomation.sortingList.indexOf(i)+1 == 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answer[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(2)] = 999;
        });
      } else if(Infomation.sortingList.indexOf(i)+1 == 2) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answer[Infomation.lineList.indexOf(0)][Infomation.columnList.indexOf(6)] = 999;
        });
      } else if(Infomation.sortingList.indexOf(i)+1 == 3) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(8)] = 999;
        });
      } else if(Infomation.sortingList.indexOf(i)+1 == 4) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answer[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(6)] = 999;
        });
      } else if(Infomation.sortingList.indexOf(i)+1 == 5) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answer[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(0)] = 999;
        });
      } else if(Infomation.sortingList.indexOf(i)+1 == 6) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(6)] = 999;
        });
      } else if(Infomation.sortingList.indexOf(i)+1 == 7) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)] = 999;
        });
      } else if(Infomation.sortingList.indexOf(i)+1 == 8) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answer[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(7)] = 999;
        });
      } else if(Infomation.sortingList.indexOf(i)+1 == 9) {
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      Infomation.answer[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(6)] = 999;
      Infomation.data[Infomation.lineList.indexOf(1)][Infomation.columnList.indexOf(6)] = Infomation.kotae;
    });
  }

  // x軸に移動する座標を返す　引数：セルに入力する数字(オリジナル時点)
  static int mx(int i) {
    final numberMap = {
      1 : 0,
      2 : 1,
      3 : 2,
      4 : 0,
      5 : 1,
      6 : 2,
      7 : 0,
      8 : 1,
      9 : 2,
    };

    return (numberMap[Infomation.numMap[i-1]]! - numberMap[i]!);
  }
  static int my(int i) {
    final numberMap = {
      1 : 0,
      2 : 0,
      3 : 0,
      4 : 1,
      5 : 1,
      6 : 1,
      7 : 2,
      8 : 2,
      9 : 2,
    };
    
    return (numberMap[Infomation.numMap[i-1]]! - numberMap[i]!);
  }
}



