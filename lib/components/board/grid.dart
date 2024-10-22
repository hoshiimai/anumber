/*
****************************************
機能：問題のリストを左上から順番に処理する
IN：問題、選択マス
OUT：・問題の数字
     ・入力された数字かどうかの判定結果
　　 ・領域の判定結果
     ・指定マスの判定結果
     ・問題のリストx,yの座標
　　 ・候補判定フラグ
----------------------------------------
履歴：
****************************************
*/
import 'package:flutter/material.dart';
import 'package:anumber/components/board/cell.dart';



class SudokuGrid extends StatelessWidget {
  const SudokuGrid({
    super.key,
    required this.data,
    required this.init,
    required this.all,
    required this.onTap,
    required this.selectedX,
    required this.selectedY,
    required this.specifiedX,
    required this.specifiedY,
  });
  final List<List<int>> data;
  final List<List<int>> init;
  final List<List<int>> all;
  // final List<List<int>> anim;
  final Function(int x, int y) onTap;
  final int selectedX;
  final int selectedY;
  final int specifiedX;
  final int specifiedY;
  static int blockX1 = 0;
  static int blockY1 = 0;
  static int blockX2 = 0;
  static int blockY2 = 0;
  static int blockX3 = 0;
  static int blockY3 = 0;
  static int blockX4 = 0;
  static int blockY4 = 0;


