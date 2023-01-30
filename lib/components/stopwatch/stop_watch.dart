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

import '../database/database_connection.dart';



class Stopwatch extends StatefulWidget {
  Stopwatch({
    // super.key
    required this.isRunning, 
  });

  bool isRunning;
  
  // final _stopwatchState = _StopwatchState();

  // void insertTime() {
  //   _stopwatchState.insertTime();
  // }
  get _stopwatchState => null; 

  Future insertTimeToDatabase() async {
    await _stopwatchState?.insertTime();
  }

  @override
  // ignore: library_private_types_in_public_api
  _StopwatchState createState() => _StopwatchState();
}


class _StopwatchState extends State<Stopwatch> with WidgetsBindingObserver {

  final  _stopwatchDatabase = StopwatchDatabase();
  
  late DateTime _time = DateTime.utc(0, 0, 0);

  late Timer _timer = Timer.periodic(
    const Duration(seconds: 1),
    (Timer timer) {
      if (widget.isRunning) {
        setState(() {
          _time = _time.add(const Duration(seconds: 1));
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
    _stopwatchDatabase.initDatabase();
  }

  @override
  void dispose() {
    widget.isRunning = false;
    _timer.cancel();
    // insertTime();
    // _stopwatchDatabase.printStopwatchData();
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
              _time = _time.add(const Duration(seconds: 1));
            });
          } else {
            timer.cancel();
            insertTime();
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
        insertTime();
      }
    } else if (state == AppLifecycleState.resumed && mounted) {
      // フォアグラウンドに復帰した時
      _timer = Timer.periodic(
      const Duration(seconds: 1),
        (Timer timer) {
          setState(() {
              _time = _time.add(const Duration(seconds: 1));
          });
        },
      );
      _stopwatchDatabase.printStopwatchData();
      _stopwatchDatabase.deleteAllStopwatchData();
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
  //   _stopwatchDatabase.printStopwatchData();
  //   _stopwatchDatabase.deleteAllStopwatchData();
  // }

  Future insertTime() async{
    await _stopwatchDatabase.insertStopwatchData(_time);
    print('実行されてるよ');
  }

DateTime aaa() {
  return _time;
}
  @override
  Widget build(BuildContext context) {
    return Text(DateFormat.ms().format(_time), style: TextStyle(fontSize: 15,));
  }
}

