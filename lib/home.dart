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

import 'package:anumber/components/screen/answerScreen.dart';
import 'package:anumber/components/screen/gameScreen.dart';
import 'package:anumber/infomation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/database/database_connection.dart';
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
  String level = "";


  @override
  void initState(){
    super.initState();
    // _database.deleteDB();
    selectTime();
    // countCorrect();
  }





  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Container(
        decoration: BoxDecoration(
          image: DateTime.now().hour >= 5 && DateTime.now().hour < 17
              ? const DecorationImage(
                  image: AssetImage('assets/images/home3.jpg'),
                  fit: BoxFit.fill,
                )
              : DateTime.now().hour >= 17 && DateTime.now().hour < 19
              ? const DecorationImage(
                  image: AssetImage('assets/images/home2.jpg'),
                  fit: BoxFit.fill,
                )
              : const DecorationImage(
                  image: AssetImage('assets/images/home3.jpg'),
                  fit: BoxFit.fill,
                )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(                                                                                                                                
                width: screenSize.width *0.7,
                height: screenSize.width * 0.15,
                child: isResume ?
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ), onPressed: () async { 
                        await setLocaldata();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Sudoku(initFlag: false, isResume: true),
                          ),
                        );
                     },
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '続ける',
                          style: TextStyle(
                            fontSize: screenSize.width *0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '$level $time',
                          style: TextStyle(
                            fontSize: screenSize.width *0.04,
                            color: Colors.blueGrey,
                            fontFamily: "Noto Sans JP",
                          ),
                        ),
                      ]
                     )
                  ) : null,
              ),
              //余白
              SizedBox(
                height: (screenSize.width) / 18,
              ),

              SizedBox(
                width: screenSize.width *0.7,
                height: screenSize.width * 0.15,
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
                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                            child: Text(
                              '初級',
                              style: TextStyle(color: Colors.blue[900], fontFamily: "Noto Sans JP")
                            ),
                            onPressed: () async{
                              setState(() {
                                Infomation.level = "初級";
                              });
                              await MakeQuestion().getExcelValue();
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // builder: (context) => AnswerScreen(),
                                  builder: (context) =>  const Sudoku(initFlag: true, isResume: false),
                                ),
                              );
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text(
                              '中級',
                              style: TextStyle(color: Colors.blue[900], fontFamily: "Noto Sans JP")
                            ),
                            onPressed: () async {
                              setState(() {
                                Infomation.level = "中級";
                              });                              
                              await MakeQuestion().getExcelValue();
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Sudoku(initFlag: true, isResume: false,), 
                                ),
                              );
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text(
                              '上級',
                              style: TextStyle(color: Colors.blue[900], fontFamily: "Noto Sans JP")
                            ),
                            onPressed: () async {
                              setState(() {
                                Infomation.level = "上級";
                              });
                              await MakeQuestion().getExcelValue();
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Sudoku(initFlag: true, isResume: false), 
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    '新しいゲーム',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.06,
                      color: const Color(0xff707070),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: (screenSize.height) / 6,
              ),
            ],
          ),
        ),
      ),
    );
  }


    void printCountData() async {
      final countData = await _database.getCountData();
      if (countData != null) {
        final count = countData['count'];
        print('Count: $count');
      } else {
        print('No count data found.');
      }
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

  Future<void> countCorrect() async {
    final result = await _database.selectCorrectCount();
    if(result.isNotEmpty) {
      setState(() {
        Infomation.correctCount = int.parse(result[1]);
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
      Infomation.level = result[8];
    });
  }
}