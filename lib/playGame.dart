/*
****************************************
機能：anumberを解く時のメインページ
IN：問題、解答、ヒント
OUI：ゲーム画面
----------------------------------------
履歴：
****************************************
*/
import 'package:anumber/components/grid_candidate.dart';
import 'package:anumber/question.dart';
import 'package:flutter/material.dart';
import 'package:anumber/components/grid.dart';
import 'package:anumber/components/numbers.dart';

class Sudoku extends StatefulWidget {
  const Sudoku({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SudokuState createState() => _SudokuState();
}

class _SudokuState extends State<Sudoku> {

  // 候補入力判断用フラグ
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('A Number'),
        ),
        body: Center(
          child: Column(
            // 盤面、アイコン、数字ボタンを縦方向に並べ、スペースを均等に配置
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 問題の盤面の上に候補の盤面を重ねて表示
              Stack(
                alignment: Alignment.center,
                children: [
                  // 問題の盤面
                  SudokuGrid(
                    isEdit: isEdit,
                    init: Data.init,
                    data: Data.data,
                    selectedX: Data.selectedX,
                    selectedY: Data.selectedY,
                    onTap: (int x, int y) {
                      setState(() {
                        Data.selectedX = x;
                        Data.selectedY = y;
                      });
                    },
                  ),

                  // 候補の盤面
                  CandidateGrid(
                    isEdit: isEdit,
                    candidate: Data.tmp,
                  ),
                ],
              ),

              // アイコンボタン
              ControlButton(
                onTap: (int number) {
                  if (Data.init[Data.selectedY][Data.selectedX] == 0) {
                    setState(() {
                      Data.data[Data.selectedY][Data.selectedX] = number;
                    });
                  }
                },
                onPress: () {
                  setState(() {
                    isEdit = !isEdit;
                  });
                },
              ),

              // 数字ボタン
              Numbers(
                isPress: isEdit,
                onTap: (int number) {
                  if (Data.init[Data.selectedY][Data.selectedX] == 0) {
                    if (number == 1){
                      setState(() {
                      Data.tmp[3 * Data.selectedY][3 * Data.selectedX] = number;
                    });
                    } else if (number == 2) {
                      setState(() {
                        Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 1] = number;
                      });
                    }  else if (number == 3) {
                      setState(() {
                        Data.tmp[3 * Data.selectedY][3 * Data.selectedX + 2] = number;
                      });
                    }  else if (number == 4) {
                      setState(() {
                        Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX] = number;
                      });
                    }  else if (number == 5) {
                      setState(() {
                        Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 1] = number;
                      });
                    }  else if (number == 6) {
                      setState(() {
                        Data.tmp[3 * Data.selectedY + 1][3 * Data.selectedX + 2] = number;
                      });
                    }  else if (number == 7) {
                      setState(() {
                        Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX] = number;
                      });
                    }  else if (number == 8) {
                      setState(() {
                        Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 1] = number;
                      });
                    }  else if (number == 9) {
                      setState(() {
                        Data.tmp[3 * Data.selectedY + 2][3 * Data.selectedX + 2] = number;
                      });
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
