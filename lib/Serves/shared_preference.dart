import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage with ChangeNotifier {
  bool is_kurdish_tafsir = false;
  bool is_arabic_tafsir = false;
  bool is_english_tafsir = false;
  double quran_font_size = 25.0;
  double kurdish_tafsir_font_size = 18;
  double arabic_tafsir_font_size = 16;
  double english_tafsir_font_size = 14;

  //__for azkar
  bool zikr_is_kurdish_tafsir = false;
  bool zikr_is_english_tafsir = false;
  double zikr_font_size = 25.0;
  double zikr_kurdish_tafsir_font_size = 18;
  double zikr_english_tafsir_font_size = 14;

  Future<void> fetch_local() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    is_kurdish_tafsir = preferences.getBool("is_kurdish_tafsir")!;
    preferences.getBool("is_arabic_tafsir");
    preferences.getBool("is_english_tafsir");
    quran_font_size = preferences.getDouble("quran_font_size")??25;
    kurdish_tafsir_font_size= preferences.getDouble("kurdish_tafsir_font_size")??20;
    preferences.getDouble("arabic_tafsir_font_size");
    preferences.getDouble("english_tafsir_font_size");
    //__for zikr
   zikr_is_kurdish_tafsir= preferences.getBool("zikr_is_kurdish_tafsir")!;
    preferences.getBool("zikr_is_english_tafsir");
    zikr_font_size=preferences.getDouble("zikr_font_size")!;
   zikr_kurdish_tafsir_font_size= preferences.getDouble("zikr_kurdish_tafsir_font_size")!;
    preferences.getDouble("zikr_english_tafsir_font_size");
    notifyListeners();
  }

  set_is_kurdish_tafsir({value, type}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (type == 'zikr') {
      print('if tafsir is zikr');
      print(value);
      preferences.setBool("zikr_is_kurdish_tafsir", value);
    } else {
      preferences.setBool("is_kurdish_tafsir", value);
    }
  }

  set_is_arabic_tafsir({value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("is_arabic_tafsir", value);
  }

  set_is_english_tafsir({value, type}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (type == "zikr") {
      preferences.setBool("zikr_is_english_tafsir", value);
    } else
      preferences.setBool("is_english_tafsir", value);
  }

  set_quran_font_size({value, type}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (type == "zikr") {
      print('is zikr size');
      preferences.setDouble("zikr_font_size", value);
    } else {
      print('is quran size');
      preferences.setDouble("quran_font_size", value);
    }
  }

  set_kurdish_tafsir_font_size({value, type}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (type == "zikr") {
      preferences.setDouble(
          "zikr_kurdish_tafsir_font_size", zikr_kurdish_tafsir_font_size);
    } else
      preferences.setDouble(
          "kurdish_tafsir_font_size", kurdish_tafsir_font_size);
  }

  set_arabic_tafsir_font_size({value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble("arabic_tafsir_font_size", arabic_tafsir_font_size);
  }

  set_english_tafsir_font_size({value, type}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (type == "zikr") {
      preferences.setDouble("zikr_english_tafsir_font_size", value);
    } else
      preferences.setDouble("english_tafsir_font_size", value);
  }

  remove_local() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  change_kurdish_tafisr({value, type}) {
    print(type);
    if (type == 'zikr') {
      print('set to $value zikr');
      zikr_is_kurdish_tafsir = value;
      set_is_kurdish_tafsir(value: value, type: 'zikr');
      notifyListeners();
    } else {
      is_kurdish_tafsir = value;
      set_is_kurdish_tafsir(value: value);
      notifyListeners();
    }
  }

  change_arabic_tafisr() {
    is_arabic_tafsir = !is_arabic_tafsir;
    notifyListeners();
  }

  change_english_tafisr({value, type}) {
    if (type == 'zikr') {
      zikr_is_english_tafsir = value;
      set_is_english_tafsir(value: value);
      notifyListeners();
    } else {
      is_english_tafsir = !is_english_tafsir;
      notifyListeners();
    }
  }

  change_quran_font_size({value, type}) {
    if (type == 'zikr') {
      zikr_font_size = value;
      set_quran_font_size(value: value, type: 'zikr');
      notifyListeners();
    } else {
      print('quran size');
      quran_font_size = value;
      set_quran_font_size(value: value);
      notifyListeners();
    }
  }

  change_kurdish_tafsir_font_size({value, type}) {
    if (type == 'zikr') {
      zikr_kurdish_tafsir_font_size = value;
      set_kurdish_tafsir_font_size(value: value, type: 'zikr');
      notifyListeners();
    } else {
      kurdish_tafsir_font_size = value;
      notifyListeners();
    }
  }

  change_arabic_tafsir_font_size(value) {
    arabic_tafsir_font_size = value;
    notifyListeners();
  }

  change_english_tafsir_font_size({value, type}) {
    if (type == 'zikr') {
      zikr_english_tafsir_font_size = value;
      set_english_tafsir_font_size(value: value);
      notifyListeners();
    } else {
      english_tafsir_font_size = value;
      notifyListeners();
    }
  }
}
