import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Utils/exports.dart';

class TafsirServes with ChangeNotifier {
  Tafsir? tafsir;

  Future<void> getTaf({index}) async {
    if(tafsir==null) {
      final String response = await rootBundle.loadString(
          'assets/jsons/tafsir.json');
      final data = await json.decode(response)['tafsir'][index];
      tafsir = Tafsir.fromJson(data);
      notifyListeners();
    }else{
    }
  }
}
