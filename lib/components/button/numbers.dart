/*
****************************************
機能：アイコンボタン押下時にイベント発火
IN：ボタン押下アクション
OUT：入力マスに0を入れる
----------------------------------------
履歴：
****************************************
*/
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../infomation.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => onBack(),
          child: const Icon(Icons.undo, size: 30.0),
        ),
        GestureDetector(
          onTap: () => onTap(0),
          child: const Icon(Icons.auto_fix_high_outlined, size: 30.0),
        ),
        GestureDetector(
          onTap: () => onPress(),
          child: const Icon(Icons.mode_edit_outline, size: 30.0),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (final int i in numberTexts) _number(i),
      ],
    );
  }

//数字入力ボタン
  Widget _number(int number) {
    return GestureDetector(
      onTap: () => onTap(number),
      child: Text(
        number.toString(),
        style: TextStyle(
          color: isPress ? Colors.blueGrey : Colors.blue[900],
          fontSize: 40,
          fontWeight: FontWeight.w300
        ),
      ),
    );
  }

  //数字入力ボタン(候補用)
  Widget _candidate(int number) {
    return GestureDetector(
      onTap: () => onTap(number),
      child: Text(
        number.toString(),
        style: const TextStyle(
          color: Colors.blueGrey,
          fontSize: 35,
        ),
      ),
    );
  }
}
