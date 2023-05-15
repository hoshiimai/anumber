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
import 'package:anumber/components/answer/cell_answer_CLB.dart';
import 'package:anumber/infomation.dart';
import 'package:flutter/material.dart';


class AnswerGridCLB extends StatelessWidget {
  const AnswerGridCLB({
    super.key,
    required this.data,
    required this.borderListX,
    required this.borderListY,
  });
  final List<List<int>> data;
  final List<int> borderListX;
  final List<int> borderListY;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final MapEntry<int, List<int>> r in data.asMap().entries)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final MapEntry<int, int> c in r.value.asMap().entries)
                AnswerCLB(
                  // 解説用　行・列を枠線でハイライト
                  isFrameLeft: checkCLB("L", c.key, r.key),
                  isFrameRight: checkCLB("R", c.key, r.key),
                  isFrameTop: checkCLB("T", c.key, r.key),
                  isFrameBottom: checkCLB("B", c.key, r.key), 
                ),
            ],
          ),
      ],
    );
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