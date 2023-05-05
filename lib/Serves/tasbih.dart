import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';

class TasbihSever with ChangeNotifier {
  List<Tasbih> tasbih = [
    Tasbih(zikr: "سُـبْحانَ اللهِ"),
    Tasbih(zikr: "لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمْد، وهُوَ على كُلّ شَيءٍ قَـدير"),
    Tasbih(zikr: "الحَمْـدُ لله"),
    Tasbih(zikr: "اللهُ أكْـبَ"),
    Tasbih(zikr: "سُبْحَانَ الْلَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا الْلَّهُ، وَالْلَّهُ أَكْبَرُ"),
    Tasbih(zikr: "أسْتَغْفِرُ اللهَ"),
    Tasbih(zikr: "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ"),
    Tasbih(zikr: 'اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد'),
    Tasbih(zikr: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ'),
    Tasbih(zikr: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ"),
    Tasbih(zikr: "لَا إِلَهَ إِلَّا اللَّهُ"),
    Tasbih(zikr: "زیکری تایبەت"),
  ];

  int count = 0;
  addOne() {
    count = ++count;
    notifyListeners();
  }

  resetCount() {
    count = 0;
    notifyListeners();
  }
}
