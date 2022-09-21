import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:islamic360/test.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuranServes()),
        ChangeNotifierProvider(create: (_) => TafsirServes()),
        ChangeNotifierProvider(create: (_) => LocalStorage()),
        ChangeNotifierProvider(
          create: (_) => AzkarServer(),
        ),
        ChangeNotifierProvider(
          create: (_) => Azkar_title_Server(),
        ),
        ChangeNotifierProvider(
          create: (_) => TasbihSever(),
        ),
      ],
      child: Sizer(
          builder: (context, orientation, deviceType)=>
         MaterialApp(
          builder: (ctx, child) {
            return Directionality(
                textDirection: TextDirection.rtl, child: child!);
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          home:HomePage(),
        ),
      ),
    );
  }
}
