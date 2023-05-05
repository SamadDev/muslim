import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';

class AzkarTitleWidget extends StatelessWidget {
  final AzkarTitle title;
  final index;

  AzkarTitleWidget({required this.title, required this.index});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorRouteAnimation(
            context: context,
            page: AzkarContent(
              dihikrId: int.parse(title.num!),
              title: title.name,
            ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10,),
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: AppTheme.white, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: StarIcon(image: 'octagonal_1.svg', number_ayah: index + 1),
          title: Text(
            title.name!,
            style: textTheme(context).headline4,
          ),
        ),
      ),
    );
  }
}
