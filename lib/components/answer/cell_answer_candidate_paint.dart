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

class AnswerCandidatePaint extends StatelessWidget {
  const AnswerCandidatePaint({
    super.key,
    required this.x,
    required this.y,
  });

  final int x;
  final int y;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var wi = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 3 : ((screenSize.height) * 0.45 / 9) / 3;
    var he = (screenSize.width) * 0.97 / 9 < (screenSize.height) * 0.45 / 9 ? ((screenSize.width) * 0.97 / 9) / 3 : ((screenSize.height) * 0.45 / 9) / 3;
    return Container(
      width: wi,
      height: he,
      child: Center(
        child: CustomPaint(
          painter: Infomation.paintCandidate1[y][x] == 1 ? _LinePainter1(
            x: x,
            y: y,
            z: wi,
          ) : Infomation.paintCandidate1[y][x] == 2 ? _LinePainter2(
            x: x,
            y: y,
            z: wi,                  
          )  : Infomation.paintCandidate1[y][x] == 3 ? _LinePainter3(
            x: x,
            y: y,
            z: wi,                  
          )  : Infomation.paintCandidate2[y][x] == 4 ? _LinePainter4(
            x: x,
            y: y,
            z: wi,                  
          )  : Infomation.paintCandidate2[y][x] == 5 ? _LinePainter5(
            x: x,
            y: y,
            z: wi,                  
          )  : Infomation.paintCandidate2[y][x] == 6 ? _LinePainter6(
            x: x,
            y: y,
            z: wi,                  
          ) : null,
        ),
      ),
    );
  }
}

class _LinePainter1 extends CustomPainter {
  final int x;
  final int y;
  final double z;

  _LinePainter1({required this.x, required this.y, required this.z});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, 0),
      Offset(z * (Infomation.paintCandidate1.expand((e) => e).toList().indexOf(11) % Infomation.paintCandidate1[0].length - x.toDouble()),
             z * (Infomation.paintCandidate1.expand((e) => e).toList().indexOf(11) ~/ Infomation.paintCandidate1[0].length - y.toDouble())),
      Paint()
        ..color = Colors.cyan[600]!
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _LinePainter2 extends CustomPainter {
  final int x;
  final int y;
  final double z;

  _LinePainter2({required this.x, required this.y, required this.z});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, 0),
      Offset(z * (Infomation.paintCandidate1.expand((e) => e).toList().indexOf(22) % Infomation.paintCandidate1[0].length - x.toDouble()),
             z * (Infomation.paintCandidate1.expand((e) => e).toList().indexOf(22) ~/ Infomation.paintCandidate1[0].length - y.toDouble())),
      Paint()
        ..color = Colors.cyan[600]!
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _LinePainter3 extends CustomPainter {
  final int x;
  final int y;
  final double z;

  _LinePainter3({required this.x, required this.y, required this.z});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, 0),
      Offset(z * (Infomation.paintCandidate1.expand((e) => e).toList().indexOf(33) % Infomation.paintCandidate1[0].length - x.toDouble()),
             z * (Infomation.paintCandidate1.expand((e) => e).toList().indexOf(33) ~/ Infomation.paintCandidate1[0].length - y.toDouble())),
      Paint()
        ..color = Colors.cyan[600]!
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _LinePainter4 extends CustomPainter {
  final int x;
  final int y;
  final double z;

  _LinePainter4({required this.x, required this.y, required this.z});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, 0),
      Offset(z * (Infomation.paintCandidate2.expand((e) => e).toList().indexOf(44) % Infomation.paintCandidate2[0].length - x.toDouble()),
             z * (Infomation.paintCandidate2.expand((e) => e).toList().indexOf(44) ~/ Infomation.paintCandidate2[0].length - y.toDouble())),
      Paint()
        ..color = Colors.cyan[600]!
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _LinePainter5 extends CustomPainter {
  final int x;
  final int y;
  final double z;

  _LinePainter5({required this.x, required this.y, required this.z});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, 0),
      Offset(z * (Infomation.paintCandidate2.expand((e) => e).toList().indexOf(55) % Infomation.paintCandidate2[0].length - x.toDouble()),
             z * (Infomation.paintCandidate2.expand((e) => e).toList().indexOf(55) ~/ Infomation.paintCandidate2[0].length - y.toDouble())),
      Paint()
        ..color = Colors.cyan[600]!
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _LinePainter6 extends CustomPainter {
  final int x;
  final int y;
  final double z;

  _LinePainter6({required this.x, required this.y, required this.z});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(0, 0),
      Offset(z * (Infomation.paintCandidate2.expand((e) => e).toList().indexOf(66) % Infomation.paintCandidate2[0].length - x.toDouble()),
             z * (Infomation.paintCandidate2.expand((e) => e).toList().indexOf(66) ~/ Infomation.paintCandidate2[0].length - y.toDouble())),
      Paint()
        ..color = Colors.cyan[600]!
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}