class Muslim {
  int? fav;
  int? iD;
  String? book;
  String? door;
  String? hadeth;
  int? pageNum;

  Muslim({this.fav, this.iD, this.book, this.door, this.hadeth, this.pageNum});

  Muslim.fromJson(Map<String, dynamic> json) {
    fav = json['Fav'];
    iD = json['ID'];
    book = json['book'];
    door = json['door'];
    hadeth = json['hadeth'];
    pageNum = json['page_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Fav'] = this.fav;
    data['ID'] = this.iD;
    data['book'] = this.book;
    data['door'] = this.door;
    data['hadeth'] = this.hadeth;
    data['page_num'] = this.pageNum;
    return data;
  }
}