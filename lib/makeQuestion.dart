import 'dart:math';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'infomation.dart';

class MakeQuestion {

  // Excelから問題の情報を取得する
  Future<void> getExcelValue() async {
    //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    final random = Random();
    final rowIndex = random.nextInt(2) + 2; // B2からB51(※現在はB3の範囲でテスト中)の範囲の行インデックスをランダムに選択
    final b_CellIndex = 'B$rowIndex';
    final c_CellIndex = 'C$rowIndex';
    final d_CellIndex = 'D$rowIndex';
    final e_CellIndex = 'E$rowIndex';
    final f_CellIndex = 'F$rowIndex';

    WidgetsFlutterBinding.ensureInitialized();
    // Excelファイルのパスを指定します
    final ByteData data = await rootBundle.load('assets/DB.xlsx');
    final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // ExcelファイルをパースしてWorkbookオブジェクトを作成します
    final excel = Excel.decodeBytes(bytes);
    // シート名を指定してSheetオブジェクトを作成します
    final sheet = excel['elementary'];
    // 特定のセルの値を取得します
    final mondai = sheet.cell(CellIndex.indexByString(b_CellIndex)).value;
    final animation = sheet.cell(CellIndex.indexByString(c_CellIndex)).value;
    final x_Coordinate = sheet.cell(CellIndex.indexByString(d_CellIndex)).value;
    final y_Coordinate = sheet.cell(CellIndex.indexByString(e_CellIndex)).value;
    final kotae_Coordinate = sheet.cell(CellIndex.indexByString(f_CellIndex)).value;

    Infomation.init = mondai
            .toString()
            .trim() // 先頭と末尾の空白文字を削除
            .split('\n') // 改行で分割
            .map((row) => row.trim().split(' ').map(int.parse).toList()) // 各行を数値に変換
            .toList(); // 2次元リストに変換

    Infomation.animation = animation
            .toString()
            .trim() // 先頭と末尾の空白文字を削除
            .split('\n') // 改行で分割
            .map((row) => row.trim().split(' ').map(int.parse).toList()) // 各行を数値に変換
            .toList(); // 2次元リストに変換
    
    Infomation.const_animation = Infomation.animation;
    Infomation.selectedX = x_Coordinate;
    Infomation.selectedY = y_Coordinate;
    Infomation.kotae = kotae_Coordinate;

    print(Infomation.init);
    print(Infomation.animation);
    print(Infomation.selectedX);
    print(Infomation.selectedY);
    print(Infomation.kotae);

    //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  }
}