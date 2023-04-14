import 'package:anumber/components/board/cell_candidate.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Database {

  Future<void> insertDB(timer, List<List<int>> value, List<List<int>> zero, List<List<int>> candidate, String level) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', 999);
    prefs.setString('time', timer.toString());
    prefs.setString('value', jsonEncode(value));
    prefs.setString('zero', jsonEncode(zero));
    prefs.setString('candidate', jsonEncode(candidate));
    prefs.setString('level', level.toString());


    print('insert 成功');
  }


  Future<List> selectDB() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    final time = prefs.getString('time');
    final value = prefs.getString('value');
    final zero = prefs.getString('zero');
    final candidate = prefs.getString('candidate');
    if (id != null) {
      print('------------------------------------------------------------------------------------------------');
      print('Time: $time');
      print('------------------------------------------------------------------------------------------------');
      // print('Value: $value');
      // print('------------------------------------------------------------------------------------------------');
      // print('init: $zero');
      // print('------------------------------------------------------------------------------------------------');
      // print('candidate: $candidate');
      // print('------------------------------------------------------------------------------------------------');
      print('☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆');
      print("id: $id");
      print('☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆');
      return [time, value, zero, candidate];

    }
    
    return [];
  }


  Future<void> deleteDB() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
    prefs.remove('time');
    prefs.remove('value');
    prefs.remove('zero');
    prefs.remove('candidate');
    
    print('delete 成功');
  }
}
