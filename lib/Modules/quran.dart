class Quran {
  String? number;
  String? page;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  List<Ayahs>? ayahs;

  Quran(
      {this.number,
      this.name,
      this.page,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType,
      this.ayahs});

  Quran.fromJson(json) {
    number = json['number'].toString();
    name = json['name'];
    page = json['page'].toString();
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    ayahs = <Ayahs>[];
    json['ayahs'].forEach((v) {
      ayahs!.add(new Ayahs.fromJson(v));
    });
  }
}

class Ayahs {
  String? number;
  String? audio;
  String? text;
  String? numberInSurah;
  String? juz;
  String? page;
  String? hizbQuarter;
  String? sajda;

  Ayahs(
      {this.number,
      this.audio,
      this.text,
      this.numberInSurah,
      this.juz,
      this.page,
      this.hizbQuarter,
      this.sajda});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'].toString();
    audio = json['audio'];
    text = json['text'];
    numberInSurah = json['numberInSurah'].toString();
    juz = json['juz'].toString();
    page = json['page'].toString();
    hizbQuarter = json['hizbQuarter'].toString();
    sajda = json['sajda'].toString();
  }
}
