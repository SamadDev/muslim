import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Utils/exports.dart';

class TafsirServes with ChangeNotifier {
  Tafsir? tafsir;
  var data;

  Future<void> getTaf({index}) async {
    if (data == null) {
      final String response = await rootBundle.loadString('assets/jsons/tafsir.json');
      data = await json.decode(response)['tafsir'];
    }
    tafsir = Tafsir.fromJson(data[index]);
  }
}
