// /*
// ****************************************
// 機能：問題のリストを左上から順番に処理する
// IN：問題、選択マス
// OUT：・問題の数字
//      ・入力された数字かどうかの判定結果
// 　　 ・領域の判定結果
//      ・指定マスの判定結果
//      ・問題のリストx,yの座標
// 　　 ・候補判定フラグ
// ----------------------------------------
// 履歴：
// ****************************************
// */
// import 'package:anumber/components/answer/cell_answer.dart';
// import 'package:anumber/infomation.dart';
// import 'package:flutter/material.dart';
// import 'package:anumber/components/board/cell.dart';

// import 'illustrated.dart';


// class AnswerGrid extends StatelessWidget {
//   const AnswerGrid({
//     super.key,
//     required this.data,
//     required this.init,
//     required this.anim,
//     required this.selectedX,
//     required this.selectedY,
//     required this.specifiedX,
//     required this.specifiedY,
//     required this.initX0,
//     required this.initY0,
//     required this.initX1,
//     required this.initY1,
//     required this.initX2,
//     required this.initY2,
//     required this.initX3,
//     required this.initY3,
//     required this.initX4,
//     required this.initY4,
//     required this.borderListX,
//     required this.borderListY,
//   });
//   final List<List<int>> data;
//   final List<List<int>> init;
//   final List<List<int>> anim;
//   final int selectedX;
//   final int selectedY;
//   final int specifiedX;
//   final int specifiedY;
//   final int initX0;
//   final int initY0;
//   final int initX1;
//   final int initY1;
//   final int initX2;
//   final int initY2;
//   final int initX3;
//   final int initY3;
//   final int initX4;
//   final int initY4;
//   final List<int> borderListX;
//   final List<int> borderListY;
//   static int blockX1 = 0;
//   static int blockY1 = 0;
//   static int blockX2 = 0;
//   static int blockY2 = 0;
//   static int blockX3 = 0;
//   static int blockY3 = 0;
//   static int blockX4 = 0;
//   static int blockY4 = 0;


//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (final MapEntry<int, List<int>> r in data.asMap().entries)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               for (final MapEntry<int, int> c in r.value.asMap().entries)
//                 AnswerPaint(
//                   x: c.key,
//                   y: r.key,
//                   // onTap: () => onTap(c.key, r.key),
//                 ),
//             ],
//           ),
//       ],
//     );
//   }
// }