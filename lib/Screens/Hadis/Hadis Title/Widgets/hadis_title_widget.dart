import 'package:flutter/material.dart';
import 'package:islamic360/Modules/muslim.dart';
import 'package:islamic360/Screens/Hadis/Hadis%20Content/hadis_content.dart';
import 'package:islamic360/Utils/exports.dart';

class HadisTitleWidget extends StatelessWidget {
  late final  title;
  late final index;

  HadisTitleWidget({required this.title, required this.index});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatorRouteAnimation(
            context: context,
            page: HadisContentScreen(
              title: title.book,
            ));
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: StarIcon(image: 'octagonal_1.svg', number_ayah: index + 1),
          title: Text(
            title.book!,
            style: textTheme(context).headline4,
          ),
        ),
      ),
    );
  }
}
