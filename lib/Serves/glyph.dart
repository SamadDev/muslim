import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Utils/exports.dart';

class GlyphService with ChangeNotifier {
  List<GlyphModule> _glyph = [];

  List<GlyphModule> get glyph => _glyph;

  Future<void> getGlyph(pageNumber) async {
    try{
    final String response = await rootBundle.loadString('assets/jsons/glyph.json');
    final data = await json.decode(response);
    print(data);
    _glyph = data.map<GlyphModule>((e) => GlyphModule.fromJson(e)).toList();
    print("__________________________${glyph.length}");
    _glyph = _glyph.where((element) => element.pageNumber.toString() == "4").toList();
    print("__________________________${glyph.length}");
    print(_glyph.length);
    notifyListeners();}catch(e){
      print(e);
    }
  }
}
