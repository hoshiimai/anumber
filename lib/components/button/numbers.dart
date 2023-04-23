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
import 'package:line_icons/line_icons.dart';


class ControlButton extends StatelessWidget {
  ControlButton({
    super.key,
    required this.onTap,
    required this.onPress,
    required this.onBack,
    required this.onEdit,
  });
  final Function(int number) onTap;
  final Function() onPress;
  final Function() onBack;
  final bool onEdit;


  @override
  Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  var iconsize = ((screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) *0.71 : ((screenSize.height) * 0.45 / 9) *0.71);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => onBack(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LineIcons.alternateUndo, size: iconsize, color: AppColors.isText),
              Text('元に戻す', style: TextStyle(fontSize: iconsize *0.4, color: AppColors.isText)),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => onTap(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LineIcons.eraser, size: iconsize, color: AppColors.isText),
              Text('消す', style: TextStyle(fontSize: iconsize *0.4, color: AppColors.isText)),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => onPress(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LineIcons.pen, size: iconsize, color: AppColors.isText),
              Text(onEdit ? 'メモ OFF' : 'メモ ON', style: TextStyle(fontSize: iconsize *0.4, color: AppColors.isText)),
            ],
          ),
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
          fontFamily: "Nunito",
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
