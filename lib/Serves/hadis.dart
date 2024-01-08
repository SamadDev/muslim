import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Modules/Nawawy.dart';
import 'package:islamic360/Modules/muslim.dart';
import 'package:islamic360/Utils/exports.dart';

class HadisServer with ChangeNotifier {
  List<Muslim> muslimList_title = [];
  List<Muslim> muslimList_content = [];
  List<Nawawy> nawawyList = [];

  Future<void> getMuslimTitle({title}) async {
    final String response = await rootBundle.loadString('assets/jsons/muslim.json');
    final data = await json.decode(response);
    muslimList_title = data.map<Muslim>((e) => Muslim.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> getMuslimContent({dihikrId}) async {
    final String response = await rootBundle.loadString('assets/jsons/muslim.json');
    final data = await json.decode(response);
    muslimList_content = data.map<Muslim>((e) => Muslim.fromJson(e)).toList();
    muslimList_content = muslimList_content.where((element) => element.iD.toString() == dihikrId.toString()).toList();
    print(muslimList_content);
    notifyListeners();
  }

  List<Muslim> search_muslim_title = [];

  void search_surah(value) {
    search_muslim_title = muslimList_title.where(
      (e) {
        if (e.book.toString().contains(value)) {
          return e.book.toString().contains(value);
        } else
          return false;
      },
    ).toList();
    notifyListeners();
  }
}
