import 'package:islamic360/Utils/exports.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

List<SingleChildWidget> providers=[
  ChangeNotifierProvider(create: (_) => QuranServes()),
  ChangeNotifierProvider(create: (_) => TafsirServes()),
  ChangeNotifierProvider(create: (_) => LocalStorage()),
  ChangeNotifierProvider(create: (_) => DuaServse()),
  ChangeNotifierProvider(create: (_) => Translate()),
  ChangeNotifierProvider(create: (_) => Audio()),
  ChangeNotifierProvider(create: (_) => Saved()),
  ChangeNotifierProvider(create: (_) => AzkarServer()),
  ChangeNotifierProvider(create: (_) => Azkar_title_Server()),
  ChangeNotifierProvider(create: (_) => TasbihSever()),
];