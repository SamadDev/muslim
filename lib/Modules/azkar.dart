class Azkar {
 late final  count;
  String? dhikrid;
  String? ardhikr;
  String? krdhikr;

  Azkar({required this.count, this.dhikrid, this.ardhikr, this.krdhikr});

  Azkar.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    dhikrid = json['dhikrid'];
    ardhikr = json['ardhikr'];
    krdhikr = json['krdhikr'];
  }
}

