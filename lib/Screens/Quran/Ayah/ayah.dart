import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class AyahScreen extends StatefulWidget {
  final index;
  final surah;

  AyahScreen({this.index, this.surah});

  @override
  State<AyahScreen> createState() => _AyahScreenState();
}

class _AyahScreenState extends State<AyahScreen> {
  Widget build(BuildContext context) {
    AutoScrollController? controller = AutoScrollController();
    final audio=Provider.of<Audio>(context,listen: false);
    final data = Provider.of<QuranServes>(context, listen: false);
    final tafsir = Provider.of<TafsirServes>(context, listen: false);
    print(widget.index.runtimeType);
    return  WillPopScope(
      onWillPop: () {
        data.groupByName(widget.index);
        // audio.stopAudio();
        // Navigator.of(context).pop();
        return Future.value(false);
      },

      child: Scaffold(
        floatingActionButton: Consumer<Audio>(
          builder: (ctx, audio, _) => Container(
            color: AppTheme.secondary.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (audio.state == false) {
                          audio.play_audio_offline(
                              type: 'play',
                              scrollC: controller,
                              number: widget.index,
                              list: data.ayahs(widget.index).ayahs);
                        } else {
                          audio.pauseAudio();
                        }
                      },
                      child: audio.state == false
                          ? Icon(Icons.play_arrow_rounded)
                          : Icon(Icons.pause)),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.highlight_remove_outlined,
                      color: AppTheme.primary,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      audio.pauseAudio();
                    },
                    child: Image.asset(
                      'assets/images/bookmark.png',
                      width: 25,
                      height: 25,
                      color: AppTheme.primary,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: AppTheme.white_think,
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                audio.stopAudio();
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialogWidget(
                              title: "??????????????????????",
                              child: Container(
                                height: 400,
                                child: SingleChildScrollView(
                                  child: Consumer<LocalStorage>(
                                      builder: (ctx, setting, _) => Column(
                                            children: [
                                              SwitchListTile(
                                                  title: Text(
                                                    '?????????????????? ???????????? ??????????',
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
                                                    '?????????????????? ???????????? ??????????',
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
                                                    '?????????????????? ???????????? ????????????????',
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
                                                '?????????????? ?????????????? ????????????',
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
                                                '?????????????? ???????????? ?????????????? ??????????',
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
                                                '?????????????? ?????????????? ?????????????? ????????????',
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
                                                '?????????????? ?????????????? ?????????????? ????????????????',
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
              data.ayahs(widget.index).name!,
              style: textTheme(context).headline3,
            )),
        body: FutureBuilder(
            future: tafsir.getTaf(index: int.parse(widget.index) - 1),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError)
                    return Text('????????: ?????????? ?????????????????? ?????????? ????????????????');
                  else {
                    return Consumer<TafsirServes>(
                        builder: (ctx, tafsir, _) =>
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                 widget.index=="1"?
                              Text(widget.index=="1"?
                              "?????????????? ?????????????????? ???????? ?????????????????????? ??????????????????":
                                '???????????? ?????????????? ???????????????????????? ????????????????????',
                                style: textTheme(context).bodyText1,
                              )
                                     : Text(
                                    '???????????? ?????????????? ???????????????????????? ????????????????????',
                                    style: textTheme(context).bodyText1,
                                  ),
                                  AyahTogether(
                                    list: data.ayahs(widget.index).ayahs,
                                    verse_count:
                                        data.ayahs(widget.index).ayahs!.length,
                                  ),
                                ],
                              ),
                            ));
                  }
              }
            }),
      ),
    );
  }
}

class AyahWidget extends StatelessWidget {
  final Ayahs ayah;
  final Ayah tafsir;
  final index;
  final controller;
  final list;
  final surah;
  final surah_index;
  final versesCount;

  AyahWidget(
      {required this.ayah,
      required this.tafsir,
      required this.index,
      required this.surah,
      required this.surah_index,
      required this.controller,
      this.versesCount,
      this.list});

