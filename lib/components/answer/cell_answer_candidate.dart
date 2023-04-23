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
            Container(
              decoration: BoxDecoration(
                color: isVertical | isNum ? Colors.cyan : Colors.transparent,
                shape: BoxShape.rectangle,
              ),
              margin: EdgeInsets.symmetric(horizontal: screenSize.width / 80),
              width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 9 : ((screenSize.height) * 0.45 / 9) / 9,
              height: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 2 : ((screenSize.height) * 0.45 / 9) / 2,
            ),

            //横線
            Container(
              decoration: BoxDecoration(
                color: isHorizontal | isNum ? Colors.cyan : Colors.transparent,
                shape: BoxShape.rectangle,
              ),
              margin: EdgeInsets.symmetric(vertical: screenSize.width / 80),
              width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9)  : ((screenSize.height) * 0.45 / 9),
              height: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 9 : ((screenSize.height) * 0.45 / 9) / 9,
            ),

            //円(塗りつぶし)
            Container(
              decoration: BoxDecoration(
                color: isNum ? Colors.cyan : isFalse ? Colors.red : Colors.transparent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(100),
              ),
              width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 1.3 : ((screenSize.height) * 0.45 / 9) / 1.3,
              height: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 1.3 : ((screenSize.height) * 0.45 / 9) / 1.3,
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

            //✖

                  // Transform.rotate(
                  //   angle: 45 * math.pi / 180,
                  //   child: Container(
                  //     width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 1.3 : ((screenSize.height) * 0.45 / 9) / 1.3,
                  //     height: 5,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  // Transform.rotate(
                  //   angle: -45 * math.pi / 180,
                  //   child: Container(
                  //     width: (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 1.3 : ((screenSize.height) * 0.45 / 9) / 1.3,
                  //     height: 5,
                  //     color: Colors.red,
                  //   ),
                  // ),
                ],
              ),
            // ),
          // ],
        )
    );
  }
}

// class LinePainter extends CustomPainter {
//   final bool isNum;

//   LinePainter({required this.isNum});

//   @override
//   void paint(Canvas canvas, Size size) {
//     if (isNum) {
//       Paint paint = Paint()
//         ..color = Colors.red
//         ..strokeWidth = 2;

//       canvas.drawLine(
//         Offset(0, size.height / 2),
//         Offset(size.width, size.height / 2),
//         paint,
//       );
//     }
//   }

//   @override
//   bool shouldRepaint(LinePainter oldDelegate) {
//     return oldDelegate.isNum != isNum;
//   }
// }
