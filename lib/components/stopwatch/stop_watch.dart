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
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../infomation.dart';
import '../database/database_connection.dart';



class Stopwatch extends StatefulWidget {
  Stopwatch({
    Key? key,
    required this.isRunning, 
  }) : super(key: key);

  bool isRunning;
  static DateTime time = DateTime.utc(0, 0, 0);
  
  get _stopwatchState => null; 

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
    // _database.initDatabase();
  }

  @override
  void dispose() {
    widget.isRunning = false;
    // _timer.cancel();
    // insertTime();
    // _database.printStopwatchData();
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
            // insertTime();
          }
        },
      );
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // print("state = $state");
    if (state == AppLifecycleState.paused) {
      // バックグラウンドに遷移した時
      if (_timer.isActive) {
        _timer.cancel(); // タイマーを停止する
        // insertTime();
        // insertDatabase();
        // _database.insertDB(DateFormat.ms().format(Stopwatch.time), Data.init, Data.zero, Data.tmp);
        _database.deleteDB();
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
      // _database.printStopwatchData();
      // _database.deleteAllStopwatchData();
      // _database.selectDB();
    }
  }

  /// アプリがバックグラウンドに遷移した際のハンドラ
  // void _handleOnPaused() {
  //   if (_timer.isActive) {
  //     _timer.cancel(); // タイマーを停止する
  //     insertTime();
  //   }
  // }

  /// アプリがフォアグラウンドに復帰した際のハンドラ
  // void _handleOnResumed() {
  //   _timer = Timer.periodic(
  //     const Duration(seconds: 1),
  //     (Timer timer) {
  //       setState(() {
  //         _time = _time.add(const Duration(seconds: 1));
  //       });
  //     },
  //   );
  //   _database.printStopwatchData();
  //   _database.deleteAllStopwatchData();
  // }

  // Future insertTime() async{
  //   await _database.insertStopwatchData(Stopwatch.time);
  //   print('実行されてるよ');
  // }

  // Future insertDatabase() async{
  //   await _database.insertDB(Stopwatch.time, Data.zero);
  //   print('実行されてるよ');
  // }

  @override
  Widget build(BuildContext context) {
    return Text(DateFormat.ms().format(Stopwatch.time), style: TextStyle(fontSize: 15,));
  }
}

