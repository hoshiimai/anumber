import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';


class Answer {
  static Future<void> makeAnswerList(StateSetter setState) async {

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

          () { // 189アニメーション
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
            Infomation.borderListY.add(Infomation.lineList.indexOf(6));
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
            Infomation.borderListY = [-100];
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      } else if(Infomation.id == 3) {// 中級3
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
            Infomation.answer[Infomation.lineList.indexOf(0)][Infomation.columnList.indexOf(0)] = 999;
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
            Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(8)] = 999;
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
    } else if(Infomation.level == "上級") {
      if(Infomation.id == 1){ // 上級1
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(20) + my(8)]
                          [Infomation.candidateColumnList.indexOf(19) + mx(8)] = Infomation.numMap[8-1];
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(10) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(21) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(20) + my(8)]
                          [Infomation.candidateColumnList.indexOf(19) + mx(8)] = Infomation.numMap[8-1];

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(10) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(21) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 999;
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(20) + my(8)]
                          [Infomation.candidateColumnList.indexOf(19) + mx(8)] = 0;            
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = 0;                                 

            Infomation.data[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = Infomation.numMap[4-1];
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = 999;
            addAnswerList();
          },

          () {
            Infomation.initX = Infomation.columnList.indexOf(6);
            Infomation.initY = Infomation.lineList.indexOf(6);

            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = Infomation.numMap[4-1];
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = 999;                           

            Infomation.data[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = 0;            
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(10) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(4)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(21) + mx(4)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 0;


            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(10) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(21) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(19) + my(4)]
                          [Infomation.candidateColumnList.indexOf(18) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(12) + mx(4)] = 999;

            Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(7)] = Infomation.numMap[4-1];
            Infomation.data[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = Infomation.numMap[4-1];
            Infomation.data[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(4)] = Infomation.numMap[4-1];
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(7)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(4)] = 999;
            addAnswerList();
          },

          () {
            Infomation.initX = -1;
            Infomation.initY = -1;
            addAnswerList();
          },

          () {
            Infomation.borderListX.add(Infomation.columnList.indexOf(3) - (Infomation.columnList.indexOf(3) % 3));
            Infomation.borderListY.add(Infomation.lineList.indexOf(3) - Infomation.lineList.indexOf(3) % 3);
            addAnswerList();
          },

          () {
            Infomation.initX = Infomation.columnList.indexOf(4);
            Infomation.initY = Infomation.lineList.indexOf(5);
            addAnswerList();
          },

          () {
            Infomation.data[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = Infomation.kotae;
            Infomation.answer[Infomation.lineList.indexOf(6)][Infomation.columnList.indexOf(6)] = 999;

            Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(7)] = 0;
            Infomation.data[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(4)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(7)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(7)][Infomation.columnList.indexOf(4)] = 0;

            Infomation.borderListX = [-100];
            Infomation.borderListY = [-100];
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
            Infomation.borderListX = [-100];
            Infomation.borderListY = [-100];
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      } else if(Infomation.id == 2){ // 上級2
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(15) + my(3)]
                          [Infomation.candidateColumnList.indexOf(17) + mx(3)] = Infomation.numMap[3-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(7)] = Infomation.numMap[7-1];
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(9) + my(3)]
                          [Infomation.candidateColumnList.indexOf(17) + mx(3)] = Infomation.numMap[3-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(11) + my(7)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(7)] = Infomation.numMap[7-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(9) + my(3)]
                          [Infomation.candidateColumnList.indexOf(20) + mx(3)] = Infomation.numMap[3-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(10) + my(5)]
                          [Infomation.candidateColumnList.indexOf(19) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(5)]
                          [Infomation.candidateColumnList.indexOf(25) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                          [Infomation.candidateColumnList.indexOf(24) + mx(7)] = Infomation.numMap[7-1];
            addAnswerList();
          },

          () {
            Infomation.borderListX.add(Infomation.columnList.indexOf(6));
            Infomation.borderListY.add(Infomation.lineList.indexOf(3));
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(9) + my(3)]
                          [Infomation.candidateColumnList.indexOf(20) + mx(3)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(10) + my(5)]
                          [Infomation.candidateColumnList.indexOf(19) + mx(5)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(15) + my(3)]
                          [Infomation.candidateColumnList.indexOf(17) + mx(3)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(5)]
                          [Infomation.candidateColumnList.indexOf(25) + mx(5)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                          [Infomation.candidateColumnList.indexOf(24) + mx(7)] = 0;               

            Infomation.data[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)] = Infomation.numMap[5-1];
            Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(5)] = Infomation.numMap[3-1];
            Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(8)] = Infomation.numMap[7-1];
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(5)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(8)] = 999;

            addAnswerList();
          },

          () {
            Infomation.data[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(5)] = Infomation.numMap[7-1];
            Infomation.data[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)] = Infomation.numMap[3-1];
            Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(8)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(5)] = 999;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(8)] = 0;


            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(9) + my(3)]
                          [Infomation.candidateColumnList.indexOf(17) + mx(3)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(11) + my(7)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(5)]
                          [Infomation.candidateColumnList.indexOf(25) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                          [Infomation.candidateColumnList.indexOf(24) + mx(7)] = Infomation.numMap[7-1];                          
            addAnswerList();
          },

          () {
            Infomation.data[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(5)] = 0;
            Infomation.data[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)] = 0;
            Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(5)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(5)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(3)][Infomation.columnList.indexOf(6)] = 0;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(5)] = 0;

            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(15) + my(3)]
                          [Infomation.candidateColumnList.indexOf(17) + mx(3)] = Infomation.numMap[3-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(7)] = Infomation.numMap[7-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(9) + my(3)]
                          [Infomation.candidateColumnList.indexOf(17) + mx(3)] = Infomation.numMap[3-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(11) + my(7)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(7)] = Infomation.numMap[7-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(9) + my(3)]
                          [Infomation.candidateColumnList.indexOf(20) + mx(3)] = Infomation.numMap[3-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(10) + my(5)]
                          [Infomation.candidateColumnList.indexOf(19) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(5)]
                          [Infomation.candidateColumnList.indexOf(25) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                          [Infomation.candidateColumnList.indexOf(24) + mx(7)] = Infomation.numMap[7-1];

            Infomation.borderListX = [-100];
            Infomation.borderListY = [-100];
            addAnswerList();
          },

          () { // 点滅アニメーション
            addAnswerList();
          },

          () {
            Infomation.data[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(5)] = Infomation.kotae;
            Infomation.answer[Infomation.lineList.indexOf(5)][Infomation.columnList.indexOf(5)] = 999;

            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(15) + my(3)]
                          [Infomation.candidateColumnList.indexOf(17) + mx(3)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(9) + my(3)]
                          [Infomation.candidateColumnList.indexOf(17) + mx(3)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(11) + my(7)]
                          [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(9) + my(3)]
                          [Infomation.candidateColumnList.indexOf(20) + mx(3)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(10) + my(5)]
                          [Infomation.candidateColumnList.indexOf(19) + mx(5)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(5)]
                          [Infomation.candidateColumnList.indexOf(25) + mx(5)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                          [Infomation.candidateColumnList.indexOf(24) + mx(7)] = 0;

            addAnswerList();
          },

          () {
            Infomation.init = Infomation.dataList.first;
            Infomation.data = Infomation.dataList.first;
            Infomation.answer = Infomation.answerList.first;
            Infomation.answerCandidate = Infomation.candidateList.first;
            Infomation.animation_candidate = Infomation.animationCandidateList.first;
            Infomation.borderListX = [-100];
            Infomation.borderListY = [-100];
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      } else if(Infomation.id == 3){ // 上級3
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(4) + mx(2)] = Infomation.numMap[2-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(8) + my(8)]
                          [Infomation.candidateColumnList.indexOf(4) + mx(8)] = Infomation.numMap[8-1];
            addAnswerList();
          },

          () {
            Infomation.borderListX.add(Infomation.columnList.indexOf(0));
            Infomation.borderListX.add(Infomation.columnList.indexOf(5));

            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = Infomation.numMap[2-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = Infomation.numMap[2-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = Infomation.numMap[2-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = Infomation.numMap[2-1];

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = 999;
            addAnswerList();
          },

          () {
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = 555;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = 555;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = 555;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = 555;

            Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = 1; // 始点
            Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = 11; // 終点

            Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = 2; // 始点
            Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = 22; // 終点
            addAnswerList();
          },

          () { // 点滅アニメーション
            addAnswerList();
          },

          () {
            Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(1)] = Infomation.kotae;
            Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(1)] = 999;

            Infomation.paintCandidate1 = List.generate(27, (_) => List.filled(27, 0));
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(8) + my(8)]
                          [Infomation.candidateColumnList.indexOf(4) + mx(8)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = 0;
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = 0;  

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(1) + mx(2)] = 0;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(16) + mx(2)] = 0;

            Infomation.borderListX = [-100];
            Infomation.borderListY = [-100];
            addAnswerList();
          },

          () {
            Infomation.init = Infomation.dataList.first;
            Infomation.data = Infomation.dataList.first;
            Infomation.answer = Infomation.answerList.first;
            Infomation.answerCandidate = Infomation.candidateList.first;
            Infomation.animation_candidate = Infomation.animationCandidateList.first;
            Infomation.paintCandidate1 = Infomation.paintList.first[0];
            Infomation.borderListX = [-100];
            Infomation.borderListY = [-100];
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      } else if(Infomation.id == 4){ // 上級4
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(12) + my(3)]
                          [Infomation.candidateColumnList.indexOf(11) + mx(3)] = Infomation.numMap[3-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = Infomation.numMap[4-1];
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(4)]
                          [Infomation.candidateColumnList.indexOf(0) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(0) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(6) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(6) + mx(4)] = Infomation.numMap[4-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = Infomation.numMap[4-1];

            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(4)]
                          [Infomation.candidateColumnList.indexOf(0) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(0) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(6) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(6) + mx(4)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 999;
            addAnswerList();
          },

          () {
            Infomation.borderListY.addAll([
              Infomation.lineList.indexOf(2),
              Infomation.lineList.indexOf(5),
              Infomation.lineList.indexOf(7),
            ]);
            addAnswerList();
          },

          () {
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 444;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(4)]
                          [Infomation.candidateColumnList.indexOf(0) + mx(4)] = 555;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 555;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(0) + mx(4)] = 555;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(6) + mx(4)] = 555;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(6) + mx(4)] = 555;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 555;

            Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(7) + my(4)]//横線
                          [Infomation.candidateColumnList.indexOf(0) + mx(4)] = 1; // 始点
            Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(7) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 11; // 終点               

            Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(7) + my(4)]//縦線
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 4; // 始点
            Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 44; // 終点

            Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(22) + my(4)]//横線
                          [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 2; // 始点
            Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(6) + mx(4)] = 22; // 終点

            Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(22) + my(4)]
                          [Infomation.candidateColumnList.indexOf(6) + mx(4)] = 5; // 終点
            Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(16) + my(4)]//縦線
                          [Infomation.candidateColumnList.indexOf(6) + mx(4)] = 55; // 始点

            Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(16) + my(4)]//横線
                          [Infomation.candidateColumnList.indexOf(6) + mx(4)] = 3; // 始点
            Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(16) + my(4)]
                          [Infomation.candidateColumnList.indexOf(0) + mx(4)] = 33; // 終点

            Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(16) + my(4)]//縦線
                          [Infomation.candidateColumnList.indexOf(0) + mx(4)] = 6; // 始点
            Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(7) + my(4)]//縦線
                          [Infomation.candidateColumnList.indexOf(0) + mx(4)] = 66; // 終点


            addAnswerList();
          },

          () { // 点滅アニメーション
            addAnswerList();
          },

          () {
            Infomation.paintCandidate1 = List.generate(27, (_) => List.filled(27, 0));
            Infomation.paintCandidate2 = List.generate(27, (_) => List.filled(27, 0));
            Infomation.answerCandidate = List.generate(27, (_) => List.filled(27, 0));
            Infomation.animation_candidate = List.generate(27, (_) => List.filled(27, 0));

            Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = Infomation.kotae;
            Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = 999;

            Infomation.borderListX = [-100];
            Infomation.borderListY = [-100];
            addAnswerList();
          },

          () {
            Infomation.init = Infomation.dataList.first;
            Infomation.data = Infomation.dataList.first;
            Infomation.answer = Infomation.answerList.first;
            Infomation.answerCandidate = Infomation.candidateList.first;
            Infomation.animation_candidate = Infomation.animationCandidateList.first;
            Infomation.paintCandidate1 = Infomation.paintList.first[0];
            Infomation.paintCandidate2 = Infomation.paintList.first[0];
            Infomation.borderListX = [-100];
            Infomation.borderListY = [-100];
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      } else if(Infomation.id == 5){ // 上級5
        List<Function> steps = [
          () {
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(10) + mx(2)] = Infomation.numMap[2-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                          [Infomation.candidateColumnList.indexOf(10) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                          [Infomation.candidateColumnList.indexOf(11) + mx(6)] = Infomation.numMap[6-1];
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                          [Infomation.candidateColumnList.indexOf(10) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                          [Infomation.candidateColumnList.indexOf(11) + mx(6)] = Infomation.numMap[6-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                          [Infomation.candidateColumnList.indexOf(13) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                          [Infomation.candidateColumnList.indexOf(14) + mx(6)] = Infomation.numMap[6-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                          [Infomation.candidateColumnList.indexOf(13) + mx(5)] = Infomation.numMap[5-1];
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                          [Infomation.candidateColumnList.indexOf(14) + mx(6)] = Infomation.numMap[6-1];
            addAnswerList();
          },


          () {
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                          [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                          [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                          [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                          [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 999;       
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                          [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                          [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                          [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 999;
            Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                          [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 999;
            addAnswerList();
          },

          () {
            Infomation.answerCandidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                          [Infomation.candidateColumnList.indexOf(10) + mx(2)] = 0;            
            addAnswerList();
          },

          () { // アニメーション
            addAnswerList();
          },

          () {
            Infomation.init = Infomation.dataList.first;
            Infomation.data = Infomation.dataList.first;
            Infomation.answer = Infomation.answerList.first;
            Infomation.answerCandidate = Infomation.candidateList.first;
            Infomation.animation_candidate = Infomation.animationCandidateList.first;
            Infomation.paintCandidate1 = Infomation.paintList.first[0];
            Infomation.paintCandidate2 = Infomation.paintList.first[0];
          }
        ];
        for (var step in steps) {
          setState(() {
            step();
          });
        }
      }
    }
  }



//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
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
    ]);

    Infomation.borderXYList.add([
      List<int>.from(Infomation.borderListX),
      List<int>.from(Infomation.borderListY)
    ]);

    Infomation.paintList.add([
      List.from(Infomation.paintCandidate1.map((row) => List<int>.from(row))),
      List.from(Infomation.paintCandidate2.map((row) => List<int>.from(row))),
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

  static Future<void> flashingNum(StateSetter setState) async {
    if(Infomation.level == "上級"){
      if(Infomation.id == 2){// 上級2
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                      [Infomation.candidateColumnList.indexOf(15) + mx(7)] = Infomation.numMap[7-1];
        await Future.delayed(const Duration(milliseconds: 300));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                        [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 444; 
        });    
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                        [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 999;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                        [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 444; 
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                        [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 999;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                        [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 444; 
        });    
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                        [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 0; 
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(17) + my(7)]
                        [Infomation.candidateColumnList.indexOf(15) + mx(7)] = 0; 
        });
      } else if(Infomation.id == 3) {// 上級3
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                      [Infomation.candidateColumnList.indexOf(4) + mx(2)] = Infomation.numMap[2-1];
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                      [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 999;
        await Future.delayed(const Duration(milliseconds: 300));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                        [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 444; 
        });    
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                        [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 999;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                        [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 444; 
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                        [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 999;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                        [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 444; 
        });    
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                        [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 0; 
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(6) + my(2)]
                        [Infomation.candidateColumnList.indexOf(4) + mx(2)] = 0; 
        });        
      } else if(Infomation.id == 4) {// 上級4
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                      [Infomation.candidateColumnList.indexOf(9) + mx(4)] = Infomation.numMap[4-1];
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                      [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 999;
        await Future.delayed(const Duration(milliseconds: 300));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                        [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 444; 
        });    
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                        [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 999;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                        [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 444; 
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                        [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 999;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                        [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 444; 
        });    
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                        [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 0; 
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(4)]
                        [Infomation.candidateColumnList.indexOf(9) + mx(4)] = 0; 
        });        
      } else if(Infomation.id == 5) {//上級5
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                      [Infomation.candidateColumnList.indexOf(10) + mx(5)] = Infomation.numMap[5-1];
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                      [Infomation.candidateColumnList.indexOf(11) + mx(6)] = Infomation.numMap[6-1];
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                      [Infomation.candidateColumnList.indexOf(13) + mx(5)] = Infomation.numMap[5-1];
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                      [Infomation.candidateColumnList.indexOf(14) + mx(6)] = Infomation.numMap[6-1];
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                      [Infomation.candidateColumnList.indexOf(10) + mx(5)] = Infomation.numMap[5-1];
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                      [Infomation.candidateColumnList.indexOf(11) + mx(6)] = Infomation.numMap[6-1];
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                      [Infomation.candidateColumnList.indexOf(13) + mx(5)] = Infomation.numMap[5-1];
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                      [Infomation.candidateColumnList.indexOf(14) + mx(6)] = Infomation.numMap[6-1];

        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                      [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 999;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                      [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 999;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                      [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 999;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                      [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 999;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                      [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 999;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                      [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 999;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                      [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 999;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                      [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 999;


        await Future.delayed(const Duration(milliseconds: 300));
        setState((){
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = 999;
          Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = Infomation.numMap[5-1];
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                      [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                      [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                      [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                      [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = 999;
          Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = Infomation.numMap[6-1];
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(4)] = 999;
          Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(4)] = Infomation.numMap[5-1];
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(4)] = 999;
          Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(4)] = Infomation.numMap[6-1];
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = 0;
          Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = 0;
          Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(4)] = 0;
          Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(4)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(4)] = 0;
          Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(4)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = Infomation.numMap[5-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = Infomation.numMap[6-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = Infomation.numMap[5-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = Infomation.numMap[6-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = Infomation.numMap[5-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = Infomation.numMap[6-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = Infomation.numMap[5-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = Infomation.numMap[6-1];

          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 999;
        });


        await Future.delayed(const Duration(milliseconds: 700));
        setState((){
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = 999;
          Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = Infomation.numMap[6-1];
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                      [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
        Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                      [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                      [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
        Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                      [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = 999;
          Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = Infomation.numMap[5-1];
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(4)] = 999;
          Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(4)] = Infomation.numMap[6-1];
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(4)] = 999;
          Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(4)] = Infomation.numMap[5-1];
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = 0;
          Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = 0;
          Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(3)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(4)] = 0;
          Infomation.data[Infomation.lineList.indexOf(2)][Infomation.columnList.indexOf(4)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(4)] = 0;
          Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(4)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = Infomation.numMap[5-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = Infomation.numMap[6-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = Infomation.numMap[5-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = Infomation.numMap[6-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = Infomation.numMap[5-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = Infomation.numMap[6-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = Infomation.numMap[5-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = Infomation.numMap[6-1];
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(2)] = Infomation.numMap[2-1];
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 444;
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 999;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 999;
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 444;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 444;
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;

          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
                        [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
                        [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(2)] = 999;
        });

        await Future.delayed(const Duration(milliseconds: 500));
        setState((){
          Infomation.answerCandidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(2)] = 0;
          Infomation.animation_candidate[Infomation.candidateLineList.indexOf(12) + my(2)]
                        [Infomation.candidateColumnList.indexOf(10) + mx(2)] = 0;
          Infomation.answer[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = 999;
          Infomation.data[Infomation.lineList.indexOf(4)][Infomation.columnList.indexOf(3)] = Infomation.numMap[2-1];                 
        });





        // await Future.delayed(const Duration(milliseconds: 500));
        // setState((){
        //   Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(13) + my(5)]//縦線
        //                 [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 4; // 始点
        //   Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(7) + my(5)]
        //                 [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 44; // 終点
        // });


        // setState((){
        //   Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(5)]
        //                 [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 555;
        // });

        // await Future.delayed(const Duration(milliseconds: 500));
        // setState((){
        //   Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(7) + my(5)]//横線
        //                 [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 1; // 始点
        //   Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(7) + my(6)]
        //                 [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 11; // 終点
        // });

        // await Future.delayed(const Duration(milliseconds: 500));
        // setState((){
        //   Infomation.animation_candidate[Infomation.candidateLineList.indexOf(7) + my(6)]
        //                 [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 555;
        // });

        // await Future.delayed(const Duration(milliseconds: 500));
        // setState((){
        //   Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(7) + my(6)]//縦線
        //                 [Infomation.candidateColumnList.indexOf(14) + mx(6)] = 4; // 始点
        //   Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(13) + my(5)]
        //                 [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 44; // 終点
        // });

        // await Future.delayed(const Duration(milliseconds: 500));
        // setState((){
        //   Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(5)]
        //                 [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 555;
        // });

        // await Future.delayed(const Duration(milliseconds: 500));
        // setState((){
        //   Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(13) + my(5)]//横線
        //                 [Infomation.candidateColumnList.indexOf(13) + mx(5)] = 2; // 始点
        //   Infomation.paintCandidate1[Infomation.candidateLineList.indexOf(13) + my(6)]
        //                 [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 22; // 終点
        // });

        // await Future.delayed(const Duration(milliseconds: 500));
        // setState((){
        //   Infomation.animation_candidate[Infomation.candidateLineList.indexOf(13) + my(6)]
        //                 [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 555;
        // });

        // await Future.delayed(const Duration(milliseconds: 500));
        // setState((){
        //   Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(13) + my(6)]//縦線
        //                 [Infomation.candidateColumnList.indexOf(11) + mx(6)] = 5; // 始点
        //   Infomation.paintCandidate2[Infomation.candidateLineList.indexOf(7) + my(5)]
        //                 [Infomation.candidateColumnList.indexOf(10) + mx(5)] = 55; // 終点
        // });

      }
    }

  }

  // x軸に移動する座標を返す　引数：セルに入力する数字
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



