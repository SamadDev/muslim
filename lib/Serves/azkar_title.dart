import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Utils/exports.dart';

class Azkar_title_Server with ChangeNotifier {
  List<AzkarTitle> _azkar_title=[];

  List<AzkarTitle> get azkar_title_list => _azkar_title;

  Future<void> getAzkarTitle() async {
    final String response =
        await rootBundle.loadString('assets/jsons/azkar_title.json');
    final data = await json.decode(response)['data'];
    _azkar_title = data.map<AzkarTitle>((e) => AzkarTitle.fromJson(e)).toList();
    notifyListeners();
  }

  List<AzkarTitle> search_azkar_title = [];

  void search_surah(value) {
    search_azkar_title = azkar_title_list.where(
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
