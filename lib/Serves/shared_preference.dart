import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage with ChangeNotifier {
  bool is_kurdish_tafsir = true;
  double quran_font_size = 20.0;
  double kurdish_tafsir_font_size = 15;
  String pageView = "tafsir";

  //__for azkar
  bool zikr_is_kurdish_tafsir = true;
  double zikr_font_size = 25.0;
  double zikr_kurdish_tafsir_font_size = 15;

  Future<void> fetch_local() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    is_kurdish_tafsir = preferences.getBool("is_kurdish_tafsir") ?? true;
    quran_font_size = preferences.getDouble("quran_font_size") ?? 25;
    kurdish_tafsir_font_size = preferences.getDouble("kurdish_tafsir_font_size") ?? 15;
    //__ quran pageView
    pageView = preferences.getString('pageView') ?? 'tafsir';

    //__for zikr
    zikr_font_size = preferences.getDouble("zikr_font_size") ?? 20;
    zikr_is_kurdish_tafsir = preferences.getBool("zikr_is_kurdish_tafsir") ?? true;
    zikr_kurdish_tafsir_font_size = preferences.getDouble("zikr_kurdish_tafsir_font_size") ?? 15;
    notifyListeners();
  }

  set_kurdish_tafsir_font_size({value, type}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (type == 'zikr') {
      zikr_kurdish_tafsir_font_size = value;
      preferences.setDouble("zikr_kurdish_tafsir_font_size", value);
      notifyListeners();
    } else {
      kurdish_tafsir_font_size = value;
      preferences.setDouble("kurdish_tafsir_font_size", value);
      notifyListeners();
    }
  }

  set_quran_font_size({value, type}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (type == 'zikr') {
      zikr_font_size = value;
      preferences.setDouble("zikr_font_size", value);
      notifyListeners();
    } else {
      quran_font_size = value;
      preferences.setDouble("quran_font_size", value);
      notifyListeners();
    }
  }

  set_tafsir_visibility({value, type}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (type == 'zikr') {
      zikr_is_kurdish_tafsir = value;
      preferences.setBool("zikr_is_kurdish_tafsir", value);
      notifyListeners();
    } else {
      is_kurdish_tafsir = value;
      preferences.setBool("is_kurdish_tafsir", value);
      notifyListeners();
    }
  }

  Future<void> setQuranPageView(value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    pageView = value;
    preferences.setString('pageView', value);
    notifyListeners();
  }
}
