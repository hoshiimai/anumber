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



class Stopwatch extends StatefulWidget {
  Stopwatch({
    // super.key
    required this.isRunning,  
  });
   bool isRunning; 

  @override
  // ignore: library_private_types_in_public_api
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> with WidgetsBindingObserver {

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
          }
        },
      );
    }
  }
  // late Timer _timer;
  // late DateTime _time;

  // @override
  // void initState() {
  //   super.initState();
  //   _time = DateTime.utc(0, 0, 0);
  //   getTime();
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // @override
  // void didUpdateWidget(Stopwatch oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.isRunning != oldWidget.isRunning) {
  //     getTime();
  //   }
  // }

  // getTime() async {
  //   _timer = Timer.periodic(
  //     const Duration(seconds: 1),
  //     (Timer timer) {
  //       if (widget.isRunning) {
  //         setState(() {
  //           _time = _time.add(const Duration(seconds: 1));
  //         });
  //       } else {
  //         timer.cancel();
  //       }
  //     },
  //   );
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("state = $state");
    if (state == AppLifecycleState.paused) {
      // バックグラウンドに遷移した時
      setState(_handleOnPaused);
    } else if (state == AppLifecycleState.resumed) {
      // フォアグラウンドに復帰した時
      setState(_handleOnResumed);
    }
  }

  /// アプリがバックグラウンドに遷移した際のハンドラ
  void _handleOnPaused() {
    if (_timer.isActive) {
      _timer.cancel(); // タイマーを停止する
    }
  }

  /// アプリがフォアグラウンドに復帰した際のハンドラ
  void _handleOnResumed() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        setState(() {
          _time = _time.add(const Duration(seconds: 1));
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(DateFormat.ms().format(_time), style: TextStyle(fontSize: 15,));
  }
}

