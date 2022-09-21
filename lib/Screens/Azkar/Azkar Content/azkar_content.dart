import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class AzkarContent extends StatelessWidget {
  final dihikrId;
  final title;

  AzkarContent({this.dihikrId, this.title});

  Widget build(BuildContext context) {
    final data = Provider.of<AzkarServer>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
       final test= Provider.of<LocalStorage>(context,listen: false);
        test.fetch_local();
        print(test.zikr_is_kurdish_tafsir);
      },),
      appBar: AppBar(
          title: Text(
            title,
            style: textTheme(context).headline4,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.save,
                  color: AppTheme.secondary,
                )),
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
                                                  'پیشاندانی مانای کوردی',
                                                  style: textTheme(context)
                                                      .headline5,
                                                ),
                                                value: setting.zikr_is_kurdish_tafsir,
                                                onChanged: (value) {
                                                  setting.change_kurdish_tafisr(
                                                      value: value,type: 'zikr');
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
                                                value: setting.zikr_is_english_tafsir,
                                                onChanged: (value) {
                                                  setting.change_english_tafisr(value:value,type: "zikr");
                                                }),
                                            Divider(
                                              color: AppTheme.secondary
                                                  .withOpacity(0.3),
                                            ),
                                            Text(
                                              'قەبارەی نوسینین زیکر',
                                              style:
                                                  textTheme(context).headline6,
                                            ),
                                            Slider(
                                              value: setting.quran_font_size,
                                              onChanged: (value) {
                                                setting.change_quran_font_size(
                                                    value: value,type: "zikr");
                                              },
                                              min: 10,
                                              max: 100,
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
                                                        value: value,type:'zikr');
                                              },
                                              label: setting
                                                  .kurdish_tafsir_font_size
                                                  .toString(),
                                              min: 10,
                                              max: 100,
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
                                                        value:value,type: 'zikr');
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
                icon: Icon(Icons.settings_outlined)),
          ]),
      body: FutureBuilder(
        future: data.getAzkar(dihikrId: dihikrId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: Text('چاوەروانی....'));
            default:
              if (snapshot.hasError)
                return Text('هەلە: تکایە بەرنامەکە داخەو بیکەرەوە');
              else
                return Consumer<AzkarServer>(
                    builder: (ctx, azkar, _) => ListView.separated(
                        padding: EdgeInsets.only(bottom: 5),
                        separatorBuilder: (ctx, c) => Divider(
                              color: AppTheme.white.withOpacity(0.1),
                            ),
                        itemCount: azkar.azkar_list.length,
                        itemBuilder: (ctx, i) => AzkarContentWidget(
                              azkar: azkar.azkar_list[i],
                            )));
          }
        },
      ),
    );
  }
}
