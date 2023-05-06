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
import 'package:anumber/components/answer/cell_answer.dart';
import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';
import 'package:anumber/components/board/cell.dart';

import 'illustrated.dart';


class AnswerGrid extends StatelessWidget {
  const AnswerGrid({
    super.key,
    required this.data,
    required this.init,
    required this.anim,
    required this.selectedX,
    required this.selectedY,
    required this.specifiedX,
    required this.specifiedY,
    required this.initX0,
    required this.initY0,
    required this.initX1,
    required this.initY1,
    required this.initX2,
    required this.initY2,
    required this.initX3,
    required this.initY3,
    required this.initX4,
    required this.initY4,
    required this.borderListX,
    required this.borderListY,
  });
  final List<List<int>> data;
  final List<List<int>> init;
  final List<List<int>> anim;
  final int selectedX;
  final int selectedY;
  final int specifiedX;
  final int specifiedY;
  final int initX0;
  final int initY0;
  final int initX1;
  final int initY1;
  final int initX2;
  final int initY2;
  final int initX3;
  final int initY3;
  final int initX4;
  final int initY4;
  final List<int> borderListX;
  final List<int> borderListY;
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
                Answer(
                  number: c.value,  // 数字
                  inputNum: init[r.key][c.key] == 0,  // 入力された数字かどうか判定
                  // isInit: initX == c.key && initY == r.key,  // 選択マス判定
                  isSelected: selectedX == c.key && selectedY == r.key,  // 選択マス判定
                  isSameLine: selectedX == c.key || selectedY == r.key,  // 選択マスの行列判定
                  isAnswerRow: initY0 == r.key || initY1 == r.key || initY2 == r.key || initY3 == r.key || initY4 == r.key,   
                  isAnswerColumn: initX0 == c.key || initX1 == c.key || initX2 == c.key || initX3 == c.key || initX4 == c.key,   
                  isCell: anim[r.key][c.key] == 999,
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
                  
                  // 解説用　行・列を枠線でハイライト
                  isFrameLeft: checkCLB("L", c.key, r.key),
                  isFrameRight: checkCLB("R", c.key, r.key),
                  isFrameTop: checkCLB("T", c.key, r.key),
                  isFrameBottom: checkCLB("B", c.key, r.key), 

                  x: c.key,
                  y: r.key,
                  // onTap: () => onTap(c.key, r.key),
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

  checkCLB(String t, int cKey, int rKey) {
    if(Infomation.level == "初級") {
      return false;
    }

    if(Infomation.level == "中級") {
      if(Infomation.id == 2) { // 行
        if(t == "L") {
          return (borderListY.contains(rKey) && cKey == 0);
        } else if(t == "R") {
          return (borderListY.contains(rKey) && cKey == 8);
        } else if(t == "T") {
          return (borderListY.contains(rKey) || borderListY.contains(rKey-1));
        } else if(t == "B") {
          return (rKey == 8 && borderListY.contains(8));
        }        
      } else {
        return false;
      }
    }

    if(Infomation.level == "上級") {
      if(Infomation.id == 1) { // ブロック
        if(t == "L") {
          return ((borderListX.contains(cKey)) || borderListX.contains(cKey-3)) && (borderListY.contains(rKey) || borderListY.contains(rKey-1) || borderListY.contains(rKey-2));
        } else if(t == "R") {
          return ((cKey == 8 && borderListX.contains(6))) && (borderListY.contains(rKey) || borderListY.contains(rKey-1) || borderListY.contains(rKey-2));
        } else if(t == "T") {
          return ((borderListY.contains(rKey)) || borderListY.contains(rKey-3)) && (borderListX.contains(cKey) || borderListX.contains(cKey-1) || borderListX.contains(cKey-2));
        } else if(t == "B") {
          return ((rKey == 8 && borderListY.contains(6))) && (borderListX.contains(cKey) || borderListX.contains(cKey-1) || borderListX.contains(cKey-2));
        }
      } else if(Infomation.id == 2) { // マス
        if(t == "L") {
          return ((borderListX.contains(cKey) && borderListY.contains(rKey)) || (borderListX.contains(cKey-1) && borderListY.contains(rKey)));
        } else if(t == "R") {
          return (borderListX.contains(8) && cKey == 8 && borderListY.contains(rKey));
        } else if(t == "T") {
          return ((borderListX.contains(cKey) && borderListY.contains(rKey)) || (borderListX.contains(cKey) && borderListY.contains(rKey-1)));
        } else if(t == "B") {
          return (borderListX.contains(cKey) && borderListY.contains(8) && borderListY.contains(rKey));
        }
      } else if(Infomation.id == 3) { // 列
        if(t == "L") {
          return (borderListX.contains(cKey) || borderListX.contains(cKey-1));
        } else if(t == "R") {
          return (cKey == 8 && borderListX.contains(8));
        } else if(t == "T") {
          return (borderListX.contains(cKey) && rKey == 0);
        } else if(t == "B") {
          return (borderListX.contains(cKey) && rKey == 8);
        }
      } else if(Infomation.id == 4) { // 行
        if(t == "L") {
          return (borderListY.contains(rKey) && cKey == 0);
        } else if(t == "R") {
          return (borderListY.contains(rKey) && cKey == 8);
        } else if(t == "T") {
          return (borderListY.contains(rKey) || borderListY.contains(rKey-1));
        } else if(t == "B") {
          return (rKey == 8 && borderListY.contains(8));
        }        
      } else {
        return false;
      }
    }
  }
}