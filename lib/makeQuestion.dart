import 'dart:math';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'infomation.dart';

class MakeQuestion {

  // Excelから問題の情報を取得する
  Future<void> getExcelValue() async {
    //解説のリストを初期化する
    Infomation.data = List.generate(9, (_) => List.filled(9, 0));
    Infomation.answer = List.generate(9, (_) => List.filled(9, 0));
    Infomation.allAnswers = List.generate(9, (_) => List.filled(9, 0));
    Infomation.tmp = List.generate(27, (_) => List.filled(27, 0));
    Infomation.answerCandidate = List.generate(27, (_) => List.filled(27, 0));
    Infomation.animation_candidate = List.generate(27, (_) => List.filled(27, 0));
    Infomation.dataList = [];
    Infomation.candidateList = [];
    Infomation.animationCandidateList = [];
    Infomation.sortingList = [];
    Infomation.initX = -1;
    Infomation.initX1 = -1;
    Infomation.initX2 = -1;
    Infomation.initX3 = -1;
    Infomation.initX4 = -1;
    Infomation.initY = -1;
    Infomation.initY1 = -1;
    Infomation.initY2 = -1;
    Infomation.initY3 = -1;
    Infomation.initY4 = -1;
    Infomation.frameBorderX = -100;
    Infomation.frameBorderY = -100;
    Infomation.borderListX = [-100];
    Infomation.borderListY = [-100];
    Infomation.borderXYList = [];

    final random = Random();
    final rowIndex = Infomation.level == "初級" ? random.nextInt(2) + 2
                   : Infomation.level == "中級" ? random.nextInt(5) + 2
                   :  3;

    final a_CellIndex = 'A$rowIndex';
    final b_CellIndex = 'B$rowIndex';
    final c_CellIndex = 'C$rowIndex';
    final d_CellIndex = 'D$rowIndex';
    final e_CellIndex = 'E$rowIndex';
    final f_CellIndex = 'F$rowIndex';
    final g_CellIndex = 'G$rowIndex';

    final List<int> line1=[0,1,2],line2=[3,4,5],line3=[6,7,8],
                    column1=[0,1,2],column2=[3,4,5],column3=[6,7,8];
    final List<int> blockLine1=[0,1,2],blockLine2=[3,4,5],blockLine3=[6,7,8],
                    blockColumn1=[0,1,2],blockColumn2=[3,4,5],blockColumn3=[6,7,8];
    final List<int> number = [1,2,3,4,5,6,7,8,9];

    List<List<int>> shuffle1 = List.generate(9, (_) => List.filled(9, 0)); // 問題
    List<List<int>> shuffle2 = List.generate(9, (_) => List.filled(9, 0)); // アニメーション
    List<List<int>> shuffle3 = List.generate(9, (_) => List.filled(9, 0)); // 全解答


    // line1.shuffle();
    // line2.shuffle();
    // line3.shuffle();
    // column1.shuffle();
    // column2.shuffle();
    // column3.shuffle();

    // blockLine1.shuffle();
    // blockLine2.shuffle();
    // blockLine3.shuffle();
    // blockColumn1.shuffle();
    // blockColumn2.shuffle();
    // blockColumn3.shuffle();
    // number.shuffle();

    final List<List<int>> lineToMerge = [line1, line2, line3];
    final List<List<int>> columnToMerge = [column1, column2, column3];
    // lineToMerge.shuffle();
    // columnToMerge.shuffle();

    final List<int> lineMerged = lineToMerge.expand((row) => row).toList();
    final List<int> columnMerged = columnToMerge.expand((row) => row).toList();


    final List<int> lineMergedCandidate = lineMerged.expand((e) => [e*3, e*3+1, e*3+2]).toList();
    final List<int> columnMergedCandidate = columnMerged.expand((e) => [e*3, e*3+1, e*3+2]).toList();

    final numberMap = {
      0 : 0,
      1 : number[0],
      2 : number[1],
      3 : number[2],
      4 : number[3],
      5 : number[4],
      6 : number[5],
      7 : number[6],
      8 : number[7],
      9 : number[8],
    };


    WidgetsFlutterBinding.ensureInitialized();
    // Excelファイルのパスを指定します
    final ByteData data = await rootBundle.load('assets/DB.xlsx');
    final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // ExcelファイルをパースしてWorkbookオブジェクトを作成します
    final excel = Excel.decodeBytes(bytes);
    // シート名を指定してSheetオブジェクトを作成します
    final sheet = excel[Infomation.level];
    // 特定のセルの値を取得します
    final id = sheet.cell(CellIndex.indexByString(a_CellIndex)).value;
    final mondai = sheet.cell(CellIndex.indexByString(b_CellIndex)).value;
    final animation = sheet.cell(CellIndex.indexByString(c_CellIndex)).value;
    final xCoordinate = sheet.cell(CellIndex.indexByString(d_CellIndex)).value;
    final yCoordinate = sheet.cell(CellIndex.indexByString(e_CellIndex)).value;
    final kotaeCoordinate = sheet.cell(CellIndex.indexByString(f_CellIndex)).value;
    final kotaeAllCoordinate = sheet.cell(CellIndex.indexByString(g_CellIndex)).value;

    //問題
    shuffle1 = mondai
            .toString()
            .trim() // 先頭と末尾の空白文字を削除
            .split('\n') // 改行で分割
            .map((row) => row.trim().split(' ').map(int.parse).toList()) // 各行を数値に変換
            .toList(); // 2次元リストに変換

    //アニメーション
    shuffle2 = animation
            .toString()
            .trim() // 先頭と末尾の空白文字を削除
            .split('\n') // 改行で分割
            .map((row) => row.trim().split(' ').map(int.parse).toList()) // 各行を数値に変換
            .toList(); // 2次元リストに変換
    //全解答
    shuffle3 = kotaeAllCoordinate
            .toString()
            .trim() // 先頭と末尾の空白文字を削除
            .split('\n') // 改行で分割
            .map((row) => row.trim().split(' ').map(int.parse).toList()) // 各行を数値に変換
            .toList(); // 2次元リストに変換
    

    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        // Infomation.init[i][j] = shuffle1[lineMerged[i]][columnMerged[j]];
        // Infomation.animation[i][j] = shuffle2[lineMerged[i]][columnMerged[j]];
        // Infomation.allAnswers[i][j] = shuffle3[lineMerged[i]][columnMerged[j]];
        Infomation.init[i][j] = numberMap[shuffle1[lineMerged[i]][columnMerged[j]]]!;
        Infomation.animation[i][j] = shuffle2[lineMerged[i]][columnMerged[j]];
        Infomation.allAnswers[i][j] = numberMap[shuffle3[lineMerged[i]][columnMerged[j]]]!;

      }
    }

    Infomation.selectedX = columnMerged.indexOf(xCoordinate);
    Infomation.selectedY = lineMerged.indexOf(yCoordinate);
    Infomation.kotae = numberMap[kotaeCoordinate]!;

    Infomation.id = id; 


    Infomation.answerX = columnMerged.indexOf(xCoordinate);
    Infomation.answerY = lineMerged.indexOf(yCoordinate);
    
    Infomation.columnList = columnMerged;
    Infomation.lineList = lineMerged;
    Infomation.candidateColumnList = columnMergedCandidate;
    Infomation.candidateLineList = lineMergedCandidate;
    Infomation.data = Infomation.init;

    Infomation.numMap = number;
  }
}