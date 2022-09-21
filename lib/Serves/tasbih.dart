import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';

class TasbihSever with ChangeNotifier {
  List<Tasbih> tasbih = [
    Tasbih(zikr: "اللە اکبر", count: 1),
   Tasbih(zikr: "سبحان اللە", count: 2),
    Tasbih(zikr: "الستغفر اللە",count: 3)
  ];

  int count=0;
  addOne(){
    count =++count;
    notifyListeners();
  }
  resetCount(){
    count =0;
    notifyListeners();
  }
}
