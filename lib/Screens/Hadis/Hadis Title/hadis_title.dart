import 'package:flutter/material.dart';
import 'package:islamic360/Screens/Hadis/Hadis%20Title/Widgets/hadis_title_widget.dart';
import 'package:islamic360/Serves/hadis.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class HadisTitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final get = Provider.of<HadisServer>(context, listen: false);
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 8),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/bookmark.png',
                  width: 22,
                  height: 22,
                  color: AppTheme.secondary,
                )),
          )
        ],
        title: Text(
          'فەرمودەکانی موسلیم',
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(color: AppTheme.secondary, borderRadius: BorderRadius.circular(4)),
            child: Consumer<HadisServer>(
                builder: (ctx, data, _) => TextField(
                      cursorColor: AppTheme.white,
                      controller: controller,
                      style: textTheme(context).headline4!.copyWith(color: AppTheme.white),
                      decoration: InputDecoration(
                          labelStyle: textTheme(context).headline4,
                          hintText: 'گەڕان بکە بۆ فەرمودە....',
                          hintStyle: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white),
                          border: InputBorder.none,
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                size: 25,
                                color: AppTheme.white,
                              )),
                          contentPadding: EdgeInsets.all(13)),
                      onChanged: (value) {
                        data.search_surah(value);
                      },
                    )),
          ),
          FutureBuilder(
            future: get.getMuslimTitle(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: Text('چاوەروانی....'));
                default:
                  if (snapshot.hasError)
                    return Text('هەلە: تاکیە بەرنامەکە داخەو بیکەرەوە');
                  else
                    return Consumer<HadisServer>(
                      builder: (ctx, title, _) => Expanded(
                        child: ListView.separated(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            separatorBuilder: (ctx, c) => Divider(
                                  height: 6,
                                  color: AppTheme.white.withOpacity(1),
                                ),
                            itemCount: title.search_muslim_title.length == 0 || controller.text.isEmpty
                                ? title.muslimList_title.length
                                : title.search_muslim_title.length,
                            itemBuilder: (ctx, i) => HadisTitleWidget(
                                  title: title.search_muslim_title.length == 0 || controller.text.isEmpty
                                      ? title.muslimList_title[i]
                                      : title.search_muslim_title[i],
                                  index: i,
                                )),
                      ),
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}
