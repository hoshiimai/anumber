/*
****************************************
機能：・数字、マスの描画
　　　・色の設定
IN：盤面の数字、grid.dartの判定結果
OUT：・問題の数字(描画)
     ・盤面の枠線
     ・マスの塗りつぶし
----------------------------------------
履歴：
****************************************
*/
import 'package:flutter/material.dart';

import '../../style/theme_controller.dart';


class Answer extends StatelessWidget {
  const Answer({
    super.key,
    required this.number,
    required this.x,
    required this.y,
    // required this.onTap,
    required this.inputNum,
    required this.isSelected,
    // required this.isInit,
    required this.isCell,
    required this.isSameLine,
    required this.isAnswerRow,
    required this.isAnswerColumn,
    required this.isBlock1,
    required this.isBlock2,
    required this.isBlock3,
    required this.isBlock4,
    required this.isLeft,
    required this.isRight,
    required this.isTop,
    required this.isBottom,
    // required this.isTime,
  });
  final int number;
  final int x;
  final int y;
  // final Function() onTap;
  final bool inputNum;
  final bool isSelected;
  // final bool isInit;
  final bool isCell;
  final bool isSameLine;
  final bool isAnswerRow;
  final bool isAnswerColumn;
  final bool isBlock1;
  final bool isBlock2;
  final bool isBlock3;
  final bool isBlock4;
  final bool isLeft;
  final bool isRight;
  final bool isTop;
  final bool isBottom;
  // final bool isTime;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      // onTap: onTap,
      child: SizedBox(
        // 盤面のサイズ(一マスのサイズを指定)
        width: (screenSize.width) * 0.98 / 9 < (screenSize.height) * 0.46 / 9 ? (screenSize.width) * 0.98 / 9 : (screenSize.height) * 0.46 /9,
        height:(screenSize.width) * 0.98 / 9 < (screenSize.height) * 0.46 / 9 ? (screenSize.width) * 0.98 / 9 : (screenSize.height) * 0.46 /9,

        child: Container(
          decoration: BoxDecoration(
                        // 盤面の枠線描画                
            border: Border(
              left: BorderSide(
                color: isLeft ? Colors.red : AppColors.isLine,
                width: (x % 3 == 0 || isLeft) ? 2 : 0,
              ),
              right: BorderSide(
                color: isRight ? Colors.red : AppColors.isLine,
                width: (x == 8 || isRight) ? 2 : 0,
              ),
              top: BorderSide(
                color: isTop ? Colors.red : AppColors.isLine,
                width: (y % 3 == 0 || isTop) ? 2 : 0,
              ),
              bottom: BorderSide(
                color: isBottom ? Colors.red : AppColors.isLine,
                width: (y == 8 || isBottom) ? 2 : 0,
              ),
            ),
            // 盤面の色設定
            color
              : isAnswerRow
              ? Colors.blueGrey[100]
              // ? Color.fromARGB(255, 55, 65, 71)
              : isAnswerColumn
              ? Colors.blueGrey[100]
              // ? Color.fromARGB(255, 55, 65, 71)
              : isSelected // 選択マスかどうか
              ? AppColors.isSelect
              // : isBlock1 // 選択マスの領域(ブロック)かどうか
              // ? AppColors.isBlock
              // : isBlock2 // 選択マスの領域(ブロック)かどうか
              // ? AppColors.isBlock
              // : isBlock3 // 選択マスの領域(ブロック)かどうか
              // ? AppColors.isBlock
              // : isBlock4 // 選択マスの領域(ブロック)かどうか
              // ? AppColors.isBlock
              // : isSameLine // 選択マスの領域(行列)かどうか
              // ? AppColors.isBlock
              : AppColors.isOther, // 標準の色


          ),

          // 表示する数字を描画
          // child: Center(
          //   // child: AnimatedDefaultTextStyle(
          //     // duration: Duration(milliseconds: 30),
          //     child: style: TextStyle(
          //       color: isCell ? Colors.red : (inputNum ? Colors.blue[900] : Colors.black),
          //       fontSize: isCell ? (screenSize.width) * 10 / 95 : (screenSize.width) * 7 / 95,
          //       // fontWeight: isCell ? FontWeight.bold : FontWeight.normal,
          //     ),
          //     child: Text(
          //       number == 0  ? '' : number.toString(),
          //     ),
            // ),
          // 表示する数字を描画
          child: Center(
            child: Text(
              // 空のマスには0が設定されるため、0の時は消す、それ以外は描画
              number == 0 ? '' : number.toString(),
              style: TextStyle(
                // 問題の数字か、入力された数字かで色分け
                color: isCell ? Colors.red : (inputNum ? AppColors.isInput : AppColors.isText),
                fontSize: (screenSize.width) * 7 / 95,
                // fontSize: isCell ? (screenSize.width) * 10 / 95 : (screenSize.width) * 7 / 95,
              ),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
