import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  String? surah;
  String? index;
  String? ayah;

  Data({this.surah, this.index, this.ayah});

  Data.fromJson(Map<String, dynamic> json) {
    surah = json['surah'];
    index = json['index'];
    ayah = json['ayah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surah'] = this.surah;
    data['index'] = this.index;
    data['ayah'] = this.ayah;
    return data;
  }
}

class Saved with ChangeNotifier {
  List<Data> _saved_list = [];

  List<Data> get list => _saved_list;

  Future<void> getSaved() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<dynamic> data = await jsonDecode(preferences.getString('save')!) ?? [];
    _saved_list = data.map((e) => Data.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> setSaved(Data value) async {
    _saved_list.add(value);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('save', jsonEncode(_saved_list));
    notifyListeners();
  }

  Future<void> removeSaved(index) async {
    int i = _saved_list.indexWhere((element) => element.index == index);
    _saved_list.removeAt(i);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('save', jsonEncode(_saved_list));
    notifyListeners();
  }
}
