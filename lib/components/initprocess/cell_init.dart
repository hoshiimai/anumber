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


class Init extends StatelessWidget {
  const Init({
    super.key,
    required this.number,
    required this.x,
    required this.y,
    // required this.onTap,
    // required this.inputNum,
    // required this.isSelected,
    required this.isInit,
    required this.isCell,
    // required this.isSameLine,
    // required this.isBlock1,
    // required this.isBlock2,
    // required this.isBlock3,
    // required this.isBlock4,
    required this.isLeft,
    required this.isRight,
    required this.isTop,
    required this.isBottom, 
    // required this.inputNum,
    // required this.isTime, required this.inputNum,
  });
  final int number;
  final int x;
  final int y;
  // final Function() onTap;
  // final bool inputNum;
  // final bool isSelected;
  final bool isInit;
  final bool isCell;
  // final bool isSameLine;
  // final bool isBlock1;
  // final bool isBlock2;
  // final bool isBlock3;
  // final bool isBlock4;
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
        width: (screenSize.width)/9.5,
        height: (screenSize.width)/9.5,

        child: Container(
          decoration: BoxDecoration(
            // 盤面の色設定
            color
              // : isSelected // 選択マスかどうか
              // ? Colors.blue[100]
              : isInit // 最初のアニメーション
              ? Colors.blue[100]
              : isCell // 選択マスの領域(ブロック)かどうか
              ? const Color.fromARGB(255, 241, 241, 241)
              // : isBlock1 // 選択マスの領域(ブロック)かどうか
              // ? const Color.fromARGB(255, 241, 241, 241)
              // : isBlock2 // 選択マスの領域(ブロック)かどうか
              // ? const Color.fromARGB(255, 241, 241, 241)
              // : isBlock3 // 選択マスの領域(ブロック)かどうか
              // ? const Color.fromARGB(255, 241, 241, 241)
              // : isBlock4 // 選択マスの領域(ブロック)かどうか
              // ? const Color.fromARGB(255, 241, 241, 241)
              // : isSameLine // 選択マスの領域(行列)かどうか
              // ? const Color.fromARGB(255, 241, 241, 241)
              : Colors.white, // 標準の色

            // 盤面の枠線描画                
            border: Border(
              left: BorderSide(
                color: isLeft ? Colors.red : Colors.black,
                width: (x % 3 == 0 || isLeft) ? 2 : 0,
              ),
              right: BorderSide(
                color: isRight ? Colors.red : Colors.black,
                width: (x == 8 || isRight) ? 2 : 0,
              ),
              top: BorderSide(
                color: isTop ? Colors.red : Colors.black,
                width: (y % 3 == 0 || isTop) ? 2 : 0,
              ),
              bottom: BorderSide(
                color: isBottom ? Colors.red : Colors.black,
                width: (y == 8 || isBottom) ? 2 : 0,
              ),
            ),
          ),

          // 表示する数字を描画
          child: Center(
            child: Text(
              // 空のマスには0が設定されるため、0の時は消す、それ以外は描画
              number == 0 ? '' : number.toString(),
              style: TextStyle(
                // 問題の数字か、入力された数字かで色分け
                color: Colors.black,
                fontSize: (screenSize.width)*7/95
              ),
            ),
          ),
        ),
      ),
    );
  }
}
