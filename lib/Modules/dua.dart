class Dua {
  String? dua;
  String? audio;
  String? id;

  Dua({
    this.id,
    this.audio,
    this.dua,
  });

  Dua.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    audio = json['mp3'];
    dua = json['ar'];
  }
}
