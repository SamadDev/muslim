import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Modules/question_title.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io' as io;
import 'package:url_launcher/url_launcher.dart';



class QuestionTitleService with ChangeNotifier {
  List<QuestionTitle> question_title_list = [];
  Database? _db;
  Future<void> init() async {
    io.Directory applicationDirectory = await getApplicationDocumentsDirectory();
    String questionDbPath = path.join(applicationDirectory.path, "question.db");
    print(questionDbPath);
    bool questionDb = await io.File(questionDbPath).exists();
    if (!questionDb) {
      ByteData data = await rootBundle.load(path.join("assets", "question.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await io.File(questionDbPath).writeAsBytes(bytes, flush: true);
    }
    _db = await openDatabase(questionDbPath);
  }

  Future<void> getQuestionTitle() async {
    try {
      await init();
      if (_db == null) {
        throw "bd is not initiated, initiate using [init(db)] function";
      }
      await _db!.transaction((txn) async {
        var data = await txn.query(
          "catagore",
          columns: [
            "id",
            "title",
          ],
        );
        question_title_list = data.map((e) => QuestionTitle.fromJson(e)).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  void openGmailAndComposeEmail() async {
    final email = 'info@ali-xan.com';
    final subject = 'پرسیاری شەرعی لە ماڵپەڕەوە';
    final body = 'تکایە پرسیارەکەت لێرەبنوسە';

    final url = 'mailto:$email?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<QuestionTitle> search_question_title = [];

  void search_surah(value) {
    search_question_title = question_title_list.where(
      (e) {
        if (e.name.toString().contains(value)) {
          return e.name.toString().contains(value);
        } else
          return false;
      },
    ).toList();
    notifyListeners();
  }
}
