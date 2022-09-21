import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

List providers=[
  ChangeNotifierProvider(create:(_)=>QuranServes()),
  ChangeNotifierProvider(create: (_)=>TafsirServes())
];