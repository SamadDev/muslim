import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Utils/exports.dart';

class GlyphService with ChangeNotifier {
  List<GlyphModule> _glyph = [];

  List<GlyphModule> get glyph => _glyph;

  Future<void> getGlyph(pageNumber) async {
    try {
      final String response = await rootBundle.loadString('assets/jsons/glyph.json');
      final data = await json.decode(response);
      _glyph = data.map<GlyphModule>((e) => GlyphModule.fromJson(e)).toList();
      _glyph = _glyph.where((element) => element.pageNumber.toString() == pageNumber.toString()).toList();
      print(_glyph.length);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}



// class GlyphServiceDb with ChangeNotifier {
//   List<Map<String, dynamic>> _data = [];
//
//   List<Map<String, dynamic>> get data => _data;
//
//   Future<void> fetchData() async {
//     try {
//       List<Map<String, dynamic>> fetchedData = await DatabaseHelper.instance.fetchData();
//       _data = fetchedData;
//       notifyListeners();
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }
//   }
//
// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._();
//   static Database? _database;
//
//   DatabaseHelper._();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     String path = join(appDocDir.path, 'your_database.db');
//
//     if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
//       ByteData data = await rootBundle.load('assets/your_database.db');
//       List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//       await File(path).writeAsBytes(bytes);
//     }
//
//     return await openDatabase(path);
//   }
//
//   Future<List<Map<String, dynamic>>> fetchData() async {
//     Database db = await instance.database;
//     return await db.query('your_table_name');
//   }
// }
