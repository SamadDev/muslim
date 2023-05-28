import 'package:flutter/material.dart';

ThemeData colorTheme(BuildContext context) => Theme.of(context);

TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

class AppTheme {
  static const Color cart = Colors.white;
  static const Color secondary = Color(0xff1b9c85);
  static const Color primary = Color(0xfff6f1eb);

  static const Color grey = Colors.grey;
  static const Color orange = Color(0xfffea41b);
  static const Color black = Colors.black54;
  static const Color red = Colors.red;

  static Color transparent = Colors.transparent;
  static const Color white = Color(0xffffffff);

  //light theme of the application
  static final ThemeData lightTheme = ThemeData(
    indicatorColor: primary,
    primaryColorLight: primary,
    cardColor: AppTheme.white,
    scaffoldBackgroundColor: primary,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppTheme.white),
      color: secondary,
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      titleTextStyle: _headline2.copyWith(
        color: primary,
        fontSize: 18,
      ),
    ),
  );

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
    color: AppTheme.primary,
    fontWeight: FontWeight.w700,
    fontFamily: 'amir',
    fontSize: 40,
  );

  static final TextStyle _headline2 = TextStyle(
    color: AppTheme.black,
    fontWeight: FontWeight.w700,
    // fontFamily: 'nrt',
    fontSize: 25,
  );

  static final TextStyle _headline3 = TextStyle(
    color: AppTheme.black,
    fontWeight: FontWeight.w700,
    fontFamily: 'amir',
    fontSize: 20,
  );
  static final TextStyle _headline4 = TextStyle(
    color: AppTheme.black,
    fontWeight: FontWeight.w400,
    // fontFamily: 'nrt',
    fontSize: 17,
  );
  static final TextStyle _headline5 = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.black,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static final TextStyle _headline6 = TextStyle(
    // fontFamily: 'nrt',
    color: AppTheme.grey,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static final TextStyle _button = TextStyle(
    // fontFamily: 'nrt',
    color: AppTheme.black,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  static final TextStyle _subtitle1 = TextStyle(
      // fontFamily: 'nrt',
      color: AppTheme.black,
      fontWeight: FontWeight.w400,
      fontSize: 14);

  static final TextStyle _bodyText1 = TextStyle(fontFamily: 'amir', fontSize: 30);
  static final TextStyle _bodyText2 = TextStyle(fontFamily: 'noor', color: AppTheme.black, fontSize: 15);
  static final TextStyle _caption = TextStyle(
      // fontFamily: 'nrt',
      color: AppTheme.black,
      fontWeight: FontWeight.w400,
      fontSize: 10);
}
