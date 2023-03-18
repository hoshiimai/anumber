/*
****************************************
機能：アプリ起動時の最初の画面
　　　・難易度選択ボタン → ページ遷移
OUT：playGame.dartに遷移
----------------------------------------
履歴：
****************************************
*/

import 'package:anumber/components/screen/gameScreen.dart';
import 'package:anumber/infomation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/database/database_connection.dart';
import 'components/screen/answerScreen.dart';
import 'package:flutter/services.dart';
import 'package:excel/excel.dart';

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


  @override
  void initState(){
    super.initState();
    // _database.deleteDB();
    selectTime();
    // print(isResume);
  }


  Future<void> selectTime() async {
    final result = await _database.selectDB();
    if(result.isNotEmpty) {
      // _database.initDatabase();
      // print('exist ok');
      setState(() {
        isResume = true;
        time = result[0];
        state = result[1];
      });
      print("レコード存在チェック: $isResume");
      print("time: $time");
    } else {
      // print('exist ng');
    }
  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfffff8dc),
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
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ), onPressed: () { 
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sudoku(level: state),
                          ),
                        );
                      // _database.deleteAllStopwatchData();
                     },
                    child: Text(
                      '続ける $time',
                      style: const TextStyle(
                        fontFamily: 'Yu Gothic',
                        fontSize: 25,
                        color: Color(0xff707070),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
                        title: const Text('難易度選択'),
                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                            child: const Text('初級',
                              style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AnswerScreen(),
                                  // builder: (context) => const Sudoku(level: "初級"),
                                ),
                              );
                              // _database.deleteAllStopwatchData();
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('中級',
                              style: TextStyle(color: Colors.blue)),
                            onPressed: () async {
                              MakeQuestion().getExcelValue(setState);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Sudoku(level: "中級",), 
                                ),
                              );
                              // _database.deleteAllStopwatchData();
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('上級',
                              style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Sudoku(level: "上級",), 
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
                    '難易度選択',
                    style: TextStyle(
                      fontFamily: 'Yu Gothic',
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
}