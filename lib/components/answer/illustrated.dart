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


class Illustration extends StatefulWidget {
  const Illustration({
    super.key,
    required this.x,
    required this.y,
    required this.flag,
    required this.onTap,
  });
  final int x;
  final int y;
  final bool flag;
  final Function() onTap;

  @override
  _IllustrationState createState() => _IllustrationState();
}

class _IllustrationState extends State<Illustration> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _xAnimation;
  late Animation<double> _yAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _xAnimation = Tween<double>(
      begin: widget.x.toDouble(),
      end: widget.x.toDouble() + 100,
    ).animate(_animationController);
    _yAnimation = Tween<double>(
      begin: widget.y.toDouble(),
      end: widget.y.toDouble() + 100,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        _animationController.reset();
        _animationController.forward();
        widget.onTap();
      },
      child: Container(
        width: (screenSize.width) / 9.5,
        height: (screenSize.width) / 9.5,

        child: CustomPaint(
          painter: _IllustrationPainter(
            x: _xAnimation.value,
            y: _yAnimation.value,
            flag: widget.flag,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _IllustrationPainter extends CustomPainter {
  _IllustrationPainter({
    required this.x,
    required this.y,
    required this.flag,
  });
  final double x;
  final double y;
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
        Offset(x, y),
        size.width / 2 * 0.9,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_IllustrationPainter old) => old.flag != flag;

  @override
  bool hitTest(Offset position) {
    final radius = 50 / 2;
    return (position.dx - radius).abs() + (position.dy - radius).abs() < radius;
  }
}

// class Illustration extends StatefulWidget {
//   const Illustration({
//     super.key,
//     required this.x,
//     required this.y,
//     required this.flag,
//   });

//   final int x;
//   final int y;
//   final bool flag;

//   @override
//   _IllustrationState createState() => _IllustrationState();
// }

// class _IllustrationState extends State<Illustration> {
//   late Offset _offset;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (widget.flag) {
//         final renderBox = context.findRenderObject() as RenderBox;
//         setState(() {
//           _offset = renderBox.localToGlobal(Offset.zero);
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50,
//       height: 50,
//       child: widget.flag
//           ? Text("x: ${_offset.dx}, y: ${_offset.dy}")
//           : Container(),
//     );
//   }
// }
