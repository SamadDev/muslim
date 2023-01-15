import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class AzkarTitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final get = Provider.of<Azkar_title_Server>(context, listen: false);
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 8),
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
          'وێردەکان',
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: AppTheme.secondary,
                borderRadius: BorderRadius.circular(15)),
            child: Consumer<Azkar_title_Server>(
                builder: (ctx, data, _) => TextField(
                      cursorColor: AppTheme.white,
                      controller: controller,
                      style: textTheme(context)
                          .headline4!
                          .copyWith(color: AppTheme.white),
                      decoration: InputDecoration(
                          labelStyle: textTheme(context).headline4,
                          hintText: 'گەڕان بکە بۆ زیکر....',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: AppTheme.white),
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
            future: get.getAzkarTitle(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: Text('چاوەروانی....'));
                default:
                  if (snapshot.hasError)
                    return Text('هەلە: تاکیە بەرنامەکە داخەو بیکەرەوە');
                  else
                    return Consumer<Azkar_title_Server>(
                      builder: (ctx, title, _) => Expanded(
                        child: ListView.separated(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            separatorBuilder: (ctx, c) => Divider(
                                  color: AppTheme.white.withOpacity(0.1),
                                ),
                            itemCount: title.search_azkar_title.length == 0 ||
                                    controller.text.isEmpty
                                ? title.azkar_title_list.length
                                : title.search_azkar_title.length,
                            itemBuilder: (ctx, i) => AzkarTitleWidget(
                                  title: title.search_azkar_title.length == 0 ||
                                          controller.text.isEmpty
                                      ? title.azkar_title_list[i]
                                      : title.search_azkar_title[i],
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
