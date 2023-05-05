import 'dart:convert';

import 'package:flutter/material.dart';

// final now = DateTime.now();
// final currentDay = weekdays[now.weekday % 7];

class Translate with ChangeNotifier {
  final weekdays = [
    '١ شەم',
    '٢ شەم',
    '٣ شەم',
    '٤ شەم',
    '٥ شەم',
    'هەینی',
    'شەممە',
  ];
  String dateFormatter(String dateTime) {
    print(dateTime);
    var date = DateTime.parse(dateTime);
    dynamic dayData =
        '{ "1" : "دووشەم", "2" : "سێشەم", "3" : "چوارشەم", "4" : "پێنجشەم", "5" : "هەینی", "6" : "شەمە", "7" : "یەکشەم" }';
    dynamic monthData =
        '{ "1" : "معرم", "2" : "صفر", "3" : "ربیع الاول", "4" : "ربیع الثانی", "5" : "جماد الاول", "6" : "جماد الثانی", "7" : "رجب", "8" : "شعبان", "9" : "رمضان", "10" : "شوال", "11" : "ذوالقعدة", "12" : "ذوالحجة" }';

    return '';
    // return json.decode(dayData)['${date.weekday}'] + ", " + date.day.toString();
    // +
    // " " +
    // json.decode(monthData)['${date.month}'] +
    // " " +
    // date.month.toString();
  }
}
