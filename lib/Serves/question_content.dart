import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Modules/quesion_content.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io' as io;
import 'package:html/parser.dart';

class QuestionServer with ChangeNotifier {
  List<QuestionContent> _question = [];
  List<QuestionContent> get question_list => _question;

  Database? _db;

  Future<void> init() async {
    io.Directory applicationDirectory = await getApplicationDocumentsDirectory();
    String questionDbPath = path.join(applicationDirectory.path, "question.db");
    bool questionDb = await io.File(questionDbPath).exists();
    if (!questionDb) {
      ByteData data = await rootBundle.load(path.join("assets", "question.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      print(bytes);
      await io.File(questionDbPath).writeAsBytes(bytes, flush: true);
    }
    _db = await openDatabase(questionDbPath);
  }

  Future<void> getQuestion({titleId}) async {
    try {
      await init();
      if (_db == null) {
        throw "bd is not initiated, initiate using [init(db)] function";
      }
      await _db!.transaction((txn) async {
        var data = await txn.query(
          "data",
          columns: [
            "id",
            "title",
            "cat_id",
            "ask",
            "question",
          ],
        );
        _question = data.map((e) => QuestionContent.fromJson(e)).toList();
        _question = _question.where((element) => element.catId.toString() == titleId.toString()).toList();
      });
    } catch (e) {
      print(e);
    }
  }




  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
