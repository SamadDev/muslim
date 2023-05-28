import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic360/Screens/Quran/Ayah/aya_png.dart';
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
    final audio = Provider.of<Audio>(context, listen: false);
    final data = Provider.of<QuranServes>(context, listen: false);
    final tafsir = Provider.of<TafsirServes>(context, listen: false);
    final save = Provider.of<Saved>(context, listen: false);

    return WillPopScope(
      onWillPop: () {
        audio.stopAudio();
        Navigator.of(context).pop();
        return Future.value(false);
      },
      child: Scaffold(
        floatingActionButton: Consumer<Audio>(
          builder: (ctx, audio, _) => Container(
            decoration: BoxDecoration(color: AppTheme.secondary, borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.only(right: 40, left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      if (audio.state == false) {
                        audio.play_audio_offline(
                            type: 'play', scrollC: controller, list: data.ayahs(widget.index).ayahs);
                      } else {
                        audio.pauseAudio();
                      }
                    },
                    child: audio.state == false
                        ? Icon(
                            Icons.play_arrow_rounded,
                            color: AppTheme.white,
                          )
                        : Icon(
                            Icons.pause,
                            color: AppTheme.white,
                          )),
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
                    color: AppTheme.primary,
                    size: 35,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () async {
                    await save.removeSaved();
                    await save.setSaved(Data(ayah: '1', index: widget.index, surah: widget.surah));
                    await save.getSaved();
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
        body: CustomScrollView(slivers: [
          SliverAppBar(
            primary: true,
            floating: true,
            snap: true,
            flexibleSpace: AppBar(
                leading: BackButton(
                  onPressed: () {
                    audio.stopAudio();
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SingleChildScrollView(
                                padding: EdgeInsets.only(right: 30, left: 30, top: 20, bottom: 10),
                                child: Consumer<LocalStorage>(
                                    builder: (ctx, setting, _) => Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'رێکخستنەکان',
                                              style: textTheme(context).headline6!.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppTheme.black.withOpacity(0.8),
                                                    fontSize: 20,
                                                  ),
                                            ),
                                            Row(
                                              children: [
                                                PageViewCard(isSelected: setting.pageView == "tafsir", type: "tafsir"),
                                                PageViewCard(isSelected: setting.pageView == "png", type: "png")
                                              ],
                                            ),
                                            Divider(
                                              color: AppTheme.secondary.withOpacity(0.3),
                                            ),
                                            SwitchListTile(
                                                inactiveTrackColor: AppTheme.primary,
                                                inactiveThumbColor: AppTheme.primary,
                                                activeColor: AppTheme.secondary,
                                                title: Text(
                                                  'پیشاندانی تەفسیر کوردی',
                                                  style: textTheme(context).headline4,
                                                ),
                                                value: setting.is_kurdish_tafsir,
                                                onChanged: (value) {
                                                  setting.set_tafsir_visibility(value: value);
                                                  setting.fetch_local();
                                                }),
                                            Divider(
                                              height: 45,
                                              color: AppTheme.secondary.withOpacity(0.3),
                                            ),
                                            Text(
                                              'قەبارەی نوسینین قورئان',
                                              style: textTheme(context).headline4,
                                            ),
                                            Slider(
                                              divisions: 5,
                                              inactiveColor: AppTheme.secondary.withOpacity(0.2),
                                              activeColor: AppTheme.secondary,
                                              value: setting.quran_font_size,
                                              onChanged: (value) {
                                                setting.set_quran_font_size(value: value);
                                              },
                                              min: 20,
                                              max: 30,
                                            ),
                                            Text(
                                              'قەبارەی نوسینی تەفسیری کوردی',
                                              style: textTheme(context).headline4,
                                            ),
                                            Slider(
                                              divisions: 5,
                                              inactiveColor: AppTheme.secondary.withOpacity(0.2),
                                              activeColor: AppTheme.secondary,
                                              value: setting.kurdish_tafsir_font_size,
                                              onChanged: (value) {
                                                print(value);
                                                setting.set_kurdish_tafsir_font_size(value: value);
                                              },
                                              min: 15,
                                              max: 30,
                                            ),
                                          ],
                                        )),
                              );
                            });
                      },
                      icon: Icon(Icons.settings))
                ],
                title: Text(
                  data.ayahs(widget.index).name!,
                  style: textTheme(context).headline3!.copyWith(color: AppTheme.white),
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              FutureBuilder(
                  future: tafsir.getTaf(index: int.parse(widget.index) - 1),
                  builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.secondary,
                          ),
                        )
                      : Consumer<TafsirServes>(
                          builder: (ctx, tafsir, _) => SingleChildScrollView(
                                child: Column(children: [
                                  Text(
                                    'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                                    style: textTheme(context).bodyText1,
                                  ),
                                  ListView.separated(
                                      separatorBuilder: ((context, snap) => Divider()),
                                      padding: EdgeInsets.only(top: 5, bottom: 5),
                                      primary: false,
                                      shrinkWrap: true,
                                      controller: controller,
                                      itemCount: data.ayahs(widget.index).ayahs!.length,
                                      itemBuilder: (ctx, i) => AutoScrollTag(
                                            highlightColor: Colors.red.withOpacity(0.5),
                                            controller: controller,
                                            index: i,
                                            key: ValueKey(i),
                                            child: AyahWidget(
                                                tafsir: tafsir.tafsir!.ayah![i],
                                                ayah: data.ayahs(widget.index).ayahs![i],
                                                list: data.ayahs(widget.index).ayahs,
                                                index: i,
                                                surah: widget.surah,
                                                surah_index: widget.index,
                                                controller: controller),
                                          ))
                                ]),
                              )))
            ]),
          )
        ]),
      ),
    );
  }
}

