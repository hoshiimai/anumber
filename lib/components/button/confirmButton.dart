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
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:anumber/components/screen/gameScreen.dart';


class ConfirmButton extends StatelessWidget {
  ConfirmButton({
    super.key,
    required this.answer,
  });
  final int answer;
  final _audio = AudioCache();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var fontsize = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) *0.618 : ((screenSize.height) * 0.45 / 9) *0.618;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //決定(答え判定)ボタン
        SizedBox(
          height: fontsize * 1.618,
          width: fontsize * 3.82,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.transparent,
              elevation: 3,
              shadowColor: Colors.grey[50],
              shape: RoundedRectangleBorder(
                // side: BorderSide(color: Color.fromARGB(255, 2, 67, 189), width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // style: ElevatedButton.styleFrom(
            //   primary: Colors.blue[900],
            //   onPrimary: Colors.purple,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(6),
            //   ),
            // ),
            onPressed: () async {
              if (answer == Infomation.kotae) {
                AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  animType: AnimType.scale,
                  //title: 'INFO',
                  dialogType: DialogType.success,
                  //borderSide: BorderSide(color: Colors.green, width: 2),
                  body: const Center(
                    child: Text(
                      '正解！',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      //style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  title: 'This is Ignored',
                  desc: 'This is also Ignored',
                  btnOkText: "次の問題",
                  btnOkOnPress: () {
                    // MakeQuestion().getExcelValue();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sudoku(level: "",), 
                      ),
                    );
                  },
                  btnOkColor: Colors.blueAccent,
                  btnCancelText: "解説",
                  btnCancelOnPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sudoku(level: "",), 
                      ),
                    );
                  },
                  btnCancelColor: Colors.blueAccent,
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
                      ),
                      //style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  btnOkText: "解説",
                  btnOkOnPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sudoku(level: "",), 
                      ),
                    );
                  },
                  btnOkColor: Colors.blueAccent,
                  btnCancelText: "閉じる",
                  btnCancelOnPress: () {},
                  btnCancelColor: Colors.blueAccent,
                ).show();
                await Future.delayed(const Duration(milliseconds: 700));
                Infomation.sound ? _audio.play('incorrect.mp3') : null;
              }
            },
            child: Text(
              '決定',
              style: TextStyle(
                fontSize: fontsize,
                color: Colors.blue[900],
              ),
            ),
          ),
        ),


        //解答ボタン
        SizedBox(
          height: fontsize * 1.618,
          width: fontsize * 3.82,
          child: ElevatedButton(
            // style: ElevatedButton.styleFrom(
            //   primary: Colors.blue[900],
            //   onPrimary: Colors.purple,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(6),
            //   ),
            // ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.transparent,
              elevation: 3,
              shadowColor: Colors.grey[50],
              shape: RoundedRectangleBorder(
                // side: BorderSide(color: Color.fromARGB(255, 2, 67, 189), width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            // style: ElevatedButton.styleFrom(
            //   primary: Colors.transparent,
            //   onPrimary: Colors.transparent,
            //   shape: RoundedRectangleBorder(
            //     side: BorderSide(color: Colors.blue[900], width: 2),
            //     borderRadius: BorderRadius.circular(6),
            //   ),
            // ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('答え'),
                    content: const Text('解答を表示します。よろしいですか？'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("OK", style: TextStyle(color: Colors.blue),),
                        onPressed: () => Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) => 
                            AnswerScreen(), 
                            transitionDuration: Duration(seconds: 0),
                          ),
                        ),
                      ),
                      TextButton(
                        child: const Text("キャンセル", style: TextStyle(color: Colors.blue),),
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
                fontSize: fontsize,
                color: Colors.blue[900],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
