import 'package:flutter/material.dart';
import 'package:islamic360/Modules/question_title.dart';
import 'package:islamic360/Screens/Question/Question%20Content/question_content.dart';
import 'package:islamic360/Utils/exports.dart';

class QuestionTitleWidget extends StatelessWidget {
  final QuestionTitle data;
  final index;

  QuestionTitleWidget({required this.data, required this.index});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorRouteAnimation(
            context: context,
            page: QuestionContentScreen(
              title: data.name,
              titleId: data.id,
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
            data.name!,
            style: textTheme(context).headline4,
          ),
        ),
      ),
    );
  }
}
