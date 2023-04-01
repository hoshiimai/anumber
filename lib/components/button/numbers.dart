/*
****************************************
機能：アイコンボタン押下時にイベント発火
IN：ボタン押下アクション
OUT：入力マスに0を入れる
----------------------------------------
履歴：
****************************************
*/
import 'package:anumber/style/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';


class ControlButton extends StatelessWidget {
  ControlButton({
    super.key,
    required this.onTap,
    required this.onPress,
    required this.onBack,
  });
  final Function(int number) onTap;
  final Function() onPress;
  final Function() onBack;


  @override
  Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  var iconsize = ((screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) *0.71 : ((screenSize.height) * 0.45 / 9) *0.71);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => onBack(),
          child: Icon(LineIcons.alternateUndo, size: iconsize, color: AppColors.isText, semanticLabel: '元に戻る'),
        ),
        GestureDetector(
          onTap: () => onTap(0),
          child: Icon(LineIcons.eraser, size: iconsize, color: AppColors.isText, semanticLabel: '消す'),
        ),
        GestureDetector(
          onTap: () => onPress(),
          child: Icon(LineIcons.pen, size: iconsize, color: AppColors.isText,  semanticLabel: 'メモ'),
        ),
      ],
    );
  }
}


/*
***********************************************************
機能：数字ボタン押下時にイベント発火
　　　・候補入力ボタン押下時は、数字ボタンの状態を変化させる
IN：ボタン押下アクション、候補入力フラグ
OUT：入力マスに選択した数字を数字を入れる
-----------------------------------------------------------
履歴：
***********************************************************
*/
class Numbers extends StatelessWidget {
  Numbers({
    super.key,
    required this.onTap,
    required this.isPress,
  });
  final Function(int number) onTap;
  final bool isPress;
  final List<int> numberTexts = [1, 2, 3, 4, 5, 6, 7, 8, 9];


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (final int i in numberTexts) _number(i, screenSize),
      ],
    );
  }

//数字入力ボタン
  Widget _number(int number , Size screenSize) {
    var fontsize = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) *0.71 *1.26 : ((screenSize.height) * 0.45 / 9) *0.71 *1.26;
    return GestureDetector(
      onTap: () => onTap(number),
      child: Text(
        number.toString(),
        style: TextStyle(
          color: isPress ? Colors.blueGrey : AppColors.isInput,
          fontSize: fontsize,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }

  //数字入力ボタン(候補用)
  // Widget _candidate(int number) {
  //   return GestureDetector(
  //     onTap: () => onTap(number),
  //     child: Text(
  //       number.toString(),
  //       style: const TextStyle(
  //         color: Colors.blueGrey,
  //         fontSize: 35,
  //       ),
  //     ),
  //   );
  // }
}
