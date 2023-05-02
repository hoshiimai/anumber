/*
****************************************
機能：候補の数字描画
IN：候補の数字
OUT：候補の数字(描画)
----------------------------------------
履歴：
****************************************
*/
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnswerCandidat extends StatelessWidget {
  const AnswerCandidat({
    super.key,
    required this.number,
    required this.isNum,
    required this.isVertical,
    required this.isHorizontal,
    required this.isFalse,
    required this.x,
    required this.y
  });
  final int number;
  final bool isNum;
  final bool isVertical;
  final bool isHorizontal;
  final bool isFalse;
  final int x;
  final int y;


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 3 : ((screenSize.height) * 0.45 / 9) / 3,
      height: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 3 : ((screenSize.height) * 0.45 / 9) / 3,
      child: Center(
        child: Stack(
          children: [
            //縦線
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: isVertical | isNum ? Colors.cyan : Colors.transparent,
                  shape: BoxShape.rectangle,
                ),
                // margin: EdgeInsets.symmetric(horizontal: screenSize.width / 80),
                width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 9 : ((screenSize.height) * 0.45 / 9) / 9,
                height: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 2 : ((screenSize.height) * 0.45 / 9) / 2,
              ),
            ),

            //横線
            Center(
              child : Container(
                decoration: BoxDecoration(
                  color: isHorizontal | isNum ? Colors.cyan : Colors.transparent,
                  shape: BoxShape.rectangle,
                ),
                // margin: EdgeInsets.symmetric(vertical: screenSize.width / 80),
                width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9)  : ((screenSize.height) * 0.45 / 9),
                height: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 9 : ((screenSize.height) * 0.45 / 9) / 9,
              ),
            ),

            //円(塗りつぶし)
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: isNum ? Colors.cyan : isFalse ? Colors.red : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 1.3 : ((screenSize.height) * 0.45 / 9) / 1.3,
                height: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 1.3 : ((screenSize.height) * 0.45 / 9) / 1.3,
              ),
            ),
            

            Center(
              child: CustomPaint(
                painter: isFalse ? _LinePainter(
                  x: x,
                  y: y,
                ) : null,
              ),
            ),

            //候補数字
            Center(
              child: Text(
                number == 0 ? '' : number.toString(),
                style: TextStyle(
                  color:  Colors.white,
                  fontFamily: "Nunito",
                  fontSize: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? (((screenSize.width) * 0.97 / 9) *0.71)/2.5 : (((screenSize.height) * 0.45 / 9) *0.71)/2.5,
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}

class _LinePainter extends CustomPainter {
  final int x;
  final int y;

  _LinePainter({required this.x, required this.y});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, 0),
      Offset(144 + 10, 400),
      // Offset(99, 99),
      Paint()
        ..color = const Color(0xFF3f51b5)
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}