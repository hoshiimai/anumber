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
import 'package:anumber/components/history/history.dart';
import 'package:anumber/components/stopwatch/stop_watch.dart';
import 'package:anumber/home.dart';
import 'package:anumber/infomation.dart';
import 'package:anumber/style/theme_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:anumber/components/board/grid.dart';
import 'package:anumber/components/button/numbers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../button/controlNumber.dart';
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
  final _audio = AudioCache();

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
    var appbarSize = AppBar().preferredSize.height;
    return AbsorbPointer(
      absorbing: !_isTappable,
      // onWillPop: () => Future.value(false),
      child: Stack(
        // alignment: Alignment.center,
        children: <Widget>[
          Scaffold(
            backgroundColor: AppColors.isOther,
            appBar: AppBar(
              backgroundColor: AppColors.isOther,
                iconTheme: IconThemeData(
                  color: AppColors.isText,
                ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
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

            endDrawer: Drawer(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 64,
                    child: DrawerHeader(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.all(0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        SizedBox(
                          height: appbarSize,
                          child: Row(
                            children:[ 
                              Icon(Icons.palette_outlined),
                              //余白
                              SizedBox(
                                width: (screenSize.width) / 20,
                              ),
                              Text('色'),
                            ]
                          ),
                        ),
                      ]
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: appbarSize * 0.8,
                          child: ClipOval(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  AppColors.colorState = 1;
                                });
                                print(AppColors.colorState);
                              },
                              child: Container(),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16.0),
                                primary: Colors.white,
                                elevation: 0,
                                side: BorderSide(color: Colors.blue, width: 2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: appbarSize * 0.8,
                          child: ClipOval(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  AppColors.colorState = 2;
                                });
                                print(AppColors.colorState);
                              },
                              child: Container(),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16.0),
                                primary: Colors.black,
                                elevation: 0,
                                // side: BorderSide(color: Colors.blue, width: 2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: appbarSize * 0.8,
                          child: ClipOval(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  AppColors.colorState = 3;
                                });
                                print(AppColors.colorState);
                              },
                              child: Container(),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16.0),
                                primary: Colors.orange[100],
                                elevation: 0,
                                // side: BorderSide(color: Colors.blue, width: 2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Infomation.sound = !Infomation.sound;
                      });
                      print(Infomation.sound);
                    },
                    child: ListTile(
                      title: Row(
                        children: [
                          SizedBox(
                            height: appbarSize,
                            child: Row(
                              children:[ 
                                Infomation.sound ? const Icon(Icons.volume_up) : const Icon(Icons.volume_off),
                                // Infomation.sound ? Icons.volume_up : Icons.volume_off,
                                //余白
                                SizedBox(
                                  width: (screenSize.width) / 20,
                                ),
                                Infomation.sound ? const Text('音 ON') : const Text('音 OFF'),
                              ]
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Row(
                        children: [
                          SizedBox(
                            height: appbarSize,
                            child: Row(
                              children:[ 
                                const Icon(Icons.help_outline),
                                //余白
                                SizedBox(
                                  width: (screenSize.width) / 20,
                                ),
                                const Text('遊び方'),
                              ]
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
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
                              selectedX: Infomation.selectedX,   //選択マスx座標
                              selectedY: Infomation.selectedY,   //選択マスy座標
                              specifiedX: Infomation.specifiedX, //問題マスx座標
                              specifiedY: Infomation.specifiedY, //問題マスy座標
                              onTap: (int x, int y) {
                                setState(() {
                                  Infomation.selectedX = x;
                                  Infomation.selectedY = y;
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
                      getHistory(setState);
                    },
                    
                    // 数字消すボタン
                    onTap: (int number) {
                      deleteNumber(setState, number);
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

                  // 数字入力ボタン
                  Numbers(
                    isPress: isEdit,
                    onTap: (int number) {
                      controlNumber(setState, isEdit, number);
                      Infomation.sound ? _audio.play('button.mp3') : null;
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
