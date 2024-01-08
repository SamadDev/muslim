class Nawawy {
  String? title;
  String? description;
  String? hadith;

  Nawawy({this.title, this.description, this.hadith});

  Nawawy.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    hadith = json['hadith'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['hadith'] = this.hadith;
    return data;
  }
}