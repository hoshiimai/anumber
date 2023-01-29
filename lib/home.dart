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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/database/database_connection.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<Home> {
 
  final  _stopwatchDatabase = StopwatchDatabase();
  bool resume = false;

  @override
  void initState() {
    super.initState();
    someMethod();
  }

  void someMethod() async {
    resume = await _stopwatchDatabase.isResume();
    setState(() {
      this.resume = resume;  
    });
    print("☆☆☆　$resume  ☆☆☆");
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfffff8dc),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 10,
                height: 10,
                color: const Color(0xfffff8dc),
              ),
              // Image(
              //   width: 335,
              //   image: AssetImage('images/main01.png'),
              // ),
              
              Container(
                child: resume ? 
                  ElevatedButton(
                    child: Text("続ける"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      ),
                    ), onPressed: () {  },
                  ) : null,
              ),
                                  //余白
              SizedBox(
                height: (screenSize.width) / 50,
              ),

              SizedBox(
                width: 250,
                height: 65,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        title: const Text('難易度選択'),
                        // message: const Text('Message'),
                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                            child: const Text('初級',
                              style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Sudoku(level: 1), 
                                ),
                              );
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('中級',
                              style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Sudoku(level: 2,), 
                                ),
                              );
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text('上級',
                              style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Sudoku(level: 3,), 
                                ),
                              );
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
              )
            ],
          ),
        ),
      ),
    );
  }
}