class AzkarTitle {
  String? name;
  String? num;

  AzkarTitle({this.name,this.num});

  AzkarTitle.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    num = json['num'].toString();
  }
}
