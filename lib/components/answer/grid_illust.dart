// /*
// ****************************************
// 機能：候補のリストを左上から順番に処理する
// IN：候補のリスト
// OUT：候補の数字
// ----------------------------------------
// 履歴：
// ****************************************
// */

// // import 'package:anumber/components/answer/illustrated.dart';
// import 'package:flutter/material.dart';

// // import 'illustrated.dart';

// import '../../sudoku.dart';

// class IllustratGrid extends StatelessWidget {
//   const IllustratGrid({
//     super.key,
//     required this.ans,
//     required this.onTap,

//   });
//   final List<List<int>> ans;
//   final Function(int x, int y) onTap;


//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (final MapEntry<int, List<int>> r in ans.asMap().entries)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               for (final MapEntry<int, int> c in r.value.asMap().entries)
//                 Illustration(
//                   x: c.key,
//                   y: r.key,
//                   flag: c.value != 0,
//                   // check1: c.value == 1,
//                   // check2: c.value == 2,
//                   // check3: c.value == 3,
//                   // check4: c.value == 4,
//                   onTap: () => onTap(c.key, r.key),
//                 ),
//                 // CustomPaint(
//                 //   painter: Illustration(
//                 //   x: c.key,
//                 //   y: r.key,
//                 //   flag: c.value != 0,
//                 //   // check1: c.value == 1,
//                 //   // check2: c.value == 2,
//                 //   // check3: c.value == 3,
//                 //   // check4: c.value == 4,
//                 //   // onTap: () => onTap(c.key, r.key),
//                 //   ),
//                 // ),
//             ],
//           ),
//       ],
//     );
//   }
// }
