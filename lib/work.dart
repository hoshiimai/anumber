// import 'package:flutter/material.dart';


// class Illustration extends StatefulWidget {
//   const Illustration({
//     super.key,
//     required this.x,
//     required this.y,
//     required this.flag,
//     required this.onTap,
//   });
//   final int x;
//   final int y;
//   final bool flag;
//   final Function() onTap;

//   @override
//   _IllustrationState createState() => _IllustrationState();
// }

// class _IllustrationState extends State<Illustration> with TickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _xAnimation;
//   late Animation<double> _yAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: Duration(seconds: 1),
//       vsync: this,
//     );
//     _xAnimation = Tween<double>(
//       begin: widget.x.toDouble(),
//       end: widget.x.toDouble() + 100,
//     ).animate(_animationController);
//     _yAnimation = Tween<double>(
//       begin: widget.y.toDouble(),
//       end: widget.y.toDouble() + 100,
//     ).animate(_animationController);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return GestureDetector(
//       onTap: () {
//         _animationController.reset();
//         _animationController.forward();
//         widget.onTap();
//       },
//       child: Container(
//         width: (screenSize.width) / 9.5,
//         height: (screenSize.width) / 9.5,

//         child: CustomPaint(
//           painter: _IllustrationPainter(
//             x: _xAnimation.value,
//             y: _yAnimation.value,
//             flag: widget.flag,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
// }

// class _IllustrationPainter extends CustomPainter {
//   _IllustrationPainter({
//     required this.x,
//     required this.y,
//     required this.flag,
//   });
//   final double x;
//   final double y;
//   final bool flag;

//   @override
//   void paint(Canvas canvas, Size size) {
//     if (flag) {
//       // 円を描画する
//       final paint = Paint()
//         ..color = Colors.red
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 3;
//       canvas.drawCircle(
//         Offset(x, y),
//         size.width / 2 * 0.9,
//         paint,
//       );
//     }
//   }

//   @override
//   bool shouldRepaint(_IllustrationPainter old) => old.flag != flag;

//   @override
//   bool hitTest(Offset position) {
//     final radius = 50 / 2;
//     return (position.dx - radius).abs() + (position.dy - radius).abs() < radius;
//   }
// }


// /*
// ****************************************
// 機能：anumberを解く時のメインページ
// IN：問題、解答、ヒント
// OUT：ゲーム画面
// ----------------------------------------
// 履歴：
// ****************************************
// */
// import 'dart:async';

// import 'package:anumber/components/answer/grid_illust.dart';
// import 'package:anumber/components/button/confirmButton.dart';
// import 'package:anumber/components/board/grid_candidate.dart';
// import 'package:anumber/components/stopwatch/stop_watch.dart';
// import 'package:anumber/question.dart';
// import 'package:flutter/material.dart';
// import 'package:anumber/components/board/grid.dart';
// import 'package:anumber/components/button/numbers.dart';
// import 'package:provider/provider.dart';

// import '../../makeQuestion.dart';
// import '../../sudoku.dart';

// class Sudoku extends StatefulWidget {
//   final int level;

//   const Sudoku({Key? key, required this.level}) : super(key: key);

//   @override
//   _SudokuState createState() => _SudokuState();
// }

// class _SudokuState extends State<Sudoku> {
//   late int state;
//   bool initialRender = false;

//   @override
//   void initState() {
//     super.initState();
//     try {
//       getdata();
//       state = widget.level;
//       print(state);
//       initialRender = true;
//     } catch (e) {
//       if (e is RangeError) {
//         print('RangeError: $e');
//       } else {
//         throw e;
//       }
//     } finally {
//       print('Finally block executed');
//     }
//   }

//   getdata() async {
//     await Future.delayed(Duration(milliseconds: 500));
//     for (var i = 0; i < 9; i++) {
//       for (var j = 0; j < 9; j++) {
//         if (Data.init[i][j] != 0) {
//           await Future.delayed(Duration(milliseconds: 10));
//           setState(() {
//             Data.zero[i][j] = Data.init[i][j];
//           });
//         }
//       }
//     }
//     await Future.delayed(Duration(milliseconds: 500));
//   }

//   // 候補入力判断用フラグ
//   bool isEdit = false;

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return WillPopScope(
//       onWillPop: () => Future.value(false),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('A Number'),
//         ),
//         body: Center(
//           child: Column(
//             children: [

//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: (screenSize.width) / 25),
//                     child: Text(
//                       state == 1 ? '初級' :
//                       state == 2 ? '中級' :
//                       state == 3 ? '上級' :
//                       'エラー',
//                       style: TextStyle(
//                         fontSize: (screenSize.width) / 25,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // 問題の盤面
//                   SudokuGrid(
//                     init: Data.init,
//                     data: Data.zero,
//                     selectedX: Data.selectedX,
//                     selectedY: Data.selectedY,
//                     onTap: (int x, int y) {
//                       setState(() {
//                         Data.selectedX = x;
//                         Data.selectedY = y;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               ConfirmButton(answer: Data.zero[Data.selectedY][Data.selectedX]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
