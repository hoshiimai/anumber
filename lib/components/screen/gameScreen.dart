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
import 'dart:io';
import 'package:anumber/admobHelper.dart';
import 'package:anumber/app.dart';
import 'package:anumber/components/button/confirmButton.dart';
import 'package:anumber/components/board/grid_candidate.dart';
import 'package:anumber/components/history/history.dart';
import 'package:anumber/components/stopwatch/stop_watch.dart';
import 'package:anumber/help_game.dart';
import 'package:anumber/infomation.dart';
import 'package:anumber/style/theme_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:anumber/components/board/grid.dart';
import 'package:anumber/components/button/numbers.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeleton_text/skeleton_text.dart';
import '../button/controlNumber.dart';
import '../initprocess/grid_init.dart';
import '../initprocess/initProcess.dart';
import '../database/database_connection.dart';

class Sudoku extends StatefulWidget {
  final bool initFlag;
  final bool isResume;

  const Sudoku({Key? key, required this.initFlag, required this.isResume}) : super(key: key);

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
  final _screenShotController = ScreenshotController();
  late BannerAd _bannerAd;



  @override
  void initState() {
    super.initState();
    if(widget.initFlag) {
      InitProcess.getdata(setState).then((_) {
        _timeRunning = true;
        Future.delayed(Duration.zero, () {
          setState(() {
            _isTappable = true;
          });
        });
      });
    } else if(widget.isResume) {
      InitProcess.selectTime(setState).then((_) {
        _timeRunning = true;
        Future.delayed(Duration.zero, () {
          setState(() {
            _isTappable = true;
          });
        });
      });
    } else {
      setState(() {
        _isTappable = true;
      });
    }
    _bannerAd = AdmobHelper.getBannerAd()..load();
  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var appbarSize = AppBar().preferredSize.height;
    var fontsize = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) *0.71 : ((screenSize.height) * 0.45 / 9) *0.71;
    // myBanner.load();
    // final AdWidget adWidget = AdWidget(ad: myBanner);
    // final Container adContainer = Container(
    //   alignment: Alignment.center,
    //   child: adWidget,
    //   width: myBanner.size.width.toDouble(),
    //   height: myBanner.size.height.toDouble(),
    // );
    return AbsorbPointer(
      absorbing: !_isTappable,
      child: WillPopScope(
        onWillPop: () async => false,
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
                        icon: Icon(LineIcons.angleLeft, size: fontsize *0.7),
                        onPressed: () async {
                          _database.insertDB(Infomation.id, DateFormat.ms().format(Stopwatch.time), Infomation.init, Infomation.zero, Infomation.tmp, Infomation.specifiedX, Infomation.specifiedY, Infomation.kotae, Infomation.level, Infomation.sound);
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
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
              //ハンバーガーメニュー
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
                                const Icon(Icons.palette_outlined),
                                //余白
                                SizedBox(
                                  width: (screenSize.width) / 20,
                                ),
                                const Text('色'),
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
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(), backgroundColor: Colors.white,
                                  padding: const EdgeInsets.all(16.0),
                                  elevation: 0,
                                  side: AppColors.colorState == 1 ? const BorderSide(color: Colors.blue, width: 2) : const BorderSide(color: Color.fromARGB(255, 163, 163, 163), width: 2),
                                ),
                                child: Container(),
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
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(), backgroundColor: Colors.black,
                                  padding: const EdgeInsets.all(16.0),
                                  elevation: 0,
                                  side: AppColors.colorState == 2 ? const BorderSide(color: Colors.blue, width: 2) : null,
                                ),
                                child: Container(),
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
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(), backgroundColor: Colors.orange[100],
                                  padding: const EdgeInsets.all(16.0),
                                  elevation: 0,
                                  side: AppColors.colorState == 3 ? const BorderSide(color: Colors.blue, width: 2) : null,
                                ),
                                child: Container(),
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
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              height: appbarSize,
                              child: Row(
                                children:[
                                  Infomation.sound ? const Icon(Icons.volume_up) : const Icon(Icons.volume_off),
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
                        _database.insertDB(Infomation.id, DateFormat.ms().format(Stopwatch.time), Infomation.init, Infomation.zero, Infomation.tmp, Infomation.specifiedX, Infomation.specifiedY, Infomation.kotae, Infomation.level, Infomation.sound);
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
                    InkWell(
                      onTap: () async {
                        final screenshot = await _screenShotController.capture(delay: const Duration(milliseconds: 10));

                        if (screenshot != null) {
                          // スクリーンショットをドキュメントディレクトリに保存
                          final documentDirectoryPath = await getApplicationDocumentsDirectory();
                          final imagePath = await File('${documentDirectoryPath.path}/screenshot.png').create();
                          await imagePath.writeAsBytes(screenshot);
                          // スクリーンショットとテキストをシェア
                          // ignore: deprecated_member_use
                          await Share.shareFiles([imagePath.path]);
                        }
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            SizedBox(
                              height: appbarSize,
                              child: Row(
                                children:[
                                  const Icon(Icons.share),
                                  //余白
                                  SizedBox(
                                    width: (screenSize.width) / 20,
                                  ),
                                  const Text('共有')
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
                  children: [
                    //余白
                    SizedBox(
                      height: (screenSize.height) * 0.05,
                    ),

                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          '難易度：${Infomation.level}',
                          style: TextStyle(
                            color: AppColors.isText,
                            fontSize: (screenSize.width) / 25,
                          ),
                        ),

                        SizedBox(
                          width: (screenSize.width) / 2,
                        ),
                      
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: _timeRunning
                            ? () {
                                setState(() {
                                  _timeRunning = !_timeRunning;
                                  _timer = !_timer;
                                });
                              }
                            : null,
                          child: _timeRunning ? Icon(LineIcons.pauseCircle, color: AppColors.isText) : Icon(Icons.play_arrow, color: AppColors.isText),
                        ),

                        
                        SizedBox(
                          width: (screenSize.width) / 60,
                        ),

                        //ストップウォッチ
                        Stopwatch(
                            isRunning: _timeRunning,
                        ),
                        const Spacer(),
                      ],
                    ),

                    //余白
                    SizedBox(
                      height: (screenSize.height) * 0.015,
                    ),

  //----------------------------------------------------------------------------------------------------------------------------------------
                    // 問題の盤面の上に候補の盤面を重ねて表示
                    Screenshot(
                      controller: _screenShotController,
                      child: Stack(
                      // Stack(
                        alignment: Alignment.center,
                        children: [
                          _isTappable
                            //メインの盤面
                            ? SudokuGrid(
                                  init: Infomation.init,  //問題用リスト(入力マスかどうか判定用)
                                  data: Infomation.zero,  //盤面全体の数字リスト
                                  all : Infomation.allAnswers, //全解答のリスト 
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
                            : skeletonFlag
                              ? SkeletonAnimation(
                                  child: InitGrid(
                                    data: Infomation.zero,  //盤面全体の数字リスト
                                    anim: Infomation.animation,   //最初のアニメーション用リスト
                                    specifiedX: Infomation.specifiedX, //問題マスx座標
                                    specifiedY: Infomation.specifiedY, //問題マスy座標
                                    initX: initX,   //アニメーション移動マスx座標
                                    initY: initY,   //アニメーション移動マスy座標
                                    animCell: cell, //問題の領域塗りつぶし判定
                                    showSkeleton: skeletonFlag,
                                  ),
                                )
                              : InitGrid(
                                    data: Infomation.zero,  //盤面全体の数字リスト
                                    anim: Infomation.animation,   //最初のアニメーション用リスト
                                    specifiedX: Infomation.specifiedX, //問題マスx座標
                                    specifiedY: Infomation.specifiedY, //問題マスy座標
                                    initX: initX,   //アニメーション移動マスx座標
                                    initY: initY,   //アニメーション移動マスy座標
                                    animCell: cell, //問題の領域塗りつぶし判定
                                    showSkeleton: skeletonFlag,
                                ),

                            // 候補の盤面
                            CandidateGrid(
                              candidate: Infomation.tmp,
                            ),
                        ],
                      ),
                    ),

  //----------------------------------------------------------------------------------------------------------------------------------------
                    // 余白
                    SizedBox(
                      height: (screenSize.width) / 13,
                    ),

                    // アイコンボタン
                    ControlButton(
                      onBack: () {
                        Infomation.sound ? _audio.play('button3.mp3') : null;
                        getHistory(setState);
                      },
                      
                      // 数字消すボタン
                      onTap: (int number) {
                        Infomation.sound ? _audio.play('button3.mp3') : null;
                        deleteNumber(setState, number);
                      },

                      // メモボタン
                      onEdit: isEdit,
                      onPress: () {
                        Infomation.sound ? _audio.play('button3.mp3') : null;
                        setState(() {
                          isEdit = !isEdit;
                        });
                      },
                    ),

                    // 余白
                    SizedBox(
                      height: (screenSize.width) / 13,
                    ),

                    // 数字ボタン
                    Numbers(
                      isPress: isEdit,
                      onTap: (int number) {
                        Infomation.sound ? _audio.play('button.mp3') : null;
                        controlNumber(setState, isEdit, number);
                      },
                    ),

                    // 余白
                    SizedBox(
                      height: (screenSize.width) / 15,
                    ),

                    //決定、答えボタン
                    ConfirmButton(
                      answer: Infomation.zero[Infomation.answerY][Infomation.answerX],
                      onAnswered: (isCorrect) {
                        if (isCorrect) {
                          setState(() {
                            _timeRunning = false;
                          });
                        }
                      },
                    ),
                    // 余白
                    SizedBox(
                      height: (screenSize.width) / 15,
                    ),
  //----------------------------------------------------------------------------------------------------------------------------------------
                    // AdWidget(
                    //   ad: AdmobHelper.getLargeBannerAd()..load(),
                    // ),
                    // AdWidget(ad: _bannerAd),
                    Expanded(
                      child: AdWidget(
                        ad: _bannerAd,
                      ),
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
              child: SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}
