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
import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';

import '../../style/theme_controller.dart';


class AnswerCLB extends StatelessWidget {
  const AnswerCLB({
    super.key,
    required this.isFrameLeft,
    required this.isFrameRight,
    required this.isFrameTop,
    required this.isFrameBottom,
  });
  final bool isFrameLeft;
  final bool isFrameRight;
  final bool isFrameTop;
  final bool isFrameBottom;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      // onTap: onTap,
      child: SizedBox(
        // 盤面のサイズ(一マスのサイズを指定)
        width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? (screenSize.width) * 0.97 / 9 : (screenSize.height) * 0.45 /9,
        height:(screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? (screenSize.width) * 0.97 / 9 : (screenSize.height) * 0.45 /9,

        child: Container(
          decoration: BoxDecoration(
                        // 盤面の枠線描画                
            border: Border(
              left: BorderSide(
                color: isFrameLeft ? Colors.greenAccent
                                   : Colors.transparent,
                width: isFrameLeft ? 5
                                   : 0,
              ),
              right: BorderSide(
                color: isFrameRight ? Colors.greenAccent
                                    : Colors.transparent,
                width: isFrameRight ? 5
                                    : 0,
              ),
              top: BorderSide(
                color: isFrameTop ? Colors.greenAccent
                                  : AppColors.isLine,
                width: isFrameTop ? 5
                                  : 0,
              ),
              bottom: BorderSide(
                color: isFrameBottom ? Colors.greenAccent
                                     : AppColors.isLine,
                width: isFrameBottom ? 5
                                     : 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
