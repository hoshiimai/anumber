/*
****************************************
機能：anumberを解く時のメインページ
IN：問題、解答、ヒント
OUT：ゲーム画面
----------------------------------------
履歴：
****************************************
*/
import 'dart:async';

import 'package:anumber/components/answer/grid_illust.dart';
import 'package:anumber/components/button/confirmButton.dart';
import 'package:anumber/components/board/grid_candidate.dart';
import 'package:anumber/components/stopwatch/stop_watch.dart';
import 'package:anumber/home.dart';
import 'package:anumber/question.dart';
import 'package:flutter/material.dart';
import 'package:anumber/components/board/grid.dart';
import 'package:anumber/components/button/numbers.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../makeQuestion.dart';
import '../../sudoku.dart';
import '../board/grid_answer.dart';
import '../database/database_connection.dart';

class AnswerScreen extends StatefulWidget {
  // final String level;

  // const AnswerScreen({Key? key, required this.level}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<AnswerScreen> {
  
  // late String state;
  bool _isTappable = true;
  int selectedX = 5;
  int selectedY = 4;
  int initX = -1;
  int initX1 = -1;
  int initY = -1;
  int initY1 = -1;
  int specifiedX = 5;
  int specifiedY = 4;
  bool cell = false;
  bool _timeRunning = false;
  bool _timer = true;
  final fabKey = GlobalKey();
  final _database = Database();

  List<Map<String, dynamic>> history = [];
  int currentIndex = -1;

  @override
  void initState() {
    super.initState();
    // state = widget.level;
    // print(state);
    start();
  }

  start() async{
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
    addToHistory();
  }

  void addToHistory() {
  currentIndex++;
  if (history.length > currentIndex) {
    history.removeRange(currentIndex, history.length);
  }
  history.add({
    "initY": initY,
    "answer": List<List<int>>.from(Infomation.answer),
    "data": List<List<int>>.from(Infomation.data),
  });
}


  void onBackwardPressed() {
    if (currentIndex > 0) {
      // 履歴の最初まで戻る
      currentIndex--;
      setState(() {
        // historyリストから状態を読み込む
        Infomation.answer = List.from(history[currentIndex][0]);
        Infomation.data = List.from(history[currentIndex][1]);
        initX = history[currentIndex][2];
        initY = history[currentIndex][3];
        initX1 = history[currentIndex][4];
        initY1 = history[currentIndex][5];
      });
    }
  }

  
  void onForwardPressed() {
    if (currentIndex < history.length - 1) {
      // 履歴の最後まで進む
      currentIndex++;
      setState(() {
        // historyリストから状態を読み込む
        Infomation.answer = List.from(history[currentIndex][0]);
        Infomation.data = List.from(history[currentIndex][1]);
        initX = history[currentIndex][2];
        initY = history[currentIndex][3];
        initX1 = history[currentIndex][4];
        initY1 = history[currentIndex][5];
      });
    }
}



  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return AbsorbPointer(
      absorbing: !_isTappable,
      // onWillPop: () => Future.value(false),
      child: Stack(
        // alignment: Alignment.center,
        children: <Widget>[
          Scaffold(
            backgroundColor: Color.fromARGB(255, 247, 246, 246),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 247, 246, 246),
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black,),
                onPressed: () async {
                  _database.insertDB(DateFormat.ms().format(Stopwatch.time), Infomation.init, Infomation.zero, Infomation.tmp);
                  setState(() {
                    Infomation.animation = List<List<int>>.from(Infomation.const_animation.map((e) => List<int>.from(e)));;
                  });
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
              title: Text(
                'A Number',
                style: TextStyle(
                  color: Colors.blue[900],
                ),
              ),
              elevation: 1,
            ),
            body: Center(
              child: Column(
                // 盤面、アイコン、数字ボタンを縦方向に並べ、スペースを均等に配置
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //余白
                  SizedBox(
                    height: (screenSize.width) / 10,
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: (screenSize.width) / 25),
                        child: Text(
                          // state == 1 ? '初級' :
                          // state == 2 ? '中級' :
                          // state == 3 ? '上級' :
                          '初級',
                          style: TextStyle(
                            fontSize: (screenSize.width) / 25,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: (screenSize.width) / 1.5,
                      ),
                    
                      InkWell(
                        // padding: EdgeInsets.only(left: (screenSize.width) / 1.8),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: _timeRunning ?  Icon(Icons.pause_circle_outline,) : Icon(Icons.play_arrow),
                        onTap: () {
                          setState(() {
                              _timeRunning = !_timeRunning;
                              _timer = !_timer;
                          });
                        },
                      ),
                      
                      SizedBox(
                        width: (screenSize.width) / 60,
                      ),

                      //ストップウォッチ
                      Stopwatch(
                          isRunning: _timeRunning,
                      ),
                    ],
                  ),

                  //余白
                  SizedBox(
                    height: (screenSize.width) / 50,
                  ),

                  // 問題の盤面の上に候補の盤面を重ねて表示
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // 問題の盤面
                    AnswerGrid(
                      init: Infomation.init,
                      data: Infomation.data,
                      anim: Infomation.answer,
                      selectedX: selectedX,
                      selectedY: selectedY,
                      specifiedX: specifiedX,
                      specifiedY: specifiedY,
                      isAnswerRow: initX,
                      isAnswerColumn: initY,
                      initX: initX1,
                      initY: initY1,
                      animCell: cell,
                      timer: _timer,
                      onTap: (int x, int y) {
                        setState(() {
                          selectedX = x;
                          selectedY = y;
                        });
                      },
                    ),
                      // ),

                    //   // 候補の盤面
                    // CandidateGrid(
                    //   candidate: Infomation.tmp,
                    // ),
                    ],
                  ),

                  // 余白
                  SizedBox(
                    height: (screenSize.width) / 15,
                  ),

                  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => onBackwardPressed(),
                            child: const Icon(Icons.undo, size: 30.0),
                          ),
                          GestureDetector(
                            onTap: () => onForwardPressed(),
                            child: const Icon(Icons.redo, size: 30.0),
                          ),
                        ],
                      ),
                  // 余白
                  
                  SizedBox(
                    height: (screenSize.width) / 10,
                  ),

                  // 数字ボタン
                  Numbers(
                    isPress: false,
                    onTap: (int number) {
            
                    },
                  ),

                  // 余白
                  SizedBox(
                    height: (screenSize.width) / 15,
                  ),

                  //決定、解答ボタン
                  ConfirmButton(answer: Infomation.zero[Infomation.selectedY][Infomation.selectedX]),

                  const SizedBox(
                    height: 50.0, //バナー広告のサイズ 320×50 なので
                    width: double.infinity,
                    // child: AdWidget(ad: myBanner),
                  ),
                ],
              ),
            ),
          ),
           _timer ? Container() : Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
