//   final String _tableName = "infomation";
//   late Database _db;
//   int id = 999;


//   Future<void> initDatabase() async {
//     _db = await openDatabase(
//       join(await getDatabasesPath(), "stopwatch_database.db"),
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE $_tableName(id INTEGER, time TEXT, init INTEGER, data INTEGER, tmp INTEGER)",
//         );
//       },
//       version: 1,
//     );
//     print('init');
//   }


// initDatabase()は、_tableNameが存在しない場合(最初の時)にエラーになります。
// 修正してください。

