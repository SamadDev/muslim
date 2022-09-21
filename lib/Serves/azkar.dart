import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic360/Utils/exports.dart';

class AzkarServer with ChangeNotifier {
 List<Azkar> _azkar=[];
 List<Azkar> get azkar_list=>_azkar;

  Future<void> getAzkar({dihikrId}) async {
    final String response =
    await rootBundle.loadString('assets/jsons/azkar.json');
    final data = await json.decode(response)['data'];
    _azkar = data.map<Azkar>((e) => Azkar.fromJson(e)).toList();
   _azkar= _azkar.where((element) => element.dhikrid.toString()==dihikrId.toString()).toList();
    print(_azkar);
    notifyListeners();
  }
}
