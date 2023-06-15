import 'package:flutter/material.dart';
import 'package:islamic360/Screens/Quran/Ayah/aya_book.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() async {
  runApp(const MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,

      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // theme: AppTheme.lightTheme,
          home: AyahPng(),
        ),
      ),
    );
  }
}
