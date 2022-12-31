import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class SurahSearch extends StatelessWidget {
  Widget build(BuildContext context) {
    final data = Provider.of<QuranServes>(context, listen: false);
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(actions: [
        Container(
          width: 300,
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.search,
            style: Theme.of(context).textTheme.headline3,
            onSubmitted: (value) {
              data.search_surah(value);
            },
            onChanged: (value) {
              data.search_surah(value);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 5),
              border: InputBorder.none,
              hintStyle: Theme.of(context)
                  .textTheme
                  .headline6,
              hintText: "گەران...",
            ),
          ),
        )
      ]),
      body: FutureBuilder(
        future: data.getQuran(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: Text('چاوەروانی....'));
            default:
              if (snapshot.hasError)
                return Text('هەلە: تکایە بەرنامەکە داخەو بیکەرەوە');
              else
                return Consumer<QuranServes>(
                    builder: (ctx, surah, _) =>
                        data.search_surah_list.isEmpty ||
                                controller.text.isEmpty
                            ? HelperScreen(
                                icon: Icons.search,
                                text: ' گەران بکە بە پێی ناو و ژمارەی سورەت',
                              )
                            : ListView.separated(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                separatorBuilder: (ctx, c) => Divider(
                                      color: AppTheme.white.withOpacity(0.1),
                                    ),
                                itemCount: surah.search_surah_list.length,
                                itemBuilder: (ctx, i) => QuranListWidget(
                                      surah: surah.search_surah_list[i],
                                    )));
          }
        },
      ),
    );
  }
}
