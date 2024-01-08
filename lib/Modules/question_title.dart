class QuestionTitle {
  String? name;
  String? id;

  QuestionTitle({this.name,this.id});

  QuestionTitle.fromJson(Map<String, dynamic> json) {
    name = json['title'];
    id = json['id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'title': name,
      'id': id,
    };
    return data;
  }
}
