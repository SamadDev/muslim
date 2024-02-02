class Muslim {

  String ? fav;
  String? iD;
  String? book;
  String? door;
  String? hadeth;
  String? pageNum;

  Muslim({this.fav, this.iD, this.book, this.door, this.hadeth, this.pageNum});

  Muslim.fromJson(Map<String, dynamic> json) {
    fav = json['Fav'].toString();
    iD = json['ID'].toString();
    book = json['book'];
    door = json['door'];
    hadeth = json['hadeth'];
    pageNum = json['page_num'].toString();
  }
}