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

import 'package:anumber/components/answer/grid_answer_candidate.dart';
import 'package:anumber/components/board/grid_candidate.dart';
import 'package:anumber/components/screen/gameScreen.dart';
import 'package:anumber/components/stopwatch/stop_watch.dart';
import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import '../../style/theme_controller.dart';
import '../answer/answer.dart';
import '../answer/grid_answer.dart';
import '../database/database_connection.dart';

class AnswerScreen extends StatefulWidget {
  final String level;

  const AnswerScreen({Key? key, required this.level}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<AnswerScreen> {
  
  // late String state;
  bool _isTappable = true;
  bool _timeRunning = false;
  bool _timer = true;
  final fabKey = GlobalKey();
  final _database = Database();
  int count = 0;

  @override
  void initState() {
    super.initState();
    Answer.makeAnswerList(setState);
  }

  Future<void> getAnswer() async{
    setState(() {
      Infomation.data = Infomation.dataList[count];
      Infomation.answer = Infomation.answerList[count];
      initX = Infomation.xyList[count][0];
      initY = Infomation.xyList[count][1];
      initX1 = Infomation.xyList[count][2];
      initY1 = Infomation.xyList[count][3];
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var appbarSize = AppBar().preferredSize.height;
    var fontsize = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) *0.71 : ((screenSize.height) * 0.45 / 9) *0.71;
    var iconsize = ((screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) *0.71 : ((screenSize.height) * 0.45 / 9) *0.71);
    var buttonsize = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) *0.618 : ((screenSize.height) * 0.45 / 9) *0.618;

    return AbsorbPointer(
      absorbing: !_isTappable,
      // onWillPop: () => Future.value(false),
      child: Stack(
        // alignment: Alignment.center,
        children: <Widget>[
          Scaffold(
            backgroundColor: AppColors.isOther,
                appBar: PreferredSize(
                  preferredSize: screenSize * 0.043,
                  child: AppBar(
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: AppColors.isOther,
                        statusBarIconBrightness: AppColors.colorState == 2 ? Brightness.light : Brightness.dark
                      ),
                      backgroundColor: AppColors.isOther,
                      iconTheme: IconThemeData(
                        color: AppColors.isText,
                      ),
                    leading: IconButton(
                      icon: const Icon(LineIcons.angleLeft),
                      onPressed: () async {
                        // Navigator.pop(context); 
                        Navigator.maybePop(context);
                        // _database.insertDB(DateFormat.ms().format(Stopwatch.time), Infomation.init, Infomation.zero, Infomation.tmp);
                        // setState(() {
                        //   // Infomation.animation = List<List<int>>.from(Infomation.const_animation.map((e) => List<int>.from(e)));
                        //   // 初期化
                        //   Stopwatch.time = DateTime.utc(0, 0, 0);
                        //   Infomation.animation = List.generate(9, (_) => List.generate(9, (_) => 0));
                        //   Infomation.const_animation = List.generate(9, (_) => List.generate(9, (_) => 0));
                        //   Infomation.zero = List.generate(9, (_) => List.generate(9, (_) => 0));
                        //   Infomation.init = List.generate(9, (_) => List.generate(9, (_) => 0));
                        //   Infomation.historyList = [];
                        //   Infomation.tmp_historyList = [];
                        //   Infomation.specifiedX = -1;
                        //   Infomation.specifiedY = -1;
                        //   Infomation.selectedX = 0;
                        //   Infomation.selectedY = 0;
                        //   Infomation.kotae = 0;

                        // });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sudoku(level: widget.level, initFlag: false), 
                          ),
                        );
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
                      },
                    ),
                    title: Center(
                      child: Text(
                        'A Number',
                        style: TextStyle(
                          fontSize: fontsize *0.7,
                          color: Colors.blue[900],
                        ),
                      ),
                    ),
                    elevation: 1,
                  ),
                ),

//----------------------------------------------------------------------------------------------------------------------------------------
            endDrawer: Drawer(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: appbarSize * 0.83,
                    child: DrawerHeader(
                      decoration: const BoxDecoration(),
                      padding: const EdgeInsets.all(0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(LineIcons.times),
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
                              },
                              child: Container(),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16.0),
                                primary: Colors.white,
                                elevation: 0,
                                side: AppColors.colorState == 1 ? const BorderSide(color: Colors.blue, width: 2) : const BorderSide(color: Color.fromARGB(255, 163, 163, 163), width: 2),
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
                              },
                              child: Container(),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16.0),
                                primary: Colors.black,
                                elevation: 0,
                                side: AppColors.colorState == 2 ? const BorderSide(color: Colors.blue, width: 2) : null,
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
                              },
                              child: Container(),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(16.0),
                                primary: Colors.orange[100],
                                elevation: 0,
                                side: AppColors.colorState == 3 ? const BorderSide(color: Colors.blue, width: 2) : null,
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

//----------------------------------------------------------------------------------------------------------------------------------------
            body: Center(
              child: Column(
                // 盤面、アイコン、数字ボタンを縦方向に並べ、スペースを均等に配置
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //余白
                  SizedBox(
                    height: (screenSize.height) * 0.05,
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: (screenSize.width) / 25),
                        child: Text(
                          // '難易度 ：${widget.level}',
                          '難易度 ：${widget.level}',
                          style: TextStyle(
                            fontSize: (screenSize.width) / 25,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: (screenSize.width) / 2,
                      ),
                    
                      InkWell(
                        // padding: EdgeInsets.only(left: (screenSize.width) / 1.8),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: _timeRunning ?  const Icon(LineIcons.pauseCircle) : const Icon(Icons.play_arrow),
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
                    height: (screenSize.height) * 0.015,
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
                        selectedX: Infomation.selectedX,
                        selectedY: Infomation.selectedY,
                        specifiedX: Infomation.specifiedX,
                        specifiedY: Infomation.specifiedY,
                        isAnswerRow: initX,
                        isAnswerColumn: initY,
                        initX: initX1,
                        initY: initY1,
                        timer: _timer,
                      ),
                      // 候補の盤面
                      AnswerCandidateGrid(
                        candidate: Infomation.answerCandidate,
                        candianim: Infomation.animation_candidate,
                      ),
                    ],
                  ),

//----------------------------------------------------------------------------------------------------------------------------------------
                  // 余白
                  SizedBox(
                    height: (screenSize.width) / 13,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (count > 0) {
                            count -= 1;
                            await getAnswer();
                          }
                        },
                        child: Icon(
                          LineIcons.arrowLeft,
                          size: fontsize * 1.4,
                          color: AppColors.isText,
                        ),
                      ),

                      Container(
                        child: Text(
                          '${count +1}/${Infomation.dataList.length}',
                          style: TextStyle(
                            fontSize: (screenSize.width) / 25,
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () async{
                          count < Infomation.dataList.length -1 ? count += 1 : null;
                          await getAnswer();
                        },
                        child: Icon(
                          LineIcons.arrowRight,
                          size: fontsize * 1.4,
                          color: AppColors.isText,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(
                    height: (screenSize.width) / 13,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: buttonsize * 1.618,
                        width: buttonsize * 5.6,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.transparent,
                            elevation: 3,
                            shadowColor: Colors.grey[50],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                          

                          },
                          child: Text(
                            '戻る',
                            style: TextStyle(
                              fontSize: buttonsize,
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: buttonsize * 1.618,
                        width: buttonsize * 5.6,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.transparent,
                            elevation: 3,
                            shadowColor: Colors.grey[50],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                          

                          },
                          child: Text(
                            '次の問題',
                            style: TextStyle(
                              fontSize: buttonsize,
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: (screenSize.width) / 13,
                  ),

                  // SizedBox(
                  //   height: buttonsize * 2,
                  //   width: buttonsize * 12.5,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //       primary: Colors.white,
                  //       onPrimary: Colors.transparent,
                  //       elevation: 3,
                  //       shadowColor: Colors.grey[50],
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //       ),
                  //     ),
                  //     onPressed: () async {
                      

                  //     },
                  //     child: Text(
                  //       '全て完成させる',
                  //       style: TextStyle(
                  //         fontSize: buttonsize,
                  //         color: Colors.blue[900],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900], //ボタンの背景色
                        minimumSize: Size(buttonsize * 12.5, buttonsize * 2)),
                    child: Text(
                      "全て完成させる",
                      style: TextStyle(
                        color: Colors.white, // ボタンのテキストの色
                        fontSize: buttonsize,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 50.0, //バナー広告のサイズ 320×50 なので
                    width: double.infinity,
                    // child: AdWidget(ad: myBanner),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
