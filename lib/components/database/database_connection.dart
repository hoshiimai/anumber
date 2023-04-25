import 'package:anumber/components/board/cell_candidate.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Database {

  Future<void> insertDB(
    id, 
    timer, 
    List<List<int>> value,
    List<List<int>> zero,
    List<List<int>> candidate,
    int specifiedX,
    int specifiedY,
    int kotae,
    String level,
    bool sound
    ) async {
      final prefs = await SharedPreferences.getInstance();
      final Map<String, dynamic> data = {
        'id': id.toString(),
        'time': timer.toString(),
        'value': jsonEncode(value),
        'zero': jsonEncode(zero),
        'candidate': jsonEncode(candidate),
        'specifiedX': specifiedX.toString(),
        'specifiedY': specifiedY.toString(),
        'kotae': kotae.toString(),
        'level': level.toString(),
        'sound': sound
      };
      // await prefs.clear(); // 既存のデータを消去する
      await prefs.setString('data', jsonEncode(data)); // 新規でデータを挿入する
      print('insert 成功');
    }



  Future<List<String>> selectDB() async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString('data');
    if (dataJson != null) {
      final data = jsonDecode(dataJson);
      return [      
        data['id'].toString(),
        data['time'].toString(),
        data['value'],
        data['zero'],
        data['candidate'],
        data['specifiedX'].toString(),
        data['specifiedY'].toString(),
        data['kotae'].toString(),
        data['level'].toString(),
      ];
    }
    print('select失敗');
    return [];
  }




  Future<void> deleteDB() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('データをすべて削除しました');
  }

}
