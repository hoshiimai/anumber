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

import '../../initProcess.dart';
import '../../main.dart';
import '../../makeQuestion.dart';
import '../../sudoku.dart';
import '../database/database_connection.dart';

class Sudoku extends StatefulWidget {
  final String level;

  const Sudoku({Key? key, required this.level}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<Sudoku> {
  
  late String state;
  bool _isTappable = false;
  bool cell = false;
  bool _timeRunning = false;
  bool _timer = true;
  final fabKey = GlobalKey();
  final _database = Database();
  // 候補入力判断用フラグ
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    InitProcess.getdata(setState).then((_) {
      _timeRunning = !_timeRunning;
      Future.delayed(Duration.zero, () {
        setState(() {
          _isTappable = true;
        });
      });
    });
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
                  _database.insertDB(DateFormat.ms().format(Stopwatch.time), Data.init, Data.zero, Data.tmp);
                  setState(() {
                    Data.animation = List<List<int>>.from(Data.animation_init.map((e) => List<int>.from(e)));;
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
                          widget.level,
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
                      SudokuGrid(
                        init: Data.init,
                        data: Data.zero,
                        anim: Data.animation,
                        selectedX: selectedX,
                        selectedY: selectedY,
                        specifiedX: specifiedX,
                        specifiedY: specifiedY,
                        initX: initX,
                        initY: initY,
                        animCell: cell,
                        timer: _timer,
                        onTap: (int x, int y) {
                          setState(() {
                            selectedX = x;
                            selectedY = y;
                          });
                        },
                      ),

                      // 候補の盤面
                      CandidateGrid(
                        candidate: Data.tmp,
                      ),
                    ],
                  ),

                  // 余白
                  SizedBox(
                    height: (screenSize.width) / 15,
                  ),

                  // アイコンボタン
                  ControlButton(
                    onTap: (int number) {
                      if (Data.init[selectedY][selectedX] == 0) {
                        setState(() {
                          Data.zero[selectedY][selectedX] = number;
                          Data.tmp[3 * selectedY][3 * selectedX] = 0;
                          Data.tmp[3 * selectedY][3 * selectedX + 1] = 0;
                          Data.tmp[3 * selectedY][3 * selectedX + 2] = 0;
                          Data.tmp[3 * selectedY + 1][3 * selectedX] = 0;
                          Data.tmp[3 * selectedY + 1][3 * selectedX + 1] =0;
                          Data.tmp[3 * selectedY + 1][3 * selectedX + 2] =0;
                          Data.tmp[3 * selectedY + 2][3 * selectedX] = 0;
                          Data.tmp[3 * selectedY + 2][3 * selectedX + 1] =0;
                          Data.tmp[3 * selectedY + 2][3 * selectedX + 2] =0;
                        });
                      }
                    },
                    onPress: () {
                      setState(() {
                        isEdit = !isEdit;
                      });
                    },
                  ),

                  // 余白
                  SizedBox(
                    height: (screenSize.width) / 10,
                  ),

                  // 数字ボタン
                  Numbers(
                    isPress: isEdit,
                    onTap: (int number) {
                      if (Data.init[selectedY][selectedX] == 0) {
                        if (isEdit == true &&
                            Data.zero[selectedY][selectedX] == 0) {
                          if (number == 1) {
                            setState(() {
                              Data.tmp[3 * selectedY][3 * selectedX] =
                              Data.tmp[3 * selectedY][3 * selectedX] == number ? 0 : number;
                            });
                          } else if (number == 2) {
                            setState(() {
                              Data.tmp[3 * selectedY][3 * selectedX + 1] =
                              Data.tmp[3 * selectedY][3 * selectedX + 1] == number ? 0 : number;
                            });
                          } else if (number == 3) {
                            setState(() {
                              Data.tmp[3 * selectedY][3 * selectedX + 2] = 
                              Data.tmp[3 * selectedY][3 * selectedX + 2] == number ? 0 : number;
                            });
                          } else if (number == 4) {
                            setState(() {
                              Data.tmp[3 * selectedY + 1][3 * selectedX] =
                              Data.tmp[3 * selectedY + 1][3 * selectedX] == number ? 0 : number;
                            });
                          } else if (number == 5) {
                            setState(() {
                              Data.tmp[3 * selectedY + 1][3 * selectedX + 1] =
                              Data.tmp[3 * selectedY + 1][3 * selectedX + 1] == number ? 0 : number;
                            });
                          } else if (number == 6) {
                            setState(() {
                              Data.tmp[3 * selectedY + 1][3 * selectedX + 2] =
                              Data.tmp[3 * selectedY + 1][3 * selectedX + 2] == number ? 0 : number;
                            });
                          } else if (number == 7) {
                            setState(() {
                              Data.tmp[3 * selectedY + 2][3 * selectedX] =
                              Data.tmp[3 * selectedY + 2][3 * selectedX] == number ? 0 : number;
                            });
                          } else if (number == 8) {
                            setState(() {
                              Data.tmp[3 * selectedY + 2][3 * selectedX + 1] =
                              Data.tmp[3 * selectedY + 2][3 * selectedX + 1] == number ? 0 : number;
                            });
                          } else if (number == 9) {
                            setState(() {
                              Data.tmp[3 * selectedY + 2][3 * selectedX + 2] =
                              Data.tmp[3 * selectedY + 2][3 * selectedX + 2] == number ? 0 : number;
                            });
                          }
                        } else if (isEdit == false) {
                          setState(() {
                            Data.zero[selectedY][selectedX] = number;
                            Data.tmp[3 * selectedY][3 * selectedX] = 0;
                            Data.tmp[3 * selectedY][3 * selectedX + 1] = 0;
                            Data.tmp[3 * selectedY][3 * selectedX + 2] = 0;
                            Data.tmp[3 * selectedY + 1][3 * selectedX] = 0;
                            Data.tmp[3 * selectedY + 1][3 * selectedX + 1] = 0;
                            Data.tmp[3 * selectedY + 1][3 * selectedX + 2] = 0;
                            Data.tmp[3 * selectedY + 2][3 * selectedX] = 0;
                            Data.tmp[3 * selectedY + 2][3 * selectedX + 1] = 0;
                            Data.tmp[3 * selectedY + 2][3 * selectedX + 2] = 0;
                          });
                        }
                      }
                    },
                  ),

                  // 余白
                  SizedBox(
                    height: (screenSize.width) / 15,
                  ),

                  //決定、解答ボタン
                  ConfirmButton(answer: Data.zero[Data.selectedY][Data.selectedX]),

                  SizedBox(
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

          Positioned(
            left:  (screenSize.width) / 2.57,
            top: (screenSize.width) / 1.26,
            // left: 160.0,
            // top: 325.8,
            child: Container(
              width: (screenSize.width) / 4.5,
              height: (screenSize.width) / 4.5,
              child: !_timer ? 
                FloatingActionButton(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.play_arrow, size: (screenSize.width) / 4.5,),
                    onPressed: () {
                      setState(() {
                        _timeRunning = true;
                        _timer = true;
                      });
                      print((screenSize.width) / 5);
                    },
                ) : null,
              ),
          ),
        ],
      ),
    );
  }
}
