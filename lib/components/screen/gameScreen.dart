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

  @override
  void initState() {
    super.initState();
    getdata();
    state = widget.level;
    print(state);
  }

  getdata() async {
    await Future.delayed(Duration(milliseconds: 500));
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        if (Data.init[i][j] != 0) {
          await Future.delayed(Duration(milliseconds: 10));
          setState(() {
            Data.zero[i][j] = Data.init[i][j];
          });
        }
      }
    }
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
                  Padding(
                    padding: EdgeInsets.only(left: (screenSize.width) / 1.5),
                    child: const Icon(Icons.timer),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: (screenSize.width) / 100),
                    child: const Stopwatch(),
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
                    data: Data.data,
                    selectedX: Data.selectedX,
                    selectedY: Data.selectedY,
                    onTap: (int x, int y) {
                      setState(() {
                        Data.selectedX = x;
                        Data.selectedY = y;
                      });
                    },
                  ),

                  // 候補の盤面
                  CandidateGrid(
                    candidate: Data.tmp,
                  ),


                  IllustratGrid(
                    ans: Data.ans,
                    onTap: (int x, int y) {
                      setState(() {
                        Data.circlex1 = x;
                        Data.circley1 = y;
                      });
                    },
                  ),


                  // CustomPaint(
                  //   size: Size(200, 200),
                  //   painter: CircleAndLinePainter(),
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     border: Border.all(
                  //       color: Colors.red,
                  //       width: 3,
                  //     ),
                  //   ),
                  //   height: 40,
                  //   width: 40,
                  // ),
                  // Align(
                  //   alignment: Alignment(-0.93, 0),
                  //   // alignment: Alignment(-0.93, 0.5),
                  //   child: Container(
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     border: Border.all(
                  //       color: Colors.red,
                  //       width: 3,
                  //     ),
                  //   ),
                  //   height: 40,
                  //   width: 40,
                  //   )
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
                      Data.data[Data.selectedY][Data.selectedX] = number;
                      Data.tmp[3 * Data.selectedY][3 * Data.selectedX] = 0;
                      Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 1] = 0;
                      Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 2] = 0;
                      Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX] = 0;
                      Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 1] =
                          0;
                      Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 2] =
                          0;
                      Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX] = 0;
                      Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 1] =
                          0;
                      Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 2] =
                          0;
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
                        Data.data[Data.selectedY][Data.selectedX] == 0) {
                      if (number == 1) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY][3 * Data.selectedX] =
                              Data.tmp[3 * Data.selectedY]
                                          [3 * Data.selectedX] ==
                                      number
                                  ? 0
                                  : number;
                        });
                      } else if (number == 2) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 1] =
                              Data.tmp[3 * Data.selectedY]
                                          [3 * Data.selectedX + 1] ==
                                      number
                                  ? 0
                                  : number;
                        });
                      } else if (number == 3) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 2] =
                              Data.tmp[3 * Data.selectedY]
                                          [3 * Data.selectedX + 2] ==
                                      number
                                  ? 0
                                  : number;
                        });
                      } else if (number == 4) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX] =
                              Data.tmp[3 * Data.selectedY + 1]
                                          [3 * Data.selectedX] ==
                                      number
                                  ? 0
                                  : number;
                        });
                      } else if (number == 5) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 1]
                                  [3 * Data.selectedX + 1] =
                              Data.tmp[3 * Data.selectedY + 1]
                                          [3 * Data.selectedX + 1] ==
                                      number
                                  ? 0
                                  : number;
                        });
                      } else if (number == 6) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 1]
                                  [3 * Data.selectedX + 2] =
                              Data.tmp[3 * Data.selectedY + 1]
                                          [3 * Data.selectedX + 2] ==
                                      number
                                  ? 0
                                  : number;
                        });
                      } else if (number == 7) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX] =
                              Data.tmp[3 * Data.selectedY + 2]
                                          [3 * Data.selectedX] ==
                                      number
                                  ? 0
                                  : number;
                        });
                      } else if (number == 8) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 2]
                                  [3 * Data.selectedX + 1] =
                              Data.tmp[3 * Data.selectedY + 2]
                                          [3 * Data.selectedX + 1] ==
                                      number
                                  ? 0
                                  : number;
                        });
                      } else if (number == 9) {
                        setState(() {
                          Data.tmp[3 * Data.selectedY + 2]
                                  [3 * Data.selectedX + 2] =
                              Data.tmp[3 * Data.selectedY + 2]
                                          [3 * Data.selectedX + 2] ==
                                      number
                                  ? 0
                                  : number;
                        });
                      }
                    } else if (isEdit == false) {
                      setState(() {
                        Data.data[Data.selectedY][Data.selectedX] = number;
                        Data.tmp[3 * Data.selectedY][3 * Data.selectedX] = 0;
                        Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 1] =
                            0;
                        Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 2] =
                            0;
                        Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX] =
                            0;
                        Data.tmp[3 * Data.selectedY + 1]
                            [3 * Data.selectedX + 1] = 0;
                        Data.tmp[3 * Data.selectedY + 1]
                            [3 * Data.selectedX + 2] = 0;
                        Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX] =
                            0;
                        Data.tmp[3 * Data.selectedY + 2]
                            [3 * Data.selectedX + 1] = 0;
                        Data.tmp[3 * Data.selectedY + 2]
                            [3 * Data.selectedX + 2] = 0;
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
              ConfirmButton(answer: Data.data[Data.selectedY][Data.selectedX]),

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
