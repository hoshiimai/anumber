/*
****************************************
機能：アプリ起動時の最初の画面
　　　・難易度選択ボタン → ページ遷移
OUT：playGame.dartに遷移
----------------------------------------
履歴：
****************************************
*/

import 'dart:convert';

import 'package:anumber/components/screen/gameScreen.dart';
import 'package:anumber/infomation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/database/database_connection.dart';
import 'components/screen/answerScreen.dart';
import 'makeQuestion.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<Home> {
 
  final _database = Database();
  bool isResume = false;
  String time = "00:00";
  String state = "取得エラー";
  String level = "";


  @override
  void initState(){
    super.initState();
    // _database.deleteDB();
    selectTime();
  }





  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: (
        AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:Brightness.dark
          ),
          backgroundColor: const Color(0xFFFAFAFA),
          elevation: 0,
        )
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Container(
              //   width: 10,
              //   height: 10,
              //   color: const Color(0xfffff8dc),
              // ),
              // Image(
              //   width: 335,
              //   image: AssetImage('images/main01.png'),
              // ),
              
              Container(                                                                                                                                
                width: 250,
                height: 65,
                child: isResume ?
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ), onPressed: () async { 
                        setLocaldata();
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sudoku(level: state, initFlag: false, isResume: true),
                          ),
                        );
                      // _database.deleteAllStopwatchData();
                     },
                     child: Column(
                      children: [
                        const Text(
                          '続ける',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '$level $time',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blueGrey,
                            fontFamily: "Nunito",
                            // fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]
                     )
                  ) : null,
              ),
                                  //余白
              SizedBox(
                height: (screenSize.width) / 20,
              ),

              SizedBox(
                width: 250,
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        // title: const Text('難易度選択'),
                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                            child: Text(
                              '初級',
                              style: TextStyle(color: Colors.blue[900], fontFamily: "Noto Sans JP")
                            ),
                            onPressed: () async{
                              MakeQuestion().getExcelValue();
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  AnswerScreen(level: "中級"),
                                  // builder: (context) => const Sudoku(level: "初級"),
                                ),
                              );
                              // _database.deleteAllStopwatchData();
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text(
                              '中級',
                              style: TextStyle(color: Colors.blue[900], fontFamily: "Noto Sans JP")
                            ),
                            onPressed: () async {
                              MakeQuestion().getExcelValue();
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Sudoku(level: "中級", initFlag: true, isResume: false,), 
                                ),
                              );
                              // _database.deleteAllStopwatchData();
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text(
                              '上級',
                              style: TextStyle(color: Colors.blue[900], fontFamily: "Noto Sans JP")
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Sudoku(level: "上級", initFlag: true, isResume: false,), 
                                ),
                              );
                              // _database.deleteAllStopwatchData();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    '新しいゲーム',
                    style: TextStyle(
                      // fontFamily: 'Yu Gothic',
                      fontSize: 25,
                      color: Color(0xff707070),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: (screenSize.width) / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectTime() async {
    final result = await _database.selectDB();
    if(result.isNotEmpty) {
      setState(() {
        isResume = true;
        time = result[1];
        level = result[8];
      });
    }
  }

  Future<void> setLocaldata() async {
    final result = await _database.selectDB();
    setState(() {
      Infomation.id = int.parse(result[0]);
      // time = result[1];
      Infomation.init = (jsonDecode(result[2]) as List<dynamic>).map((e) => List<int>.from(e)).toList();
      Infomation.zero = (jsonDecode(result[3]) as List<dynamic>).map((e) => List<int>.from(e)).toList();
      Infomation.tmp = (jsonDecode(result[4]) as List<dynamic>).map((e) => List<int>.from(e)).toList();
      Infomation.selectedX = int.parse(result[5]);
      Infomation.selectedY = int.parse(result[6]);
      Infomation.specifiedX = int.parse(result[5]);
      Infomation.specifiedY = int.parse(result[6]);
      Infomation.answerX = int.parse(result[5]);
      Infomation.answerY = int.parse(result[6]);
      Infomation.kotae = int.parse(result[7]);
      state = result[8];
    });
    //     final Map<String, dynamic> data = {
    //   'id': id.toString(),
    //   'time': timer.toString(),
    //   'value': jsonEncode(value),
    //   'zero': jsonEncode(zero),
    //   'candidate': jsonEncode(candidate),
    //   'level': level.toString()
    // };
  }
}