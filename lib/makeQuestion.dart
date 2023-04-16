import 'dart:math';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'infomation.dart';

class MakeQuestion {

  // Excelから問題の情報を取得する
  Future<void> getExcelValue() async {
    final random = Random();
    final rowIndex = random.nextInt(2) + 2; // B2からB51(※現在はB2の範囲でテスト中)の範囲の行インデックスをランダムに選択
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

    List<List<int>> shuffle1 = List.generate(9, (_) => List.filled(9, 0)); // 問題1
    List<List<int>> shuffle2 = List.generate(9, (_) => List.filled(9, 0)); // 問題2
    List<List<int>> shuffle3 = List.generate(9, (_) => List.filled(9, 0)); // アニメーション1
    List<List<int>> shuffle4 = List.generate(9, (_) => List.filled(9, 0)); // アニメーション2
    List<List<int>> shuffle5 = List.generate(9, (_) => List.filled(9, 0)); // 全解答1
    List<List<int>> shuffle6 = List.generate(9, (_) => List.filled(9, 0)); // 全解答2

    // line1.shuffle();
    // line2.shuffle();
    // line3.shuffle();
    // column1.shuffle();
    // column2.shuffle();
    // column3.shuffle();

    blockLine1.shuffle();
    blockLine2.shuffle();
    blockLine3.shuffle();
    blockColumn1.shuffle();
    blockColumn2.shuffle();
    blockColumn3.shuffle();
    number.shuffle();
    final List<int> lineMerged = line1 + line2 + line3;
    final List<int> columnMerged = column1 + column2 + column3;
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
    final sheet = excel['初級'];
    // 特定のセルの値を取得します
    final id = sheet.cell(CellIndex.indexByString(a_CellIndex)).value;
    final mondai = sheet.cell(CellIndex.indexByString(b_CellIndex)).value;
    final animation = sheet.cell(CellIndex.indexByString(c_CellIndex)).value;
    final xCoordinate = sheet.cell(CellIndex.indexByString(d_CellIndex)).value;
    final yCoordinate = sheet.cell(CellIndex.indexByString(e_CellIndex)).value;
    final kotaeCoordinate = sheet.cell(CellIndex.indexByString(f_CellIndex)).value;
    final kotaeAllCoordinate = sheet.cell(CellIndex.indexByString(g_CellIndex)).value;

    shuffle1 = mondai
            .toString()
            .trim() // 先頭と末尾の空白文字を削除
            .split('\n') // 改行で分割
            .map((row) => row.trim().split(' ').map(int.parse).toList()) // 各行を数値に変換
            .toList(); // 2次元リストに変換

    shuffle3 = animation
            .toString()
            .trim() // 先頭と末尾の空白文字を削除
            .split('\n') // 改行で分割
            .map((row) => row.trim().split(' ').map(int.parse).toList()) // 各行を数値に変換
            .toList(); // 2次元リストに変換

    shuffle5 = kotaeAllCoordinate
            .toString()
            .trim() // 先頭と末尾の空白文字を削除
            .split('\n') // 改行で分割
            .map((row) => row.trim().split(' ').map(int.parse).toList()) // 各行を数値に変換
            .toList(); // 2次元リストに変換


    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        for (var l = 0; l < 9; l++) { 
          shuffle2[0][l] = shuffle1[line1[0]][l];
          shuffle2[1][l] = shuffle1[line1[1]][l];
          shuffle2[2][l] = shuffle1[line1[2]][l];
          shuffle2[3][l] = shuffle1[line2[0]][l];
          shuffle2[4][l] = shuffle1[line2[1]][l];
          shuffle2[5][l] = shuffle1[line2[2]][l];
          shuffle2[6][l] = shuffle1[line3[0]][l];
          shuffle2[7][l] = shuffle1[line3[1]][l];
          shuffle2[8][l] = shuffle1[line3[2]][l];

          shuffle4[0][l] = shuffle3[line1[0]][l];
          shuffle4[1][l] = shuffle3[line1[1]][l];
          shuffle4[2][l] = shuffle3[line1[2]][l];
          shuffle4[3][l] = shuffle3[line2[0]][l];
          shuffle4[4][l] = shuffle3[line2[1]][l];
          shuffle4[5][l] = shuffle3[line2[2]][l];
          shuffle4[6][l] = shuffle3[line3[0]][l];
          shuffle4[7][l] = shuffle3[line3[1]][l];
          shuffle4[8][l] = shuffle3[line3[2]][l];

          shuffle6[0][l] = shuffle5[line1[0]][l];
          shuffle6[1][l] = shuffle5[line1[1]][l];
          shuffle6[2][l] = shuffle5[line1[2]][l];
          shuffle6[3][l] = shuffle5[line2[0]][l];
          shuffle6[4][l] = shuffle5[line2[1]][l];
          shuffle6[5][l] = shuffle5[line2[2]][l];
          shuffle6[6][l] = shuffle5[line3[0]][l];
          shuffle6[7][l] = shuffle5[line3[1]][l];
          shuffle6[8][l] = shuffle5[line3[2]][l];

          // shuffle2[0][l] = numberMap[shuffle1[line1[0]][l]]!;
          // shuffle2[1][l] = numberMap[shuffle1[line1[1]][l]]!;
          // shuffle2[2][l] = numberMap[shuffle1[line1[2]][l]]!;
          // shuffle2[3][l] = numberMap[shuffle1[line2[0]][l]]!;
          // shuffle2[4][l] = numberMap[shuffle1[line2[1]][l]]!;
          // shuffle2[5][l] = numberMap[shuffle1[line2[2]][l]]!;
          // shuffle2[6][l] = numberMap[shuffle1[line3[0]][l]]!;
          // shuffle2[7][l] = numberMap[shuffle1[line3[1]][l]]!;
          // shuffle2[8][l] = numberMap[shuffle1[line3[2]][l]]!;

          // shuffle4[0][l] = shuffle3[line1[0]][l];
          // shuffle4[1][l] = shuffle3[line1[1]][l];
          // shuffle4[2][l] = shuffle3[line1[2]][l];
          // shuffle4[3][l] = shuffle3[line2[0]][l];
          // shuffle4[4][l] = shuffle3[line2[1]][l];
          // shuffle4[5][l] = shuffle3[line2[2]][l];
          // shuffle4[6][l] = shuffle3[line3[0]][l];
          // shuffle4[7][l] = shuffle3[line3[1]][l];
          // shuffle4[8][l] = shuffle3[line3[2]][l];

          // shuffle6[0][l] = numberMap[shuffle5[line1[0]][l]]!;
          // shuffle6[1][l] = numberMap[shuffle5[line1[1]][l]]!;
          // shuffle6[2][l] = numberMap[shuffle5[line1[2]][l]]!;
          // shuffle6[3][l] = numberMap[shuffle5[line2[0]][l]]!;
          // shuffle6[4][l] = numberMap[shuffle5[line2[1]][l]]!;
          // shuffle6[5][l] = numberMap[shuffle5[line2[2]][l]]!;
          // shuffle6[6][l] = numberMap[shuffle5[line3[0]][l]]!;
          // shuffle6[7][l] = numberMap[shuffle5[line3[1]][l]]!;
          // shuffle6[8][l] = numberMap[shuffle5[line3[2]][l]]!;
        }
        for (var r = 0; r < 9; r++) {
          Infomation.init[r][0] = shuffle2[r][column1[0]];
          Infomation.init[r][1] = shuffle2[r][column1[1]];
          Infomation.init[r][2] = shuffle2[r][column1[2]];
          Infomation.init[r][3] = shuffle2[r][column2[0]];
          Infomation.init[r][4] = shuffle2[r][column2[1]];
          Infomation.init[r][5] = shuffle2[r][column2[2]];
          Infomation.init[r][6] = shuffle2[r][column3[0]];
          Infomation.init[r][7] = shuffle2[r][column3[1]];
          Infomation.init[r][8] = shuffle2[r][column3[2]];

          Infomation.animation[r][0] = shuffle4[r][column1[0]];
          Infomation.animation[r][1] = shuffle4[r][column1[1]];
          Infomation.animation[r][2] = shuffle4[r][column1[2]];
          Infomation.animation[r][3] = shuffle4[r][column2[0]];
          Infomation.animation[r][4] = shuffle4[r][column2[1]];
          Infomation.animation[r][5] = shuffle4[r][column2[2]];
          Infomation.animation[r][6] = shuffle4[r][column3[0]];
          Infomation.animation[r][7] = shuffle4[r][column3[1]];
          Infomation.animation[r][8] = shuffle4[r][column3[2]];

          Infomation.allAnswers[r][0] = shuffle6[r][column1[0]];
          Infomation.allAnswers[r][1] = shuffle6[r][column1[1]];
          Infomation.allAnswers[r][2] = shuffle6[r][column1[2]];
          Infomation.allAnswers[r][3] = shuffle6[r][column2[0]];
          Infomation.allAnswers[r][4] = shuffle6[r][column2[1]];
          Infomation.allAnswers[r][5] = shuffle6[r][column2[2]];
          Infomation.allAnswers[r][6] = shuffle6[r][column3[0]];
          Infomation.allAnswers[r][7] = shuffle6[r][column3[1]];
          Infomation.allAnswers[r][8] = shuffle6[r][column3[2]];

          // Infomation.init[r][0] = shuffle2[r][column1[0]];
          // Infomation.init[r][1] = shuffle2[r][column1[1]];
          // Infomation.init[r][2] = shuffle2[r][column1[2]];
          // Infomation.init[r][3] = shuffle2[r][column2[0]];
          // Infomation.init[r][4] = shuffle2[r][column2[1]];
          // Infomation.init[r][5] = shuffle2[r][column2[2]];
          // Infomation.init[r][6] = shuffle2[r][column3[0]];
          // Infomation.init[r][7] = shuffle2[r][column3[1]];
          // Infomation.init[r][8] = shuffle2[r][column3[2]];

          // Infomation.animation[r][0] = shuffle4[r][column1[0]];
          // Infomation.animation[r][1] = shuffle4[r][column1[1]];
          // Infomation.animation[r][2] = shuffle4[r][column1[2]];
          // Infomation.animation[r][3] = shuffle4[r][column2[0]];
          // Infomation.animation[r][4] = shuffle4[r][column2[1]];
          // Infomation.animation[r][5] = shuffle4[r][column2[2]];
          // Infomation.animation[r][6] = shuffle4[r][column3[0]];
          // Infomation.animation[r][7] = shuffle4[r][column3[1]];
          // Infomation.animation[r][8] = shuffle4[r][column3[2]];

          // Infomation.allAnswers[r][0] = shuffle6[r][column1[0]];
          // Infomation.allAnswers[r][1] = shuffle6[r][column1[1]];
          // Infomation.allAnswers[r][2] = shuffle6[r][column1[2]];
          // Infomation.allAnswers[r][3] = shuffle6[r][column2[0]];
          // Infomation.allAnswers[r][4] = shuffle6[r][column2[1]];
          // Infomation.allAnswers[r][5] = shuffle6[r][column2[2]];
          // Infomation.allAnswers[r][6] = shuffle6[r][column3[0]];
          // Infomation.allAnswers[r][7] = shuffle6[r][column3[1]];
          // Infomation.allAnswers[r][8] = shuffle6[r][column3[2]];
        }
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
    Infomation.data = Infomation.init;


    print(Infomation.id);
    // print(columnMerged);
    // print(lineMerged);
    // print(Infomation.allAnswers);
    // print(Infomation.animation);
    // print(Infomation.const_animation);
    // print(number);
    // print(Infomation.selectedX);
    // print(Infomation.selectedY);
    // print(column_merged.indexOf(x_Coordinate));
    // print(line_merged.indexOf(y_Coordinate));
    // print(Infomation.kotae);

  }
}