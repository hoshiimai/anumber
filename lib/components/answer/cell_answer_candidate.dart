/*
****************************************
機能：候補の数字描画
IN：候補の数字
OUT：候補の数字(描画)
----------------------------------------
履歴：
****************************************
*/
import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnswerCandidate extends StatelessWidget {
  const AnswerCandidate({
    super.key,
    required this.number,
    required this.isNum,
    required this.isCell,
    // required this.isVertical,
    // required this.isHorizontal,
    required this.isFalse,
    // required this.isPaint,
    required this.x,
    required this.y,
    // required this.count,
    // required this.endPoint,
  });
  final int number;
  final bool isNum;
  final bool isCell;
  // final bool isVertical;
  // final bool isHorizontal;
  final bool isFalse;
  // final bool isPaint;
  final int x;
  final int y;
  // final int count;
  // final List<List<int>> endPoint;


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var wi = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 3 : ((screenSize.height) * 0.45 / 9) / 3;
    var he = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 3 : ((screenSize.height) * 0.45 / 9) / 3;
    return Container(
      width: wi,
      height: he,
      child: Center(
        child: Stack(
          children: [
            // 円(塗りつぶし)
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: isNum ? Colors.cyan[600] : isFalse ? Colors.red : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            //候補数字
            Center(
              child: Text(
                number == 0 ? '' : number.toString(),
                style: TextStyle(
                  color:  isCell ? Colors.red 
                                : isNum || isFalse
                                ?Colors.white
                                : Colors.grey[600],
                  fontFamily: "Nunito",
                  fontWeight: isCell ? FontWeight.bold : null, 
                  fontSize: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? (((screenSize.width) * 0.97 / 9) *0.71)/2.75 : (((screenSize.height) * 0.45 / 9) *0.71)/2.75,
                ),
              ),
            )
          ],
        )
      )
    );
  }
}