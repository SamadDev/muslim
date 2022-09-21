import 'package:flutter/material.dart';

ThemeData colorTheme(BuildContext context) => Theme.of(context);

TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

class AppTheme {
  static const Color cart = Color(0xff031c20);
  static const Color primary = Color(0xff032c32);
  // static const Color cart = Color(0xff002e28);
  // static const Color primary = Color(0xff003d34);
  static const Color secondary = Color(0xffeac68e);
  static const Color text = Color(0xffffe19c);
  static const Color white_think = Color(0xfffdfbf2);
  static const Color orange = Color(0xfffea41b);
  static const Color black1 = Color(0xffe1e7ec);
  static const Color black2 = Color(0xffe4e8eb);
  static const Color black3 = Color(0xffd2d2d2);
  static const Color black = Colors.black;
  static Color black4 = Color(0xff3e3e3e).withOpacity(0.2);
  static const Color red = Colors.red;

  static Color transparent = Colors.transparent;
  static const Color white = Colors.white;

  //light theme of the application
  static final ThemeData lightTheme = ThemeData(
      indicatorColor: primary,
      primarySwatch: Colors.teal,
      primaryColorLight: primary,
      cardColor: AppTheme.black2,
      scaffoldBackgroundColor: primary,
      backgroundColor: primary,
      brightness: Brightness.light,
      textTheme: lightTextTheme,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppTheme.secondary),
        color: AppTheme.primary,
        elevation: 0.5,
      ));

  //Light dark theme of the application
  static final TextTheme lightTextTheme = TextTheme(
    headline1: _headline1,
    headline2: _headline2,
    headline3: _headline3,
    headline4: _headline4,
    headline5: _headline5,
    headline6: _headline6,
    button: _button,
    subtitle1: _subtitle1,
    bodyText1: _bodyText1,
    bodyText2: _bodyText2,
    caption: _caption,
  );

  static final TextStyle _headline1 = TextStyle(
    color: AppTheme.secondary,
    fontWeight: FontWeight.w700,
    fontFamily: 'nrt',
    fontSize: 35,
  );

  static final TextStyle _headline2 = TextStyle(
    color: AppTheme.secondary,
    fontWeight: FontWeight.w700,
    fontFamily: 'nrt',
    fontSize: 25,
  );

  static final TextStyle _headline3 = TextStyle(
    color: AppTheme.text,
    fontWeight: FontWeight.w700,
    fontFamily: 'nrt',
    fontSize: 20,
  );
  static final TextStyle _headline4 = TextStyle(
    color: AppTheme.text,
    fontWeight: FontWeight.w400,
    fontFamily: 'nrt',
    fontSize: 18,
  );
  static final TextStyle _headline5 = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.text,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static final TextStyle _headline6 = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.text,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static final TextStyle _button = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.white,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  static final TextStyle _subtitle1 = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.secondary,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static final TextStyle _bodyText1 = TextStyle(
    fontFamily: 'amir',
    color: AppTheme.black.withOpacity(0.8),
    // fontWeight: FontWeight.w400,
    // wordSpacing: 6,
    fontSize: 25,
  );
  static final TextStyle _bodyText2 = TextStyle(
    fontFamily: 'noor',
    color: AppTheme.black,
    // fontWeight: FontWeight.w400,
    // wordSpacing: 6,
    fontSize: 15,
  );
  static final TextStyle _caption = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.black1,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );
}