  @override
  Widget build(BuildContext context) {
    final audio=Provider.of<Audio>(context,listen: false);
    final saved = Provider.of<Saved>(context, listen: false);
    final local_storage = Provider.of<LocalStorage>(context);
    int count = versesCount;
    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  backgroundColor: AppTheme.primary,
                  content: Container(
                    color: AppTheme.primary,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            audio.play_audio_offline(
                                index: index, scrollC: controller, list: list);
                          },
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: AppTheme.text,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            audio.stopAudio();
                            Navigator.of(context).pop();

                          },
                          child: Icon(
                            Icons.highlight_remove_outlined,
                            color: AppTheme.text,
                            size: 35,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            saved.setSaved(Data(
                                surah: surah,
                                index: surah_index.toString(),
                                ayah: ayah.number));
                          },
                          child: Image.asset(
                            'assets/images/bookmark.png',
                            width: 25,
                            height: 25,
                            color: AppTheme.text,
                          ),
                        )
                      ],
                    ),
                  ),
                ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: count <= 20 ? TextAlign.center : TextAlign.justify,
              text: TextSpan(
                children: [
                  for (var i = 0; i <= count - 1; i++) ...{
                    TextSpan(
                      text: '' + 'text[i].text' + '',
                      style: textTheme(context).bodyText1,
                    ),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SvgPicture.asset(
                          'assets/icons/ayah.svg',
                          width: 30,
                          height: 30,
                          color: AppTheme.secondary,
                        ))
                  }
                ],
              ),
            )

            // RichText(
            //     text: TextSpan(children: [
            //   TextSpan(
            //     text: ayah.text,
            //     style: textTheme(context)
            //         .bodyText1!
            //         .copyWith(fontSize: local_storage.quran_font_size),
            //   ),
            //   WidgetSpan(
            //     // baseline: TextBaseline.alphabetic,
            //     alignment: PlaceholderAlignment.middle,
            //     child: Padding(
            //       padding: const EdgeInsets.only(right: 5, left: 5),
            //       child: Stack(
            //         alignment: Alignment.bottomCenter,
            //         children: [
            //           SvgPicture.asset(
            //             'assets/icons/ayah.svg',
            //             width: 30,
            //             height: 30,
            //             color: AppTheme.secondary,
            //           ),
            //           Text(ayah.numberInSurah!,
            //               style: textTheme(context).headline5!.copyWith(
            //                     color: AppTheme.black,
            //                   ))
            //         ],
            //       ),
            //     ),
            //   )
            // ])),
            ,
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
      ),
    );
  }
}

class AyahTogether extends StatelessWidget {
  final list;
  final verse_count;

  AyahTogether({this.list, this.verse_count});

  @override
  Widget build(BuildContext context) {
    int count = verse_count;
    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  backgroundColor: AppTheme.primary,
                  content: Container(
                    color: AppTheme.primary,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Audio().play_audio(
                            //     index: index, scrollC: controller, list: list);
                          },
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: AppTheme.text,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.highlight_remove_outlined,
                            color: AppTheme.text,
                            size: 35,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          // onTap: () {
                          //   saved.setSaved(Data(
                          //       surah: surah,
                          //       index: surah_index.toString(),
                          //       ayah: ayah.number));
                          // },
                          child: Image.asset(
                            'assets/images/bookmark.png',
                            width: 25,
                            height: 25,
                            color: AppTheme.text,
                          ),
                        )
                      ],
                    ),
                  ),
                ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: count <= 20 ? TextAlign.center : TextAlign.justify,
              text: TextSpan(
                children: [
                  for (var i = 0; i <= count - 1; i++) ...{
                    TextSpan(
                      text: '' + list[i].text + '',
                      style: textTheme(context).bodyText1,
                    ),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: SvgPicture.asset(
                          'assets/icons/ayah.svg',
                          width: 30,
                          height: 30,
                          color: AppTheme.secondary,
                        ))
                  }
                ],
              ),
            )

            // RichText(
            //     text: TextSpan(children: [
            //   TextSpan(
            //     text: ayah.text,
            //     style: textTheme(context)
            //         .bodyText1!
            //         .copyWith(fontSize: local_storage.quran_font_size),
            //   ),
            //   WidgetSpan(
            //     // baseline: TextBaseline.alphabetic,
            //     alignment: PlaceholderAlignment.middle,
            //     child: Padding(
            //       padding: const EdgeInsets.only(right: 5, left: 5),
            //       child: Stack(
            //         alignment: Alignment.bottomCenter,
            //         children: [
            //           SvgPicture.asset(
            //             'assets/icons/ayah.svg',
            //             width: 30,
            //             height: 30,
            //             color: AppTheme.secondary,
            //           ),
            //           Text(ayah.numberInSurah!,
            //               style: textTheme(context).headline5!.copyWith(
            //                     color: AppTheme.black,
            //                   ))
            //         ],
            //       ),
            //     ),
            //   )
            // ])),
          ],
        ),
      ),
    );
  }
}
