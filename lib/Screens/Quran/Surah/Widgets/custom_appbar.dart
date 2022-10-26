import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';

class CustomAppBarWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      title: Text(
        'سورەت',
        style: textTheme(context).headline2!.copyWith(fontSize: 23),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {
                    navigatorRouteAnimation(
                        context: context, page: SurahSaved());
                  },
                  label: Text(
                    '',
                    style: textTheme(context).headline5,
                  ),
                  icon: Image.asset(
                    'assets/images/bookmark.png',
                    width: 20,
                    height: 20,
                    color: AppTheme.text,
                  )),
              TextButton.icon(
                  onPressed: () {
                    navigatorRouteAnimation(
                        context: context, page: SurahSearch());
                  },
                  label: Text(
                    '',
                    style: textTheme(context).headline5,
                  ),
                  icon: Image.asset(
                    'assets/images/search.png',
                    width: 21,
                    height: 21,
                    color: AppTheme.text,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
