/*
****************************************
機能：・数字、マスの描画
　　　・色の設定
IN：盤面の数字、grid.dartの判定結果
OUI：・問題の数字(描画)
     ・盤面の枠線
     ・マスの塗りつぶし
----------------------------------------
履歴：
****************************************
*/

import 'package:flutter/material.dart';

class Illustration extends CustomPainter {
  Illustration({
    // super.key,
    required this.x,
    required this.y,
    required this.flag,
  });
  final int x;
  final int y;
  final bool flag;

  @override
  void paint(Canvas canvas, Size size) {
    if (flag) {
      // 円を描画する
      final paint = Paint()
        ..color = Colors.red
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width / 2 * 0.9,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(Illustration old) => old.flag != flag;

  @override
  bool hitTest(Offset position) {
    final radius = 50 / 2;
    return (position.dx - radius).abs() + (position.dy - radius).abs() < radius;
  }
}

// class Illustration extends StatelessWidget {
//   const Illustration({
//     super.key,
//     // required this.number,
//     required this.x,
//     required this.y,
//     required this.onTap,
//     required this.circle,
//   });
//   // final int number;
//   final double x;
//   final double y;
//   final Function() onTap;
//   final bool circle;

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return GestureDetector(
//       onTap: onTap,
//       child: SizedBox(
//         // 盤面のサイズ(一マスのサイズを指定)
//         width: (screenSize.width) / 9.5,
//         height: (screenSize.width) / 9.5,

//         child: Container(
//           width: x + 0.5,
//           decoration: BoxDecoration(
//             shape: circle ? BoxShape.circle : BoxShape.rectangle,
//             border: circle
//                 ? Border.all(
//                     color: circle ? Colors.red : Colors.transparent,
//                     width: circle ? 3 : 0,
//                     // width: ((x  == 0 && 4>= y && y>= 1) || circle) ? 3 : 0,
//                   )
//                 : Border(
//                     left: BorderSide(
//                       color: Colors.red,
//                     // color: circle ? Colors.red : Colors.transparent,
//                       // width: (x == 1.5 && 4 >= y && y >= 1) ? 3 : 0,
//                       width: x == 1.5 ? 3 : 0,
//                     ),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
