/*
**********************************************
機能：ストップウォッチ
　　　・バックグラウンド時は、タイムストップ
OUI：タイム
----------------------------------------------
履歴：
**********************************************
*/

import 'dart:async';
import 'package:anumber/infomation.dart';
import 'package:anumber/style/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../database/database_connection.dart';



class Stopwatch extends StatefulWidget {
  Stopwatch({
    Key? key,
    required this.isRunning,
  }) : super(key: key);

  bool isRunning;

  static DateTime time = DateTime.utc(0, 0, 0);
  
  _StopwatchState get _stopwatchState => _StopwatchState();

  @override
  // ignore: library_private_types_in_public_api
  _StopwatchState createState() => _StopwatchState();
}


class _StopwatchState extends State<Stopwatch> with WidgetsBindingObserver {

  final _database = Database();
  

  late Timer _timer = Timer.periodic(
    const Duration(seconds: 1),
    (Timer timer) {
      if (widget.isRunning) {
        setState(() {
          Stopwatch.time = Stopwatch.time.add(const Duration(seconds: 1));
        });
      } else {
        timer.cancel();
      }
    },
  );

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    widget.isRunning = false;
    _timer.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(Stopwatch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRunning != oldWidget.isRunning) {
      _timer.cancel();
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) {
          if (widget.isRunning) {
            setState(() {
              Stopwatch.time = Stopwatch.time.add(const Duration(seconds: 1));
            });
          } else {
            timer.cancel();
          }
        },
      );
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // バックグラウンドに遷移した時
      if (_timer.isActive) {
        _timer.cancel(); // タイマーを停止する
        _database.insertDB(Infomation.id, DateFormat.ms().format(Stopwatch.time), Infomation.init, Infomation.zero, Infomation.tmp, Infomation.specifiedX, Infomation.specifiedY, Infomation.kotae, Infomation.level, Infomation.sound);
      }
    } else if (state == AppLifecycleState.resumed && mounted) {
      // フォアグラウンドに復帰した時
      _timer = Timer.periodic(
      const Duration(seconds: 1),
        (Timer timer) {
          setState(() {
              Stopwatch.time = Stopwatch.time.add(const Duration(seconds: 1));
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(DateFormat.ms().format(Stopwatch.time), style: TextStyle(fontSize: 15, fontFamily: "Nunito", color: AppColors.isText));
  }
}