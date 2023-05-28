import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';

class CustomAppBarWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Text(
        'سورەت',
        style: textTheme(context).headline2!.copyWith(fontSize: 23,color: AppTheme.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10),
          child: TextButton.icon(
              onPressed: () {
                navigatorRouteAnimation(context: context, page: SurahSearch());
              },
              label: Text(
                '',
                style: textTheme(context).headline5,
              ),
              icon: Image.asset(
                'assets/images/search.png',
                width: 21,
                height: 21,
                color: AppTheme.white,
              )),
        )
      ],
    );
  }
}
