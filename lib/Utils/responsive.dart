import 'package:flutter/cupertino.dart';

class Responsive {
  static double sW (BuildContext context) => MediaQuery.of(context).size.width;
  static double sH(BuildContext context) => MediaQuery.of(context).size.height;
}
