import 'package:flutter/material.dart';

ThemeData colorTheme(BuildContext context) => Theme.of(context);

TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

class AppTheme {
  static const Color cart = Color.fromARGB(255, 206, 240, 231);
  static const Color secondary = Color(0xff2ac391);
  static const Color primary = Color(0xffe2ecea);
  static const Color text = Color(0xff2ac391);
  static const Color grey = Colors.grey;
  static const Color orange = Color(0xfffea41b);
  static const Color black = Colors.black;
  static const Color red = Colors.red;

  static Color transparent = Colors.transparent;
  static const Color white = Color(0xffffffff);

  //light theme of the application
  static final ThemeData lightTheme = ThemeData(
      indicatorColor: primary,
      primarySwatch: Colors.teal,
      primaryColorLight: primary,
      cardColor: AppTheme.white,
      scaffoldBackgroundColor: primary,
      backgroundColor: primary,
      brightness: Brightness.light,
      textTheme: lightTextTheme,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppTheme.secondary),
          color: AppTheme.primary,
          elevation: 0.5,
          titleSpacing: 0,
          titleTextStyle: _headline2.copyWith(color: secondary)));

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
    color: AppTheme.text,
    fontWeight: FontWeight.w700,
    fontFamily: 'nrt',
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
    fontFamily: 'nrt',
    fontSize: 17,
  );
  static final TextStyle _headline5 = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.black,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static final TextStyle _headline6 = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.grey,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  static final TextStyle _button = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.black,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );

  static final TextStyle _subtitle1 = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.black,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static final TextStyle _bodyText1 = TextStyle(
    fontFamily: 'quran',
    color: AppTheme.black.withOpacity(0.8),
    fontSize: 28,
  );
  static final TextStyle _bodyText2 = TextStyle(
    fontFamily: 'noor',
    color: AppTheme.black,
    fontSize: 15,
  );
  static final TextStyle _caption = TextStyle(
    fontFamily: 'nrt',
    color: AppTheme.black,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );
}
