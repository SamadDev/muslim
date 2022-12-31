import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class SurahScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final data = Provider.of<QuranServes>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(55), child: CustomAppBarWidget()),
      body: FutureBuilder(
        future: data.getQuran(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child:CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return Text('هەلە: تاکیە بەرنامەکە داخەو بیکەرەوە');
              else
                return Consumer<QuranServes>(
                    builder: (ctx, surah, _) =>
                        ListView.separated(
                            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            separatorBuilder: (ctx, c) =>
                                Divider(
                                  color: AppTheme.white.withOpacity(0.2),
                                ),
                            itemCount: surah.quran_list.length,
                            itemBuilder: (ctx, i) =>
                                QuranListWidget(
                                  surah: surah.quran_list[i],
                                )));
          }
        },
      ),
    );
  }
}





