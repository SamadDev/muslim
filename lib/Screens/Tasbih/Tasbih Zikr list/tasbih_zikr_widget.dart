import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class TasbihZikrListWidget extends StatelessWidget {
  final Tasbih? tasbih;
  final index;

  TasbihZikrListWidget({this.tasbih, this.index});

  Widget build(BuildContext context) {
    final data = Provider.of<TasbihSever>(context, listen: false);
    return GestureDetector(
      onTap: () {
        navigatorRouteAnimation(
            context: context,
            page: TasbiScreen(
              zikr: tasbih!.zikr!,
            ));
        data.resetCount();
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            tasbih!.zikr!,
            style: textTheme(context).headline3,
          ),
          leading: StarIcon(number_ayah: index + 1, image: 'octagonal_1.svg'),
          subtitle: Text(
            "هیچ خودایەک نیەک نیە بەقەد ئەو گەورەبێت",
            style: textTheme(context).headline5,
          ),
        ),
      ),
    );
  }
}
