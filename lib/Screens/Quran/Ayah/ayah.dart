import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AyahScreen extends StatelessWidget {
  final index;

  AyahScreen({this.index});

  Widget build(BuildContext context) {
    AutoScrollController? controller = AutoScrollController();
    final data = Provider.of<QuranServes>(context, listen: false);
    final tafsir = Provider.of<TafsirServes>(context, listen: false);
    return Scaffold(
      backgroundColor: AppTheme.white_think,
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialogWidget(
                            title: "رێکخستنەکان",
                            child: Container(
                              height: 400,
                              child: SingleChildScrollView(
                                child: Consumer<LocalStorage>(
                                    builder: (ctx, setting, _) => Column(
                                          children: [
                                            SwitchListTile(
                                                title: Text(
                                                  'پیشاندانی تەفسیر کوردی',
                                                  style: textTheme(context)
                                                      .headline5,
                                                ),
                                                value:
                                                    setting.is_kurdish_tafsir,
                                                onChanged: (value) {
                                                  setting.change_kurdish_tafisr(
                                                      value: value);
                                                }),
                                            Divider(
                                              color: AppTheme.secondary
                                                  .withOpacity(0.3),
                                            ),
                                            SwitchListTile(
                                                title: Text(
                                                  'پیشاندانی تەفسیر عەربی',
                                                  style: textTheme(context)
                                                      .headline5,
                                                ),
                                                value: setting.is_arabic_tafsir,
                                                onChanged: (value) {
                                                  setting
                                                      .change_arabic_tafisr();
                                                }),
                                            Divider(
                                              color: AppTheme.secondary
                                                  .withOpacity(0.3),
                                            ),
                                            SwitchListTile(
                                                title: Text(
                                                  'پیشاندانی تەفسیر ئینگلیزی',
                                                  style: textTheme(context)
                                                      .headline5,
                                                ),
                                                value:
                                                    setting.is_english_tafsir,
                                                onChanged: (value) {
                                                  setting
                                                      .change_english_tafisr();
                                                }),
                                            Divider(
                                              color: AppTheme.secondary
                                                  .withOpacity(0.3),
                                            ),
                                            Text(
                                              'قەبارەی نوسینین قورئان',
                                              style:
                                                  textTheme(context).headline6,
                                            ),
                                            Slider(
                                              value: setting.quran_font_size,
                                              onChanged: (value) {
                                                setting.change_quran_font_size(
                                                    value: value);
                                              },
                                              min: 20,
                                              max: 50,
                                            ),
                                            Text(
                                              'قەبارەی نوسینی تەفسیری کوردی',
                                              style:
                                                  textTheme(context).headline6,
                                            ),
                                            Slider(
                                              value: setting
                                                  .kurdish_tafsir_font_size,
                                              onChanged: (value) {
                                                setting
                                                    .change_kurdish_tafsir_font_size(
                                                        value: value);
                                              },
                                              label: setting
                                                  .kurdish_tafsir_font_size
                                                  .toString(),
                                              min: 15,
                                              max: 30,
                                            ),
                                            Divider(
                                              color: AppTheme.secondary
                                                  .withOpacity(0.3),
                                            ),
                                            Text(
                                              'قەبارەی نوسینین تەفسیری عەرەبی',
                                              style:
                                                  textTheme(context).headline6,
                                            ),
                                            Slider(
                                              value: setting
                                                  .arabic_tafsir_font_size,
                                              onChanged: (value) {
                                                setting
                                                    .change_arabic_tafsir_font_size(
                                                        value);
                                              },
                                              label: setting
                                                  .arabic_tafsir_font_size
                                                  .toString(),
                                              min: 10,
                                              max: 50,
                                            ),
                                            Text(
                                              'قەبارەی نوسینین تەفسیری ئینگلێزی',
                                              style:
                                                  textTheme(context).headline6,
                                            ),
                                            Slider(
                                              value: setting
                                                  .english_tafsir_font_size,
                                              onChanged: (value) {
                                                setting
                                                    .change_english_tafsir_font_size(
                                                        value: value);
                                              },
                                              label: setting
                                                  .english_tafsir_font_size
                                                  .toString(),
                                              min: 10,
                                              max: 100,
                                            ),
                                          ],
                                        )),
                              ),
                            ),
                            onPress: () {},
                            onPress1: () {},
                          ));
                },
                icon: Icon(Icons.settings_outlined))
          ],
          title: Text(
            data.ayahs(index).name!,
            style: textTheme(context).headline3,
          )),
      body: FutureBuilder(
          future: tafsir.getTaf(index: int.parse(index) - 1),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Text('هەلە: تاکیە بەرنامەکە داخەو بیکەرەوە');
                else
                  return Consumer<TafsirServes>(
                      builder: (ctx, tafsir, _) =>
                          //todo increase 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ' in the top
                          // Text(
                          //   'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                          //   style: textTheme(context).bodyText1,
                          // ),
                          ListView.builder(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              primary: false,
                              shrinkWrap: true,
                              controller: controller,
                              itemCount: data.ayahs(index).ayahs!.length,
                              itemBuilder: (ctx, i) => AutoScrollTag(
                                highlightColor: Colors.red.withOpacity(0.5),
                                    controller: controller,
                                    index: i,
                                    key: ValueKey(i),
                                    child: AyahWidget(
                                        tafsir: tafsir.tafsir!.ayah![i],
                                        ayah: data.ayahs(index).ayahs![i],
                                        list: data.ayahs(index).ayahs,
                                        index: i,
                                        controller: controller),
                                  )));
            }
          }),
    );
  }
}

class AyahWidget extends StatelessWidget {
  final Ayahs ayah;
  final Ayah tafsir;
  final index;
  final controller;
  final list;

  AyahWidget(
      {required this.ayah,
      required this.tafsir,
      required this.index,
      required this.controller,
      this.list});

  @override
  Widget build(BuildContext context) {
    final local_storage = Provider.of<LocalStorage>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {
                play_audio(url: ayah.audio, index: index, scrollC: controller,list: list);
              },
              child: Icon(Icons.play_arrow)),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: ayah.text,
              // text: ayah.text!,
              style: textTheme(context)
                  .bodyText1!
                  .copyWith(fontSize: local_storage.quran_font_size),
            ),
            WidgetSpan(
              // baseline: TextBaseline.alphabetic,
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ayah.svg',
                      width: 30,
                      height: 30,
                      color: AppTheme.secondary,
                    ),
                    Text(ayah.numberInSurah!,
                        style: textTheme(context).headline5!.copyWith(
                              color: AppTheme.black,
                            ))
                  ],
                ),
              ),
            )
          ])),
          SizedBox(
            height: 5,
          ),
          local_storage.is_kurdish_tafsir
              ? Text(
                  tafsir.text!,
                  style: textTheme(context).bodyText2!.copyWith(
                      fontSize: local_storage.kurdish_tafsir_font_size),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
