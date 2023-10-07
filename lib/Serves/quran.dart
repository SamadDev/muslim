import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';
import 'package:islamic360/Utils/exports.dart';

class QuranServes with ChangeNotifier {
  List<Quran> _quran = [];


  List<Quran> get quran_list => _quran;

  Future<void> getQuran({index}) async {
    try{
    if (_quran.isEmpty || index != null) {
      final String response =
          await rootBundle.loadString('assets/jsons/quran.json');
      final data = await json.decode(response)['surahs'];

      _quran = data.map<Quran>((e) => Quran.fromJson(e)).toList();
      print(_quran.length);
      notifyListeners();
    }}catch(e){
      print(e);
    }
  }

  Quran ayahs(index) {
    return _quran.firstWhere((e) => e.number == index);
  }

var list=[];

   groupByName(index) {
      List<Ayahs>? ayah =_quran.firstWhere((e) => e.number == index).ayahs;
    Map groups = groupBy(ayah!, (Ayahs e) {
      return e.page;
    });
    print(groups);
  }

  List<Quran> search_surah_list = [];

  void search_surah(value) {
    search_surah_list = _quran.where(
      (e) {
        if (e.name!.contains(value)) {
          return e.name!.contains(value);
        } else if (e.number.toString().contains(value)) {
          return e.number.toString().contains(value);
        } else
          return false;
      },
    ).toList();
    notifyListeners();
  }

}
