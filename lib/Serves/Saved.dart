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
  Data? data;
  bool isTafsir = true;

  Future<void> getSaved() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (preferences.getString('save') != null) {
        var res = await jsonDecode(preferences.getString('save')!);
        data = Data.fromJson(res);
      } else {
        data = Data(ayah: '1', index: '1', surah: 'ٱلْفَاتِحَةِ');
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> setSaved(Data value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('save', jsonEncode(value));
    notifyListeners();
  }

  Future<void> removeSaved() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('save');
    // preferences.clear();
    notifyListeners();
  }

  Future<void> getTafsir() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final test = preferences.getBool('tafsir') ?? false;
    print(test);
  }

  Future<void> setTafsir() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final test = preferences.setBool('tafsir', isTafsir);
    print(test);
  }

  Future<void> removeTafsir() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('tafsir');
    // preferences.clear();
    notifyListeners();
  }
}
