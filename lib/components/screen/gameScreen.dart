/*
****************************************
機能：anumberを解く時のメインページ
IN：問題、解答、ヒント
OUT：ゲーム画面
----------------------------------------
履歴：
****************************************
*/
import 'package:anumber/components/button/confirmButton.dart';
import 'package:anumber/components/board/grid_candidate.dart';
import 'package:anumber/question.dart';
import 'package:flutter/material.dart';
import 'package:anumber/components/board/grid.dart';
import 'package:anumber/components/button/numbers.dart';
import 'dart:async';

class Sudoku extends StatefulWidget {
  const Sudoku({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<Sudoku> with WidgetsBindingObserver {
  late Timer _timer;
  late DateTime _time;

  @override
  void initState() {
    super.initState();
    _time = DateTime.utc(0, 0, 0);
    getdata();
    WidgetsBinding.instance.addObserver(this);
  }

  getdata() async {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        setState(() {
          _time = _time.add(const Duration(seconds: 1));
        });
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("state = $state");
    if (state == AppLifecycleState.paused) {
      // バックグラウンドに遷移した時
      setState(_handleOnPaused);
    } else if (state == AppLifecycleState.resumed) {
      // フォアグラウンドに復帰した時
      setState(_handleOnResumed);
    }
  }

  /// アプリがバックグラウンドに遷移した際のハンドラ
  void _handleOnPaused() {
    if (_timer.isActive) {
      _timer.cancel(); // タイマーを停止する
    }
  }

  /// アプリがフォアグラウンドに復帰した際のハンドラ
  void _handleOnResumed() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        setState(() {
          _time = _time.add(const Duration(seconds: 1));
        });
      },
    );
  }

  // バナー広告をインスタンス化
  // final BannerAd myBanner = BannerAd(
  //   adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  //   size: AdSize.banner,
  //   request: AdRequest(),
  //   listener: BannerAdListener(),
  // )..load();

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
                      '初級',
                      style: TextStyle(
                        fontSize: (screenSize.width) / 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: (screenSize.width) / 25),
                    child: const Icon(Icons.timer),
                  ),
                ],
                // mainAxisAlignment: MainAxisAlignment.end,
                // children: <Widget>[
                //   Icon(Icons.timer),
                //   Text(DateFormat.ms().format(_time), style: TextStyle(fontSize: 15,)),
                //   Container(
                //     padding: EdgeInsets.only(
                //       right: rpx(context, 70.0),
                //     ),
                //   ),
                // ],
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
                        Data.data[Data.selectedY][Data.selectedX] == 0) {
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
                        Data.data[Data.selectedY][Data.selectedX] = number;
                        Data.tmp[3 * Data.selectedY][3 * Data.selectedX] = 0;
                        Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 1] = 0;
                        Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 2] = 0;
                        Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX] = 0;
                        Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 1] = 0;
                        Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 2] = 0;
                        Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX] = 0;
                        Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 1] = 0;
                        Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 2] = 0;
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
