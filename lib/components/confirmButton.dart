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
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:anumber/playGame.dart';


class ConfirmButton extends StatelessWidget {
  ConfirmButton({
    super.key,
    required this.answer,
  });
  final int answer;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //決定(答え判定)ボタン
        SizedBox(
          height: (screenSize.width) / 10,
          width: (screenSize.width) / 4,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {
              if (answer == 9) {
                AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  animType: AnimType.SCALE,
                  //title: 'INFO',
                  dialogType: DialogType.SUCCES,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Sudoku(), 
                      ),
                    );
                  },
                  btnOkColor: Colors.blueAccent,
                  btnCancelText: "解説",
                  btnCancelOnPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Sudoku(), 
                      ),
                    );
                  },
                  btnCancelColor: Colors.blueAccent,
                ).show();
              } else {
                AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  animType: AnimType.SCALE,
                  //title: 'INFO',
                  dialogType: DialogType.ERROR,
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
                        builder: (context) => const Sudoku(), 
                      ),
                    );
                  },
                  btnOkColor: Colors.blueAccent,
                  btnCancelText: "閉じる",
                  btnCancelOnPress: () {},
                  btnCancelColor: Colors.blueAccent,
                ).show();
              }
            },
            child: Text(
              '決定',
              style: TextStyle(
                fontSize: (screenSize.width) /18,
                color: Colors.white,
              ),
            ),
          ),
        ),


        //解答ボタン
        SizedBox(
          height: (screenSize.width) / 10,
          width: (screenSize.width) / 4,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('解答'),
                    content: const Text('解答を表示します。よろしいですか？'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("OK", style: TextStyle(color: Colors.blue),),
                        onPressed: () => Navigator.pop(context),
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
              '解答',
              style: TextStyle(
                fontSize: (screenSize.width) /18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