  @override
  Widget build(BuildContext context) {
    Map<int, dynamic> Block = findBlock();
    return Column(
      children: [
        for (final MapEntry<int, List<int>> r in data.asMap().entries)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final MapEntry<int, int> c in r.value.asMap().entries)
                Cell(
                  number: c.value,  // 数字
                  inputNum: init[r.key][c.key] == 0,  // 入力された数字かどうか判定
                  checkNum: specifiedX == -999 ? c.value == all[r.key][c.key] : true, // 入力された数字が正しいかどうか判定
                  isSelected: selectedX == c.key && selectedY == r.key,  // 選択マス判定
                  isSameLine: selectedX == c.key || selectedY == r.key,  // 選択マスの行列判定

                  // 選択マスの領域(ブロック)のマス判定
                  isBlock1: Block[blockX1] == c.key && Block[blockY1] == r.key,
                  isBlock2: Block[blockX2] == c.key && Block[blockY2] == r.key,
                  isBlock3: Block[blockX3] == c.key && Block[blockY3] == r.key,
                  isBlock4: Block[blockX4] == c.key && Block[blockY4] == r.key,

                  // 指定マスの枠判定
                  isLeft: (specifiedX == c.key && specifiedY == r.key) || ((specifiedX + 1) == c.key && specifiedY == r.key),
                  isRight: specifiedX == 8 && c.key == 8 && specifiedY == r.key,
                  isTop: (specifiedX == c.key && specifiedY == r.key) || (specifiedX == c.key && (specifiedY + 1) == r.key),
                  isBottom: specifiedX == c.key && specifiedY == 8 && specifiedY == r.key, 
                  
                  x: c.key,
                  y: r.key,
                  onTap: () => onTap(c.key, r.key),
                ),
            ],
          ),
      ],
    );
  }

  
  // 選択マスの領域(ブロック)の内、該当する行と列以外のマスの座標を抽出する
  Map<int, dynamic> findBlock() {
    if ((selectedX == 0 || selectedX == 3 || selectedX == 6) &&
        (selectedY == 0 || selectedY == 3 || selectedY == 6)) { // A
      blockX1 = selectedX + 1;
      blockY1 = selectedY + 1;
      blockX2 = selectedX + 2;
      blockY2 = selectedY + 1;
      blockX3 = selectedX + 1;
      blockY3 = selectedY + 2;
      blockX4 = selectedX + 2;
      blockY4 = selectedY + 2;

    } else if ((selectedX == 1 || selectedX == 4 || selectedX == 7) &&
          (selectedY == 0 || selectedY == 3 || selectedY == 6)) { // B
      blockX1 = selectedX - 1;
      blockY1 = selectedY + 1;
      blockX2 = selectedX - 1;
      blockY2 = selectedY + 2;
      blockX3 = selectedX + 1;
      blockY3 = selectedY + 1;
      blockX4 = selectedX + 1;
      blockY4 = selectedY + 2;

    } else if ((selectedX == 2 || selectedX == 5 || selectedX == 8) &&
        (selectedY == 0 || selectedY == 3 || selectedY == 6)) { // C
      blockX1 = selectedX - 2;
      blockY1 = selectedY + 1;
      blockX2 = selectedX - 2;
      blockY2 = selectedY + 2;
      blockX3 = selectedX - 1;
      blockY3 = selectedY + 1;
      blockX4 = selectedX - 1;
      blockY4 = selectedY + 2;

    } else if ((selectedX == 0 || selectedX == 3 || selectedX == 6) &&
        (selectedY == 1 || selectedY == 4 || selectedY == 7)) { // D
      blockX1 = selectedX + 1;
      blockY1 = selectedY - 1;
      blockX2 = selectedX + 1;
      blockY2 = selectedY + 1;
      blockX3 = selectedX + 2;
      blockY3 = selectedY - 1;
      blockX4 = selectedX + 2;
      blockY4 = selectedY + 1;

    } else if ((selectedX == 1 || selectedX == 4 || selectedX == 7) &&
        (selectedY == 1 || selectedY == 4 || selectedY == 7)) { // E
      blockX1 = selectedX - 1;
      blockY1 = selectedY - 1;
      blockX2 = selectedX - 1;
      blockY2 = selectedY + 1;
      blockX3 = selectedX + 1;
      blockY3 = selectedY - 1;
      blockX4 = selectedX + 1;
      blockY4 = selectedY + 1;

    } else if ((selectedX == 2 || selectedX == 5 || selectedX == 8) &&
        (selectedY == 1 || selectedY == 4 || selectedY == 7)) { // F
      blockX1 = selectedX - 2;
      blockY1 = selectedY - 1;
      blockX2 = selectedX - 2;
      blockY2 = selectedY + 1;
      blockX3 = selectedX - 1;
      blockY3 = selectedY - 1;
      blockX4 = selectedX - 1;
      blockY4 = selectedY + 1;

    } else if ((selectedX == 0 || selectedX == 3 || selectedX == 6) &&
        (selectedY == 2 || selectedY == 5 || selectedY == 8)) { // G
      blockX1 = selectedX + 1;
      blockY1 = selectedY - 2;
      blockX2 = selectedX + 1;
      blockY2 = selectedY - 1;
      blockX3 = selectedX + 2;
      blockY3 = selectedY - 2;
      blockX4 = selectedX + 2;
      blockY4 = selectedY - 1;

    } else if ((selectedX == 1 || selectedX == 4 || selectedX == 7) &&
        (selectedY == 2 || selectedY == 5 || selectedY == 8)) { // H
      blockX1 = selectedX - 1;
      blockY1 = selectedY - 2;
      blockX2 = selectedX - 1;
      blockY2 = selectedY - 1;
      blockX3 = selectedX + 1;
      blockY3 = selectedY - 2;
      blockX4 = selectedX + 1;
      blockY4 = selectedY - 1;

    } else if ((selectedX == 2 || selectedX == 5 || selectedX == 8) &&
        (selectedY == 2 || selectedY == 5 || selectedY == 8)) {// I
      blockX1 = selectedX - 2;
      blockY1 = selectedY - 2;
      blockX2 = selectedX - 2;
      blockY2 = selectedY - 1;
      blockX3 = selectedX - 1;
      blockY3 = selectedY - 2;
      blockX4 = selectedX - 1;
      blockY4 = selectedY - 1;
    } else {
      blockX1 = -1;
      blockY1 = -1;
      blockX2 = -1;
      blockY2 = -1;
      blockX3 = -1;
      blockY3 = -1;
      blockX4 = -1;
      blockY4 = -1;
    }
    
    return {
      blockX1: blockX1,
      blockY1: blockY1,
      blockX2: blockX2,
      blockY2: blockY2,
      blockX3: blockX3,
      blockY3: blockY3,
      blockX4: blockX4,
      blockY4: blockY4
    };
  }
}
