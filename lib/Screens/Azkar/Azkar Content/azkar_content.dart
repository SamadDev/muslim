import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class AzkarContent extends StatelessWidget {
  final dihikrId;
  final title;

  AzkarContent({this.dihikrId, this.title});

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final data = Provider.of<AzkarServer>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            title,
            style: textTheme(context).headline4!.copyWith(color: AppTheme.secondary),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialogWidget(
                            title: "رێکخستەنەکان",
                            child: Container(
                              height: size.height * 0.07,
                              child: SingleChildScrollView(
                                child: Consumer<LocalStorage>(
                                    builder: (ctx, setting, _) => Column(
                                          children: [
                                            SwitchListTile(
                                                title: Text(
                                                  'پیشاندانی مانای کوردی',
                                                  style: textTheme(context).headline4,
                                                ),
                                                activeColor: AppTheme.secondary,
                                                value: setting.zikr_is_kurdish_tafsir,
                                                onChanged: (value) {
                                                  setting.change_kurdish_tafisr(value: value, type: 'zikr');
                                                }),
                                          ],
                                        )),
                              ),
                            ),
                            onPress: () {},
                            onPress1: () {},
                          ));
                },
                icon: Icon(Icons.settings)),
          ]),
      body: FutureBuilder(
        future: data.getAzkar(dihikrId: dihikrId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                color: AppTheme.secondary,
              ));
            default:
              if (snapshot.hasError)
                return Text('هەلە: تکایە بەرنامەکە داخەو بیکەرەوە');
              else
                return Consumer<AzkarServer>(
                    builder: (ctx, azkar, _) => ListView.builder(
                        padding: EdgeInsets.only(bottom: 5, top: 5),
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
