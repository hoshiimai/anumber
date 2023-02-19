import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DB {
  final String _tableName = "testDB";
  late Database _db;
  int id = 999;



  Future<void> saveData(List<List<int>> value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', 999);
    // prefs.setString('time', DateTime.now().toIso8601String());
    prefs.setString('value', jsonEncode(value));
  }

  Future<List<List<int>>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    // final time = prefs.getString('time');
    final value = prefs.getString('value');
    if (value != null) {
      // print('--------------------------------');
      // print(time);
      print('--------------------------------');
      print(value);
      print('--------------------------------');
    final decodedValue = jsonDecode(value) as List<dynamic>;
    return List.castFrom<dynamic, List<int>>(decodedValue);
    }
    return [];
  }

  Future<void> initDatabase() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), "stopwatch_database.db"),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER, time TEXT, zero INTEGER, data INTEGER, tmp INTEGER)",
        );
      },
      version: 1,
    );
    print('init');
  }


  Future<bool> isExist() async {
    await initDatabase();
    try {
      List<Map<String, dynamic>> existingRecord = await _db.query(_tableName, where: "id = $id");
      if (existingRecord.isNotEmpty) {
        print('trueを返すよ');
        return true;
      } else {
        print('falseを返すよ');
        return false;
      }
    } catch (e) {
      return false;
    }
  }


  // Future<void> insertStopwatchData(DateTime time) async {
  //   try {
  //     await initDatabase();

  //     await _db.rawInsert(
  //       "INSERT OR REPLACE INTO $_tableName (id, time) VALUES ($id, ?)",
  //       [time.toIso8601String()],
  //     );
  //     print("insert 成功");
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> insertDatabase(DateTime time, List<List<int>> zero, List<List<int>> data, List<List<int>> tmp) async {
    try {
      await initDatabase();
      var values = [];

      for (var i = 0; i < zero.length; i++) {
        for (var j = 0; j < zero[i].length; j++) {
          values.add([id, time.toIso8601String(), i, j, zero[i][j]]);
        }
      }

      for (var i = 0; i < data.length; i++) {
        for (var j = 0; j < data[i].length; j++) {
          values.add([id, time.toIso8601String(), i, j, data[i][j]]);
        }
      }

      for (var i = 0; i < tmp.length; i++) {
        for (var j = 0; j < tmp[i].length; j++) {
          values.add([id, time.toIso8601String(), i, j, tmp[i][j]]);
        }
      }

      await _db.transaction((txn) async {
        for (var value in values) {
          await txn.rawInsert(
            "INSERT OR REPLACE INTO $_tableName (id, time, zero, data, tmp) VALUES ($id, ?, ?, ?, ?)",
            value,
          );
        }
      });
      print("insert 成功");
    } catch (e) {
      print(e);
    }
  }














  Future<void> updateStopwatchData(DateTime time) async {
    try {
      await _db.update(
        _tableName,
        {"time": time.toIso8601String()},
        where: "id = $id",
      );
      print("update 成功");
    } catch (e) {
      print(e);
    }
  }

  Future<String> getStopwatchData() async {
    final List<Map<String, dynamic>> maps = await _db.query(_tableName);
    // final String = await _db.query(_tableName, where: "id = 999");

    try {
      // return List.generate(maps.length, (i) {
      print(DateFormat.ms().format(DateTime.parse(maps[0]["time"])));
      return  DateFormat.ms().format(DateTime.parse(maps[0]["time"]));
      // });
    } catch (e) {
      print(e);
      return "";
    }
  }

  Future<void> printStopwatchData() async {
    try{
      final List<Map<String, dynamic>> maps = await _db.query(_tableName);

      for (int i = 0; i < maps.length; i++) {
        print(maps[i]["id"]);
        print(DateTime.parse(maps[i]["time"]));
        print(DateTime.parse(maps[i]["init"]));
      }
      print("select1 成功");
    } catch (e) {
      print("An error occurred while querying the database: $e");
    }
  }

  Future<void> deleteAllStopwatchData() async {
    try {
      final tables = await _db.rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
      if (tables.isNotEmpty && tables.any((table) => table['name'] == _tableName)) {
        await _db.delete(_tableName);
      }
      print("delete 成功");
    } catch (e) {
      print("An error occurred while deleting data from the database: $e");
    }
  }

  Future<void> dispose() async {
    try {
      await _db.delete(_tableName);
    } catch (e) {
      print("An error occurred while deleting data from the database: $e");
    }
  }
}
