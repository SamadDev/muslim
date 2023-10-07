import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class CustomAppBarWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Text(
        'سورەت',
        style: textTheme(context).displayMedium!.copyWith(fontSize: 23, color: AppTheme.white),
      ),
      actions: [
        Row(
          children: [
            TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          padding: EdgeInsets.only(right: 30, left: 30, top: 20, bottom: 30),
                          child: Consumer<LocalStorage>(
                              builder: (ctx, setting, _) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'رێکخستنەکان',
                                        style: textTheme(context).titleLarge!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.black.withOpacity(0.8),
                                              fontSize: 20,
                                            ),
                                      ),
                                      Row(
                                        children: [
                                          PageViewCard(
                                            isSelected: setting.pageView == "tafsir",
                                            type: "tafsir",
                                            image: 'tafsir.png',
                                          ),
                                          PageViewCard(
                                            isSelected: setting.pageView == "png",
                                            type: "png",
                                            image: 'page.png',
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                        );
                      });
                },
                label: Text(
                  '',
                  style: textTheme(context).headlineSmall,
                ),
                icon: Icon(
                  Icons.settings,
                  color: AppTheme.white,
                )),
            TextButton.icon(
                onPressed: () {
                  navigatorRouteAnimation(context: context, page: SurahSearch());
                },
                label: Text(
                  '',
                  style: textTheme(context).headlineSmall,
                ),
                icon: Image.asset(
                  'assets/images/search.png',
                  width: 21,
                  height: 21,
                  color: AppTheme.white,
                )),
          ],
        )
      ],
    );
  }
}
