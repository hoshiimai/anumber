// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// class DatabaseHelper {
  
//   static const _databaseName = "MyDatabase.db"; // DB名
//   static const _databaseVersion = 1; // 1で固定？
//   static const table = 'info'; // テーブル名
  
//   // static const id = 'id'; // 列1
//   static const count = 'count'; // 列2
//   // DatabaseHelperクラスをシングルトンにするためのコンストラクタ
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
//   // DBにアクセスするためのメソッド
//   static Database? _database;
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

  
//   // データベースを開く。データベースがない場合は作る関数
//   _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory(); // アプリケーション専用のファイルを配置するディレクトリへのパスを返す
//     String path = join(documentsDirectory.path, _databaseName); // joinはセパレーターでつなぐ関数
//     // pathのDBを開く。なければonCreateの処理がよばれる。onCreateでは_onCreateメソッドを呼び出している
//     return await openDatabase(path,
//         version: _databaseVersion,
//         onCreate: _onCreate);
//   }
//   // DBを作成するメソッド
//   Future _onCreate(Database db, int version) async {
//     // ダブルクォートもしくはシングルクォート3つ重ねることで改行で文字列を作成できる。$変数名は、クラス内の変数のこと（文字列の中で使える）
//     await db.execute('''
//           CREATE TABLE $table (
//             id INTEGER PRIMARY KEY,
//             $count INTEGER NOT NULL
//           )
//           ''');
//   }
  
//   // Helper methods
//   // 挿入
//   Future<int> insert(Map<String, dynamic> row) async {
//     Database db = await instance.database; //DBにアクセスする
//     return await db.insert(table, row); //テーブルにマップ型のものを挿入。追加時のrowIDを返り値にする
//   }
//   // 全件取得
//   Future<List<Map<String, dynamic>>> queryAllRows() async {
//     Database db = await instance.database; //DBにアクセスする
//     return await db.query(table); //全件取得
//   }
//   // // データ件数取得
//   // Future<int?> queryRowCount() async {
//   //   Database db = await instance.database; //DBにアクセスする
//   //   return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
//   // }
//   // // 更新
//   // Future<int> update(Map<String, dynamic> row) async {
//   //   Database db = await instance.database; //DBにアクセスする
//   //   int id = row[id]; //引数のマップ型のcolumnIDを取得
//   //   print([id]);
//   //   return await db.update(table, row, where: '$id = ?', whereArgs: [id]);
//   // }
//   // // 削除
//   // Future<int> delete(int id) async {
//   //   Database db = await instance.database;
//   //   return await db.delete(table, where: '$id = ?', whereArgs: [id]);
//   // }
// }