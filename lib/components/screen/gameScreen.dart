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
import 'package:anumber/question.dart';
import 'package:flutter/material.dart';
import 'package:anumber/components/board/grid.dart';
import 'package:anumber/components/button/numbers.dart';
import 'package:provider/provider.dart';

import '../../makeQuestion.dart';
import '../../sudoku.dart';

class Sudoku extends StatefulWidget {
  final int level;

  const Sudoku({Key? key, required this.level}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<Sudoku> {
  late int state;
  int selectedX = -1;
  int selectedY = -1;
  int initX = -1;
  int initY = -1;
  int specifiedX = -1;
  int specifiedY = -1;
  bool cell = false;
  bool _timeRunning = false;
  bool _timer = true;


  @override
  void initState() {
    super.initState();
    getdata().then((_) {
      _timeRunning = !_timeRunning;
    });
    state = widget.level;
    print(state);
  }

  Future<void> getdata() async {
    await Future.delayed(Duration(milliseconds: 500));
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        await Future.delayed(Duration(milliseconds: 10));
          if (Data.animation[i][j] == 1){
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

  // 候補入力判断用フラグ
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('A Number'),
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
                      state == 1 ? '初級' :
                      state == 2 ? '中級' :
                      state == 3 ? '上級' :
                      'エラー',
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


                  Container(
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
                        },
                    ) : null,
                  ),



                  // IllustratGrid(
                  //   ans: Data.ans,
                  //   onTap: (int x, int y) {
                  //     setState(() {
                  //       Data.circlex1 = x;
                  //       Data.circley1 = y;
                  //     });
                  //   },
                  // ),
                ],
              ),

              // 余白
              SizedBox(
                height: (screenSize.width) / 15,
              ),

              // アイコンボタン
              ControlButton(
                onTap: (int number) {
                  if (Data.init[Data.selectedY][Data.selectedX] == 0) {
                    setState(() {
                      Data.zero[Data.selectedY][Data.selectedX] = number;
                      Data.tmp[3 * Data.selectedY][3 * Data.selectedX] = 0;
                      Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 1] = 0;
                      Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 2] = 0;
                      Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX] = 0;
                      Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 1] =0;
                      Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 2] =0;
                      Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX] = 0;
                      Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 1] =0;
                      Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 2] =0;
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
                  if (Data.init[Data.selectedY][Data.selectedX] == 0) {
                    if (isEdit == true &&
                        Data.zero[Data.selectedY][Data.selectedX] == 0) {
                      if (number == 1) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY][3 * Data.selectedX] =
                          Data.tmp[3 * Data.selectedY][3 * Data.selectedX] == number ? 0 : number;
                        });
                      } else if (number == 2) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 1] =
                          Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 1] == number ? 0 : number;
                        });
                      } else if (number == 3) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 2] = 
                          Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 2] == number ? 0 : number;
                        });
                      } else if (number == 4) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX] =
                          Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX] == number ? 0 : number;
                        });
                      } else if (number == 5) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 1] =
                          Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 1] == number ? 0 : number;
                        });
                      } else if (number == 6) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 2] =
                          Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 2] == number ? 0 : number;
                        });
                      } else if (number == 7) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX] =
                          Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX] == number ? 0 : number;
                        });
                      } else if (number == 8) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 1] =
                          Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 1] == number ? 0 : number;
                        });
                      } else if (number == 9) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 2] =
                          Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 2] == number ? 0 : number;
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
                        // Data.zero[Data.selectedY][Data.selectedX] = number;
                        // Data.tmp[3 * Data.selectedY][3 * Data.selectedX] = 0;
                        // Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 1] = 0;
                        // Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 2] = 0;
                        // Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX] = 0;
                        // Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 1] = 0;
                        // Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 2] = 0;
                        // Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX] = 0;
                        // Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 1] = 0;
                        // Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 2] = 0;
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
    );
  }
}
