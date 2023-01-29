import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StopwatchDatabase {
  final String _tableName = "stopwatch";
  late Database _db;
  int id = 999;


  Future<void> initDatabase() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), "stopwatch_database.db"),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER, time TEXT)",
        );
      },
      version: 1,
    );
  }


  Future<bool> isResume() async {
      await initDatabase();

      List<Map<String, dynamic>> existingRecord = await _db.query(_tableName, where: "id = $id");
      if (existingRecord.isEmpty) {
        return false;
      } else {
        return true;
      }
  }


  Future<void> insertStopwatchData(DateTime time) async {
    try {
      await initDatabase();

      await _db.rawInsert(
        "INSERT OR REPLACE INTO $_tableName (id, time) VALUES ($id, ?)",
        [time.toIso8601String()],
      );
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

  Future<List<DateTime>> getStopwatchData() async {
    // final List<Map<String, dynamic>> maps = await _db.query(_tableName);
    final List<Map<String, dynamic>> maps = await _db.query(_tableName, where: "id = 999");

    try {
      return List.generate(maps.length, (i) {
        return DateTime.parse(maps[i]["time"]);
      });
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> printStopwatchData() async {
    try{
      final List<Map<String, dynamic>> maps = await _db.query(_tableName);

      for (int i = 0; i < maps.length; i++) {
        print(maps[i]["id"]);
        print(DateTime.parse(maps[i]["time"]));
      }
      print("select 成功");
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
