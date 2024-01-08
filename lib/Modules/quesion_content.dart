class QuestionContent {
  String? id;
  String? shortTitle;
  String? title;
  String? ask;
  String? question;
  String? catId;


  QuestionContent(
      {this.id,
      this.shortTitle,
      this.title,
      this.ask,
      this.question,
      this.catId,});

  QuestionContent.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    shortTitle = json['short_title'];
    title = json['title'];
    ask = json['ask'];
    question = json['question'];
    catId = json['cat_id'].toString();

  }
}