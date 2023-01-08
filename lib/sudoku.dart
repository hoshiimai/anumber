import 'package:flutter/material.dart';

class Illustration extends StatelessWidget {
  const Illustration({
    super.key,
    required this.x,
    required this.y,
    required this.flag,
    // required this.check1,
    // required this.check2,
    // required this.check3,
    // required this.check4,
    required this.onTap,
  });
  final int x;
  final int y;
  final bool flag;
  // final bool check1;
  // final bool check2;
  // final bool check3;
  // final bool check4;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      // onTap: () => onTap(x.toDouble(), y.toDouble()),
      onTap: onTap,
      child: Container(
        width: (screenSize.width) / 9.5,
        height: (screenSize.width) / 9.5,
        // width: 50,
        // height: 50,
        child: CustomPaint(
          painter: _IllustrationPainter(
            x: x,
            y: y,
            flag: flag,
            // check1: check1,
            // check2: check2,
            // check3: check3,
            // check4: check4,
            // onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class _IllustrationPainter extends CustomPainter {
  _IllustrationPainter({
    required this.x,
    required this.y,
    required this.flag,
    // required this.check1,
    // required this.check2,
    // required this.check3,
    // required this.check4,
    // required this.onTap,
  });
  final int x;
  final int y;
  final bool flag;
  // final bool check1;
  // final bool check2;
  // final bool check3;
  // final bool check4;
  // final Function() onTap;
  // final Function(int x, int y) onTap;

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

    // if (check1) {
    //   // 線を描画する
    //   final paint2 = Paint()
    //     ..color = Colors.red
    //     ..strokeWidth = 4;
    //   canvas.drawLine(
    //     Offset(size.width / 2, size.height / 2 + size.height / 2),
    //     Offset(size.width / 2, 4 * size.height),
    //     paint2,
    //   );
    // } else if (check2) {
    //   // 線を描画する
    //   final paint3 = Paint()
    //     ..color = Colors.red
    //     ..strokeWidth = 4;
    //   canvas.drawLine(
    //     Offset(size.width / 2 + size.width / 2, size.height / 2),
    //     Offset(8 * size.width / 2, size.height / 2),
    //     paint3,
    //   );
    // } else if (check3) {
    //   // 線を描画する
    //   final paint4 = Paint()
    //     ..color = Colors.red
    //     ..strokeWidth = 4;
    //   canvas.drawLine(
    //     Offset(size.width / 2 - size.width / 2, size.height / 2),
    //     Offset(-6 * size.width / 2, size.height / 2),
    //     paint4,
    //   );
    // } else if (check4) {
    //   // 線を描画する
    //   final paint5 = Paint()
    //     ..color = Colors.red
    //     ..strokeWidth = 4;
    //   canvas.drawLine(
    //     Offset(size.width / 2 - size.width / 2, size.height / 2),
    //     Offset(-6 * size.width / 2, size.height / 2),
    //     paint5,
    //   );
    // }
  }

  @override
  bool shouldRepaint(_IllustrationPainter old) => old.flag != flag;

  @override
  bool hitTest(Offset position) {
    final radius = 50 / 2;
    return (position.dx - radius).abs() + (position.dy - radius).abs() < radius;
  }

  // @override
  // void handleTap() {
  //   onTap(x, y);
  // }
}
