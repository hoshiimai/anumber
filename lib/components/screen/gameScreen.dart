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

import 'package:anumber/components/button/confirmButton.dart';
import 'package:anumber/components/board/grid_candidate.dart';
import 'package:anumber/components/stopwatch/stop_watch.dart';
import 'package:anumber/home.dart';
import 'package:anumber/infomation.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:anumber/components/board/grid.dart';
import 'package:anumber/components/button/numbers.dart';
import 'package:intl/intl.dart';

import '../initprocess/grid_init.dart';
import '../initprocess/initProcess.dart';
import '../../main.dart';
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
                  _database.insertDB(DateFormat.ms().format(Stopwatch.time), Infomation.init, Infomation.zero, Infomation.tmp);
                  setState(() {
                    // Infomation.animation = List<List<int>>.from(Infomation.const_animation.map((e) => List<int>.from(e)));
                    // 初期化
                    Stopwatch.time = DateTime.utc(0, 0, 0);
                    Infomation.animation = List.generate(9, (_) => List.generate(9, (_) => 0));
                    Infomation.const_animation = List.generate(9, (_) => List.generate(9, (_) => 0));
                    Infomation.zero = List.generate(9, (_) => List.generate(9, (_) => 0));
                    Infomation.init = List.generate(9, (_) => List.generate(9, (_) => 0));
                    Infomation.historyList = [];
                    Infomation.tmp_historyList = [];
                    Infomation.specifiedX = -1;
                    Infomation.specifiedY = -1;
                    Infomation.selectedX = 0;
                    Infomation.selectedY = 0;
                    Infomation.kotae = 0;

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

                      _isTappable
                        //メインの盤面
                        ? SudokuGrid(
                              init: Infomation.init,  //問題用リスト(入力マスかどうか判定用)
                              data: Infomation.zero,  //盤面全体の数字リスト
                              selectedX: selectedX,   //選択マスx座標
                              selectedY: selectedY,   //選択マスy座標
                              specifiedX: Infomation.specifiedX, //問題マスx座標
                              specifiedY: Infomation.specifiedY, //問題マスy座標
                              onTap: (int x, int y) {
                                setState(() {
                                  selectedX = x;
                                  selectedY = y;
                                });
                              },
                          )
                        //最初のアニメーション
                        : InitGrid(
                            data: Infomation.zero,  //盤面全体の数字リスト
                            anim: Infomation.animation,   //最初のアニメーション用リスト
                            specifiedX: Infomation.specifiedX, //問題マスx座標
                            specifiedY: Infomation.specifiedY, //問題マスy座標
                            initX: initX,   //アニメーション移動マスx座標
                            initY: initY,   //アニメーション移動マスy座標
                            animCell: cell, //問題の領域塗りつぶし判定
                          ),

                      // 候補の盤面
                      CandidateGrid(
                        candidate: Infomation.tmp,
                      ),
                    ],
                  ),

                  // 余白
                  SizedBox(
                    height: (screenSize.width) / 15,
                  ),

                  // アイコンボタン
                  ControlButton(
                    onBack: () {
                      if (Infomation.historyList.length > 1  && 
                          Infomation.tmp_historyList.length > 1 && 
                          Infomation.selected_historyList.length > 1) {
                          // 戻るボタン押下時
                          setState(() {
                            Infomation.historyList.removeLast();
                            Infomation.tmp_historyList.removeLast();
                            Infomation.selected_historyList.removeLast();

                            Infomation.zero = Infomation.historyList.last;
                            Infomation.tmp = Infomation.tmp_historyList.last;
                            selectedX = Infomation.selected_historyList.last[0];
                            selectedY = Infomation.selected_historyList.last[1];
                          });
                          print('check1');
                      } else if(Infomation.historyList.length == 1 && 
                                Infomation.tmp_historyList.length == 1 && 
                                Infomation.selected_historyList.length == 1) {
                          setState(() {
                            Infomation.zero = Infomation.historyList.first;
                            Infomation.tmp = Infomation.tmp_historyList.first;
                            selectedX = Infomation.selected_historyList.first[0];
                            selectedY = Infomation.selected_historyList.first[1];
                          });
                          print('check');
                      }
                    },
                    onTap: (int number) {
                      if (Infomation.init[selectedY][selectedX] == 0) {
                        setState(() {
                          Infomation.zero[selectedY][selectedX] = number;
                          Infomation.tmp[3 * selectedY][3 * selectedX] = 0;
                          Infomation.tmp[3 * selectedY][3 * selectedX + 1] = 0;
                          Infomation.tmp[3 * selectedY][3 * selectedX + 2] = 0;
                          Infomation.tmp[3 * selectedY + 1][3 * selectedX] = 0;
                          Infomation.tmp[3 * selectedY + 1][3 * selectedX + 1] =0;
                          Infomation.tmp[3 * selectedY + 1][3 * selectedX + 2] =0;
                          Infomation.tmp[3 * selectedY + 2][3 * selectedX] = 0;
                          Infomation.tmp[3 * selectedY + 2][3 * selectedX + 1] =0;
                          Infomation.tmp[3 * selectedY + 2][3 * selectedX + 2] =0;
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
                      if (Infomation.init[selectedY][selectedX] == 0) {
                        if (isEdit == true &&
                            Infomation.zero[selectedY][selectedX] == 0) {
                          if (number == 1) {
                            setState(() {
                              Infomation.tmp[3 * selectedY][3 * selectedX] =
                              Infomation.tmp[3 * selectedY][3 * selectedX] == number ? 0 : number;
                              Infomation.historyList.add(List.from(
                                Infomation.zero.map((row) => List<int>.from(row))
                              ));
                              Infomation.tmp_historyList.add(List.from(
                                Infomation.tmp.map((row) => List<int>.from(row))
                              ));
                              Infomation.selected_historyList.add([selectedX,selectedY]);
                            });
                          } else if (number == 2) {
                            setState(() {
                              Infomation.tmp[3 * selectedY][3 * selectedX + 1] =
                              Infomation.tmp[3 * selectedY][3 * selectedX + 1] == number ? 0 : number;
                              Infomation.historyList.add(List.from(
                                Infomation.zero.map((row) => List<int>.from(row))
                              ));
                              Infomation.tmp_historyList.add(List.from(
                                Infomation.tmp.map((row) => List<int>.from(row))
                              ));
                              Infomation.selected_historyList.add([selectedX,selectedY]);
                            });
                          } else if (number == 3) {
                            setState(() {
                              Infomation.tmp[3 * selectedY][3 * selectedX + 2] = 
                              Infomation.tmp[3 * selectedY][3 * selectedX + 2] == number ? 0 : number;
                              Infomation.historyList.add(List.from(
                                Infomation.zero.map((row) => List<int>.from(row))
                              ));
                              Infomation.tmp_historyList.add(List.from(
                                Infomation.tmp.map((row) => List<int>.from(row))
                              ));
                              Infomation.selected_historyList.add([selectedX,selectedY]);
                            });
                          } else if (number == 4) {
                            setState(() {
                              Infomation.tmp[3 * selectedY + 1][3 * selectedX] =
                              Infomation.tmp[3 * selectedY + 1][3 * selectedX] == number ? 0 : number;
                              Infomation.historyList.add(List.from(
                                Infomation.zero.map((row) => List<int>.from(row))
                              ));
                              Infomation.tmp_historyList.add(List.from(
                                Infomation.tmp.map((row) => List<int>.from(row))
                              ));
                              Infomation.selected_historyList.add([selectedX,selectedY]);
                            });
                          } else if (number == 5) {
                            setState(() {
                              Infomation.tmp[3 * selectedY + 1][3 * selectedX + 1] =
                              Infomation.tmp[3 * selectedY + 1][3 * selectedX + 1] == number ? 0 : number;
                              Infomation.historyList.add(List.from(
                                Infomation.zero.map((row) => List<int>.from(row))
                              ));
                              Infomation.tmp_historyList.add(List.from(
                                Infomation.tmp.map((row) => List<int>.from(row))
                              ));
                              Infomation.selected_historyList.add([selectedX,selectedY]);
                            });
                          } else if (number == 6) {
                            setState(() {
                              Infomation.tmp[3 * selectedY + 1][3 * selectedX + 2] =
                              Infomation.tmp[3 * selectedY + 1][3 * selectedX + 2] == number ? 0 : number;
                              Infomation.historyList.add(List.from(
                                Infomation.zero.map((row) => List<int>.from(row))
                              ));
                              Infomation.tmp_historyList.add(List.from(
                                Infomation.tmp.map((row) => List<int>.from(row))
                              ));
                              Infomation.selected_historyList.add([selectedX,selectedY]);
                            });
                          } else if (number == 7) {
                            setState(() {
                              Infomation.tmp[3 * selectedY + 2][3 * selectedX] =
                              Infomation.tmp[3 * selectedY + 2][3 * selectedX] == number ? 0 : number;
                              Infomation.historyList.add(List.from(
                                Infomation.zero.map((row) => List<int>.from(row))
                              ));
                              Infomation.tmp_historyList.add(List.from(
                                Infomation.tmp.map((row) => List<int>.from(row))
                              ));
                              Infomation.selected_historyList.add([selectedX,selectedY]);
                            });
                          } else if (number == 8) {
                            setState(() {
                              Infomation.tmp[3 * selectedY + 2][3 * selectedX + 1] =
                              Infomation.tmp[3 * selectedY + 2][3 * selectedX + 1] == number ? 0 : number;
                              Infomation.historyList.add(List.from(
                                Infomation.zero.map((row) => List<int>.from(row))
                              ));
                              Infomation.tmp_historyList.add(List.from(
                                Infomation.tmp.map((row) => List<int>.from(row))
                              ));
                              Infomation.selected_historyList.add([selectedX,selectedY]);
                            });
                          } else if (number == 9) {
                            setState(() {
                              Infomation.tmp[3 * selectedY + 2][3 * selectedX + 2] =
                              Infomation.tmp[3 * selectedY + 2][3 * selectedX + 2] == number ? 0 : number;
                              Infomation.historyList.add(List.from(
                                Infomation.zero.map((row) => List<int>.from(row))
                              ));
                              Infomation.tmp_historyList.add(List.from(
                                Infomation.tmp.map((row) => List<int>.from(row))
                              ));
                              Infomation.selected_historyList.add([selectedX,selectedY]);
                            });
                          }
                        } else if (isEdit == false) {
                          setState(() {
                            Infomation.zero[selectedY][selectedX] = number;
                            Infomation.tmp[3 * selectedY][3 * selectedX] = 0;
                            Infomation.tmp[3 * selectedY][3 * selectedX + 1] = 0;
                            Infomation.tmp[3 * selectedY][3 * selectedX + 2] = 0;
                            Infomation.tmp[3 * selectedY + 1][3 * selectedX] = 0;
                            Infomation.tmp[3 * selectedY + 1][3 * selectedX + 1] = 0;
                            Infomation.tmp[3 * selectedY + 1][3 * selectedX + 2] = 0;
                            Infomation.tmp[3 * selectedY + 2][3 * selectedX] = 0;
                            Infomation.tmp[3 * selectedY + 2][3 * selectedX + 1] = 0;
                            Infomation.tmp[3 * selectedY + 2][3 * selectedX + 2] = 0;
                            Infomation.historyList.add(List.from(
                              Infomation.zero.map((row) => List<int>.from(row))
                            ));
                            Infomation.tmp_historyList.add(List.from(
                              Infomation.tmp.map((row) => List<int>.from(row))
                            ));
                            Infomation.selected_historyList.add([selectedX,selectedY]);
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
                  ConfirmButton(answer: Infomation.zero[Infomation.selectedY][Infomation.selectedX]),

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
