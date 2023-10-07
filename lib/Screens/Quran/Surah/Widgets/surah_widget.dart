import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class QuranListWidget extends StatelessWidget {
  final Quran surah;

  QuranListWidget({required this.surah});

  Widget build(BuildContext context) {
    final type=Provider.of<LocalStorage>(context,listen:false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) =>type.pageView == "tafsir"? AyahScreen(
                  index: surah.number,
                  surah: surah.name,
                ):AyahPng(surah.page)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(8)),
        height: 100,
        child: ListTile(
            leading: StarIcon(number_ayah: surah.number, image: 'octagonal_1.svg'),
            title: Text(
              surah.name!,
              style: textTheme(context).displaySmall,
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${surah.ayahs?.length.toString() ?? '0'} ئایەت",
                  style: textTheme(context).titleMedium,
                ),
                Text("  -  "),
                Text(
                  surah.revelationType == "Medinan" ? "مەدینە" : "مەکە",
                  style: textTheme(context).titleMedium,
                )
              ],
            ),
            trailing: Text(
              surah.englishName!,
              style: textTheme(context).headlineSmall,
            )),
      ),
    );
  }
}