///one by one
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
    final audio = Provider.of<Audio>(context, listen: false);
    final saved = Provider.of<Saved>(context, listen: false);
    final local_storage = Provider.of<LocalStorage>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.center,
                    backgroundColor: AppTheme.primary,
                    content: Container(
                      height: 70,
                      color: AppTheme.primary,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              audio.play_audio(index: index, scrollC: controller, list: list);
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: AppTheme.black,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              audio.play_audio();
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.highlight_remove_outlined,
                              color: AppTheme.black,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              saved.setSaved(
                                Data(surah: surah, index: surah_index.toString(), ayah: ayah.number),
                              );
                            },
                            child: Image.asset(
                              'assets/images/bookmark.png',
                              width: 25,
                              height: 25,
                              color: AppTheme.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: ayah.text,
                style: textTheme(context).bodyText1!.copyWith(
                      fontSize: local_storage.quran_font_size,
                    ),
              ),
              WidgetSpan(
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
              ),
            ])),
            Divider(
              endIndent: 200,
              color: AppTheme.grey.withOpacity(0.15),
            ),
            local_storage.is_kurdish_tafsir
                ? Text(
                    tafsir.text!,
                    style: textTheme(context).headline4!.copyWith(fontSize: local_storage.kurdish_tafsir_font_size),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

class PageViewCard extends StatelessWidget {
  final type;
  final image;
  final bool? isSelected;
  PageViewCard({this.type, this.isSelected, this.image});

  @override
  Widget build(BuildContext context) {
    print(type);
    print(isSelected);
    return Expanded(
      child: InkWell(
        onTap: () {
          if (type == "png") {
            navigatorRouteAnimation(context: context, page: AyahPng());
          }
          Provider.of<LocalStorage>(context, listen: false).setQuranPageView(type);
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: isSelected! ? AppTheme.secondary : AppTheme.transparent)),
          child: Image.asset(
            'assets/images/tafsir.jpeg',
            fit: BoxFit.fill,
            width: 140,
            height: 140,
          ),
        ),
      ),
    );
  }
}
