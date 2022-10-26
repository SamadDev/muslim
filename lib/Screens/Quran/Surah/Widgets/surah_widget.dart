import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';

class QuranListWidget extends StatelessWidget {
  final Quran surah;

  QuranListWidget({required this.surah});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AyahScreen(index:surah.number,surah: surah.name,)));
      },
      child: Container(
        height: 80,
        child: ListTile(
            leading: StarIcon(number_ayah: surah.number,image: 'octagonal_1.svg'),
            title: Text(
              surah.name!,
              style: textTheme(context).headline3,
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "150 ئایەت",
                  style: textTheme(context).subtitle1,
                ),
                Text("  -  "),
                Text(
                  surah.revelationType=="Medinan"?"مەدینە":"مەکە",
                  style: textTheme(context).subtitle1,
                )
              ],
            ),
            trailing: Text(surah.englishName!,style: textTheme(context).headline5,)),
      ),
    );
  }
}