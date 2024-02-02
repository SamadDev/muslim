import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Modules/muslim.dart';

class HadisServer with ChangeNotifier {
  List<Muslim> muslimList_title = [];
  List<Muslim> muslimList_content = [];

  Future<void> getMuslimTitle({title}) async {
    try {
      final String response = await rootBundle.loadString('assets/jsons/muslim.json');
      final res = await json.decode(response);
      muslimList_title = res.map<Muslim>((e) => Muslim.fromJson(e)).toList();
      muslimList_content=muslimList_title;
      print(muslimList_content.length);
      muslimList_title = removeDuplicatesByTitle(muslimList_title);
      print(muslimList_title.length);
      notifyListeners();
    } catch (e) {
      print("muslim hadis error is: $e");
    }
  }

  // Remove duplicates based on 'title' property

  List<Muslim> removeDuplicatesByTitle(List<Muslim> list) {
    // Map to keep track of seen titles
    final Map<String, Muslim> seenTitles = {};

    // Filter and store unique titles
    List<Muslim> uniqueList = [];
    for (var muslim in list) {
      if (!seenTitles.containsKey(muslim.book)) {
        seenTitles[muslim.book!] = muslim;
        uniqueList.add(muslim);
      }
    }

    return uniqueList;
  }

  Future<void> getMuslimContent({title}) async {
    final String response = await rootBundle.loadString('assets/jsons/muslim.json');
    final res = await json.decode(response);
    muslimList_content = res.map<Muslim>((e) => Muslim.fromJson(e)).toList();
    muslimList_content = muslimList_content.where((element) => element.book.toString() == title.toString()).toList();
    print(muslimList_content.length);
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
