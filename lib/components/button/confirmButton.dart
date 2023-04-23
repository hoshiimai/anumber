/*
****************************************
機能：決定、解答ボタン
IN：入力された数字
OUT：・ヒントの表示
　　 ・答えの判定結果
　　 ・解答解説の表示 
----------------------------------------
履歴：
****************************************
*/
import 'package:anumber/components/screen/answerScreen.dart';
import 'package:anumber/infomation.dart';
import 'package:anumber/makeQuestion.dart';
import 'package:anumber/style/theme_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:anumber/components/screen/gameScreen.dart';
import 'package:anumber/components/stopwatch/stop_watch.dart';



class ConfirmButton extends StatelessWidget {
  ConfirmButton({
    super.key,
    required this.answer,
    required this.tmpLevel,
    required this.onAnswered,
  });
  final int answer;
  final String tmpLevel;
  final Function(bool isCorrect) onAnswered;
  final _audio = AudioCache();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var fontsize = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) *0.68 : ((screenSize.height) * 0.45 / 9) *0.68;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //決定(答え判定)ボタン
        SizedBox(
          height: (screenSize.width) / 20 * 2.1,
          width: (screenSize.width) / 20 * 4.6,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: AppColors.isConfirmButton,
              onPrimary: Colors.transparent,
              elevation: 3,
              // shadowColor: Colors.grey[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: AppColors.isButtonLine, width: 0.2),
              ),
            ),
            onPressed: () async {
              if (answer == Infomation.kotae) {
                onAnswered(true); // コールバック関数を呼び出す
                AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  animType: AnimType.scale,
                  dialogType: DialogType.success,
                  body: const Center(
                    child: Text(
                      '正解！',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Noto Sans JP"
                      ),
                      //style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  title: 'This is Ignored',
                  desc: 'This is also Ignored',
                  btnOkText: "次の問題",
                  btnOkOnPress: () async {
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
                    
                    await MakeQuestion().getExcelValue();
                    // String resultLevel = Database().selectLevel();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Sudoku(level: tmpLevel, initFlag: true, isResume: false,)),
                      (Route<dynamic> route) => false,
                    );
                  },
                  btnOkColor: Colors.blue[900],
                  btnCancelText: "解説",
                  buttonsTextStyle: const TextStyle(fontFamily: "Noto Sans JP"),
                  btnCancelOnPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnswerScreen(level: tmpLevel), 
                      ),
                    );
                  },
                  btnCancelColor: Colors.blue[900],
                ).show();
                await Future.delayed(const Duration(milliseconds: 600));
                Infomation.sound ? _audio.play('correct.mp3') : null;
              } else {
                AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  animType: AnimType.scale,
                  //title: 'INFO',
                  dialogType: DialogType.error,
                  body: const Center(
                    child: Text(
                      '残念',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Noto Sans JP"
                      ),
                      //style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  btnOkText: "答え",
                  btnOkOnPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnswerScreen(level: tmpLevel), 
                      ),
                    );
                  },
                  btnOkColor: Colors.blue[900],
                  btnCancelText: "閉じる",
                  btnCancelOnPress: () {},
                  btnCancelColor: Colors.blue[900],
                  buttonsTextStyle: const TextStyle(fontFamily: "Noto Sans JP")
                ).show();
                await Future.delayed(const Duration(milliseconds: 700));
                Infomation.sound ? _audio.play('incorrect.mp3') : null;
              }
            },
            child: Text(
              '決定',
              style: TextStyle(
                fontSize: (screenSize.width) / 20,
                color: AppColors.isButtonText,
              ),
            ),
          ),
        ),


        //答えボタン
        SizedBox(
          height: (screenSize.width) / 20 * 2.1,
          width: (screenSize.width) / 20 * 4.6,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.isConfirmButton,
              onPrimary: Colors.transparent,
              elevation: 3,
              // shadowColor: Colors.grey[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: AppColors.isButtonLine, width: 0.2),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('答え'),
                    content: const Text('答えを表示します。よろしいですか？'),
                    actions: <Widget>[
                      TextButton(
                        child: Text("OK", style: TextStyle(color: Colors.blue[900], fontFamily: "Noto Sans JP"),),
                        onPressed: () {
                          onAnswered(true); // コールバック関数を呼び出す
                          Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => AnswerScreen(level: tmpLevel),
                            transitionDuration: Duration(seconds: 0),
                          ),
                         );
                        }
                      ),
                      TextButton(
                        child: Text("キャンセル", style: TextStyle(color: Colors.blue[900], fontFamily: "Noto Sans JP"),),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              '答え',
              style: TextStyle(
                fontSize: (screenSize.width) / 20,
                color: AppColors.isButtonText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
