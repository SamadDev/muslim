class Azkar {
  int? count;
  String? dhikrid;
  String? ardhikr;
  String? krdhikr;

  Azkar({this.count, this.dhikrid, this.ardhikr, this.krdhikr});

  Azkar.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    dhikrid = json['dhikrid'];
    ardhikr = json['ardhikr'];
    krdhikr = json['krdhikr'];
  }
}

