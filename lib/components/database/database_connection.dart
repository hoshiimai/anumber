import 'package:anumber/components/board/cell_candidate.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Database {
  static const _methodChannel = MethodChannel('work.hondakenya.flutterWidgetkit/sample');

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


    Future<void> insertCorrectCount(int count) async {
      final database = await openDatabase(
        'correctCount.db',
        version: 1,
        onCreate: (db, version) async {
          await db.execute('CREATE TABLE IF NOT EXISTS counts (id INTEGER PRIMARY KEY, count INTEGER)');
        },
      );

      final countData = {
        'count': count,
      };

      await database.insert('counts', countData,
          conflictAlgorithm: ConflictAlgorithm.replace);
      print('カウント　insert 成功');

      await database.close();
    }


    Future<Map<String, dynamic>?> getCountData() async {
      final database = await openDatabase(
        'your_database.db',
        version: 1,
        onCreate: (db, version) async {
          await db.execute('CREATE TABLE IF NOT EXISTS counts (id INTEGER PRIMARY KEY, count INTEGER)');
        },
      );

      final List<Map<String, dynamic>> results = await database.query('counts');

      if (results.isNotEmpty) {
        final countData = results.first;
        return {
          'id': countData['id'],
          'count': countData['count'],
        };
      }

      return null;
    }

    
  Future<void> insertCorrectCount1(id, int count) async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> countData = {
      'id': id.toString(),
      'count': count.toString(),
    };
      await prefs.setString('countData', jsonEncode(countData)); // 新規でデータを挿入する
      print('カウント　insert 成功');

      try {
        final result = await _methodChannel.invokeMethod('setCounterForWidgetKit');
        print(result);
      } on PlatformException catch (e) {
        print('${e.message}');
      }
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

  Future<List<String>> selectCorrectCount() async {
    final prefs = await SharedPreferences.getInstance();
    final dataJson = prefs.getString('countData');
    if (dataJson != null) {
      final countData = jsonDecode(dataJson);
      return [      
        countData['id'].toString(),
        countData['count'].toString(),
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
