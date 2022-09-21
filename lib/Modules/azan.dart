class Azan {
  String? city;
  List<AzanMonth>? azan;

  Azan({this.city, this.azan});

  Azan.fromJson(json) {
    city = json['city'];
    if (json['azan'] != null) {
      azan = <AzanMonth>[];
      json['azan'].forEach((v) {
        azan!.add(AzanMonth.fromJson(v));
      });
    }
  }
}

class AzanMonth {
  String? city;
  String? day;
  int? id;
  String? month;
  List<String>? time;

  AzanMonth({this.city, this.day, this.id, this.month, this.time});

  AzanMonth.fromJson(Map<String, dynamic> json) {
    city = json['City'];
    day = json['day'];
    id = json['id'];
    month = json['month'];
    time = json['time'].cast<String>();
  }
}
