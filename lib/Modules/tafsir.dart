class Tafsir {
  int? index;
  List<Ayah>? ayah;

  Tafsir({this.index, this.ayah});

  Tafsir.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    ayah = <Ayah>[];
    json['ayah'].forEach((v) {
      ayah!.add(new Ayah.fromJson(v));
    });
  }

}

class Ayah {
  int? sura;
  int? ayah;
  String? text;

  Ayah({this.sura, this.ayah, this.text});

  Ayah.fromJson(Map<String, dynamic> json) {
    sura = json['sura'];
    ayah = json['ayah'];
    text = json['text'];
  }

}
