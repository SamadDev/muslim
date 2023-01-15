import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Utils/exports.dart';

class DuaServse with ChangeNotifier {
  List<Dua> _dua = [];

  List<Dua> get dua => _dua;

  Future<void> getDua() async {
    final String response =
        await rootBundle.loadString('assets/jsons/dua.json');
    final data = await json.decode(response);
    _dua = data.map<Dua>((e) => Dua.fromJson(e)).toList();
    notifyListeners();
  }
}
