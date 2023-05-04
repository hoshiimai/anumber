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
import 'cell_init.dart';



class InitGrid extends StatelessWidget {
  const InitGrid({
    super.key,
    required this.data,
    required this.anim,
    required this.specifiedX,
    required this.specifiedY,
    required this.initX,
    required this.initY,
    required this.animCell,
    required this.showSkeleton,
  });
  final List<List<int>> data;
  final List<List<int>> anim;
  final int specifiedX;
  final int specifiedY;
  final int initX;
  final int initY;
  final bool animCell;
  final bool showSkeleton;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final MapEntry<int, List<int>> r in data.asMap().entries)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final MapEntry<int, int> c in r.value.asMap().entries)
                Init(
                  number: c.value,  // 数字
                  isInit: initX == c.key && initY == r.key,  // 選択マス判定
                  isCell: anim[r.key][c.key] == 2,
                  isSkeleton: showSkeleton,

                  // 指定マスの枠判定
                  isLeft: (specifiedX == c.key && specifiedY == r.key) || ((specifiedX + 1) == c.key && specifiedY == r.key),
                  isRight: specifiedX == 8 && c.key == 8 && specifiedY == r.key,
                  isTop: (specifiedX == c.key && specifiedY == r.key) || (specifiedX == c.key && (specifiedY + 1) == r.key),
                  isBottom: specifiedX == c.key && specifiedY == 8 && specifiedY == r.key, 
                  
                  x: c.key,
                  y: r.key,
                ),
            ],
          ),
      ],
    );
  }
}