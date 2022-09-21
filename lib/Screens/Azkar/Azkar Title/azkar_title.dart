import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class AzkarTitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final get = Provider.of<Azkar_title_Server>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10,top: 8,bottom: 8),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  (Icons.save),
                )),
          )
        ],
        title: Text(
          'وێردەکان',
          style: textTheme(context).headline4,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, left: 12),
            child: Container(
              decoration: BoxDecoration(
                  color: AppTheme.white_think,
                  borderRadius: BorderRadius.circular(15)),
              child: Consumer<Azkar_title_Server>(
                  builder: (ctx, data, _) => TextField(
                        style: textTheme(context)
                            .headline5!
                            .copyWith(color: AppTheme.black.withOpacity(0.7)),
                        decoration: InputDecoration(
                            hintText: 'گەڕان بکە بۆ زیکر....',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: AppTheme.black3),
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  color: AppTheme.cart,
                                  size: 30,
                                )),
                            contentPadding: EdgeInsets.all(12)),
                        onChanged: (value) {
                          data.search_surah(value);
                        },
                      )),
            ),
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
                            itemCount: title.search_azkar_title.length == 0
                                ? title.azkar_title_list.length
                                : title.search_azkar_title.length,
                            itemBuilder: (ctx, i) => AzkarTitleWidget(
                                  title: title.search_azkar_title.length == 0
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
