import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with WidgetsBindingObserver {
  late Timer _timer;
  late DateTime _time;

  @override
  void initState() {
    super.initState();
    // _timer = Timer.periodic(
    //   const Duration(seconds: 1),
    //   (_t) => setState(() {}),
    // );
    _time = DateTime.utc(0, 0, 0);
    getdata();
    WidgetsBinding.instance.addObserver(this);
  }


  getdata() async {
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

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return
        // Text(
        //   '${_formatter.format(DateTime.now())}',
        //   style: TextStyle(fontSize: 18),
        // );
        Text(DateFormat.ms().format(_time),
            style: TextStyle(
              fontSize: 15,
            ));
  }
}
