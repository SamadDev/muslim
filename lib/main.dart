import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:islamic360/test1.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';


void main()async{
  runApp(const MyApps());
}

// void main() {
//   runApp(DevicePreview(
//       enabled: true,
//       tools: [
//         ...DevicePreview.defaultTools,
//       ],
//   builder: (_)=> MyApp()));
// }
class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuranServes()),
        ChangeNotifierProvider(create: (_) => TafsirServes()),
        ChangeNotifierProvider(create: (_) => LocalStorage()),
        ChangeNotifierProvider(create: (_)=>Audio(),),
        ChangeNotifierProvider(create: (_)=>Saved(),),
        ChangeNotifierProvider(create: (_) => AzkarServer(),),
        ChangeNotifierProvider(create: (_) => Azkar_title_Server(),),
        ChangeNotifierProvider(create: (_) => TasbihSever(),),
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
