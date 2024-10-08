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

import 'package:anumber/admobHelper.dart';
import 'package:anumber/components/answer/grid_answer_CLB.dart';
import 'package:anumber/components/answer/grid_answer_candidate.dart';
import 'package:anumber/components/answer/grid_answer_candidate_paint.dart';
import 'package:anumber/components/screen/gameScreen.dart';
import 'package:anumber/components/screen/playSudoku.dart';
import 'package:anumber/components/stopwatch/stop_watch.dart';
import 'package:anumber/help_game.dart';
import 'package:anumber/help_home.dart';
import 'package:anumber/infomation.dart';
import 'package:anumber/makeQuestion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:line_icons/line_icons.dart';
import '../../style/theme_controller.dart';
import '../answer/answer.dart';
import '../answer/grid_answer.dart';
import 'package:audioplayers/audioplayers.dart';


class AnswerScreen extends StatefulWidget {

  const AnswerScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<AnswerScreen> {
  
  // late String state;
  bool _isTappable = true;
  int count = 0;
  bool autoFlag = true;
  final _audio = AudioCache();
  late BannerAd _bannerAd;


  @override
  void initState() {
    super.initState();
    setState(() {
      Infomation.data = Infomation.init;
      Infomation.answer = List.generate(9, (_) => List.filled(9, 0));
      Infomation.answerCandidate = List.generate(27, (_) => List.filled(27, 0));
      Infomation.animation_candidate = List.generate(27, (_) => List.filled(27, 0));
      Infomation.paintCandidate1 = List.generate(27, (_) => List.filled(27, 0));
      Infomation.paintCandidate2 = List.generate(27, (_) => List.filled(27, 0));
      Infomation.dataList = [];
      Infomation.answerList = [];
      Infomation.candidateList = [];
      Infomation.animationCandidateList = [];
      Infomation.xyList = [];
      Infomation.sortingList = [];
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
      Infomation.selectedX = Infomation.answerX;
      Infomation.selectedY = Infomation.answerY;
      Infomation.borderListX = [-100];
      Infomation.borderListY = [-100];
      Infomation.borderXYList = [];
      Infomation.paintList = [];
    });
    Answer.makeAnswerList(setState);
    _bannerAd = AdmobHelper.getBannerAd()..load();
  }

  getAnswer() async{
    setState(() {
      Infomation.data = Infomation.dataList[count];
      Infomation.answer = Infomation.answerList[count];
      Infomation.answerCandidate = Infomation.candidateList[count];
      Infomation.animation_candidate = Infomation.animationCandidateList[count];
      Infomation.initX = Infomation.xyList[count][0];
      Infomation.initY = Infomation.xyList[count][1];
      Infomation.initX1 = Infomation.xyList[count][2];
      Infomation.initY1 = Infomation.xyList[count][3];
      Infomation.initX2 = Infomation.xyList[count][4];
      Infomation.initY2 = Infomation.xyList[count][5];
      Infomation.initX3 = Infomation.xyList[count][6];
      Infomation.initY3 = Infomation.xyList[count][7];
      Infomation.initX4 = Infomation.xyList[count][8];
      Infomation.initY4 = Infomation.xyList[count][9];
      Infomation.borderListX = Infomation.borderXYList[count][0];
      Infomation.borderListY = Infomation.borderXYList[count][1];
      Infomation.paintCandidate1 = Infomation.paintList[count][0];
      Infomation.paintCandidate2 = Infomation.paintList[count][1];
    });

    if(Infomation.level == "初級") {
      if(Infomation.id == 2 && count == 1 && autoFlag) {
        _isTappable = false;
        await Answer.auto189(setState);
        _isTappable = true;
        autoFlag = false;
      }
    } else if(Infomation.level == "上級") {
      if(Infomation.id == 2 && count == 7 && autoFlag) {
        _isTappable = false;
        await Answer.flashingNum(setState);
        _isTappable = true;
      } else if(Infomation.id == 3 && count == 4 && autoFlag) {
        _isTappable = false;
        await Answer.flashingNum(setState);
        _isTappable = true;
      } else if(Infomation.id == 4 && count == 5 && autoFlag) {
        _isTappable = false;
        await Answer.flashingNum(setState);
        _isTappable = true;
      } else if(Infomation.id == 5 && count == 5 && autoFlag) {
        _isTappable = false;
        await Answer.flashingNum(setState);
        _isTappable = true;
        autoFlag = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var appbarSize = AppBar().preferredSize.height;
    var fontsize = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) *0.71 : ((screenSize.height) * 0.45 / 9) *0.71;

    return AbsorbPointer(
      absorbing: !_isTappable,
      child: Stack(
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
                      icon: Icon(LineIcons.angleLeft, size: fontsize *0.7),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sudoku(initFlag: false, isResume: false), 
                          ),
                        );
                      },
                    ),
                    title: Center(
                      child: Text(
                        'A Number',
                        style: TextStyle(
                          fontSize: fontsize *0.7,
                          color: Colors.blue[900],
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.bold
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
                    height: appbarSize * 0.7,
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
                      onTap: () {
                        setState(() {
                          // 初期化
                          Stopwatch.time = DateTime.utc(0, 0, 0);
                          Infomation.animation = List.generate(9, (_) => List.generate(9, (_) => 0));
                          Infomation.const_animation = List.generate(9, (_) => List.generate(9, (_) => 0));
                          Infomation.zero = List.generate(9, (_) => List.generate(9, (_) => 0));
                          Infomation.init = List.generate(9, (_) => List.generate(9, (_) => 0));
                          Infomation.tmp = List.generate(27, (_) => List.generate(27, (_) => 0));
                          Infomation.historyList = [];
                          Infomation.tmp_historyList = [];
                          Infomation.specifiedX = -1;
                          Infomation.specifiedY = -1;
                          Infomation.selectedX = 0;
                          Infomation.selectedY = 0;
                          Infomation.answerX = 0;
                          Infomation.answerY = 0;
                          Infomation.kotae = 0;

                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HelpGame()));
                      },
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
                        padding: EdgeInsets.only(left: (screenSize.width) / 23),
                        child: Text(
                          '難易度 ：${Infomation.level}',
                          style: TextStyle(
                            fontSize: (screenSize.width) / 25,
                          ),
                        ),
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
                        initX0: Infomation.initX,
                        initY0: Infomation.initY,
                        initX1: Infomation.initX1,
                        initY1: Infomation.initY1,
                        initX2: Infomation.initX2,
                        initY2: Infomation.initY2,
                        initX3: Infomation.initX3,
                        initY3: Infomation.initY3,
                        initX4: Infomation.initX4,
                        initY4: Infomation.initY4,
                        borderListX: Infomation.borderListX,
                        borderListY: Infomation.borderListY,
                      ),
                      // 問題の盤面(ブロック行列ラインのハイライト用)
                      AnswerGridCLB(
                        data: Infomation.data,
                        borderListX: Infomation.borderListX,
                        borderListY: Infomation.borderListY,
                      ),
                      // 線描画(Paint)
                      AnswerCandidateGridPaint(
                        paintCandidate: Infomation.paintCandidate1,
                      ),
                      // 候補の盤面
                      AnswerCandidateGrid(
                        candidate: Infomation.answerCandidate,
                        candianim: Infomation.animation_candidate,
                        // startPoint: Infomation.paintCandidate,
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
                          Infomation.sound ? _audio.play('button3.mp3') : null;
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
                            color: AppColors.isText
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () async{
                          Infomation.sound ? _audio.play('button3.mp3') : null;
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
                        height: (screenSize.width) / 20 * 2.1,
                        width: (screenSize.width) / 20 * 6,                        
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            primary: AppColors.isConfirmButton,
                            onPrimary: Colors.transparent,
                            elevation: 3,
                            // shadowColor: Colors.grey[50],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sudoku(initFlag: false, isResume: false), 
                              ),
                            );
                          },
                          child: Text(
                            '戻る',
                            style: TextStyle(
                              fontSize: (screenSize.width) / 20,
                              color: AppColors.isButtonText,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: (screenSize.width) / 20 * 2.1,
                        width: (screenSize.width) / 20 * 6,                              
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.isConfirmButton,
                            onPrimary: Colors.transparent,
                            elevation: 3,
                            // shadowColor: Colors.grey[50],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () async {
                            // 初期化
                            setState(() {
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
                            
                            await MakeQuestion().getExcelValue();
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Sudoku(initFlag: true, isResume: false,)),
                              (Route<dynamic> route) => false,
                            );

                          },
                          child: Text(
                            '次の問題',
                            style: TextStyle(
                              fontSize: (screenSize.width) / 20,
                              color: AppColors.isButtonText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: (screenSize.width) / 13,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlaySudoku(), 
                      ),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.isButtonText, //ボタンの背景色
                      minimumSize: Size((screenSize.width) / 20 * 15, (screenSize.width) / 20 * 2.3)),
                    child: Text(
                      "全て完成させる",
                      style: TextStyle(
                        color: AppColors.isConfirmButton, // ボタンのテキストの色
                        fontSize: (screenSize.width) / 20,
                      ),
                    ),
                  ),

                  // 余白
                  SizedBox(
                    height: (screenSize.width) / 15,
                  ),

                  Expanded(
                    child: AdWidget(
                      ad: _bannerAd,
                    ),
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
