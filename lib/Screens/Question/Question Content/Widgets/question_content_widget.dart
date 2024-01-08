import 'package:flutter/material.dart';
import 'package:islamic360/Modules/quesion_content.dart';
import 'package:islamic360/Serves/question_content.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class QuestionContentWidget extends StatelessWidget {
  final QuestionContent question;

  QuestionContentWidget({required this.question});

  @override
  Widget build(BuildContext context) {
    final parseHtmlString = Provider.of<QuestionServer>(context, listen: false);
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5, right: 8, left: 8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Card(
              color: AppTheme.white.withOpacity(0.5),
              margin: EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              shadowColor: AppTheme.grey,
              elevation: 0,
              child: Container(
                width: Responsive.sH(context),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      parseHtmlString.parseHtmlString(question.ask ?? 'ask').isNotEmpty
                          ? parseHtmlString.parseHtmlString(question.ask ?? '')
                          : parseHtmlString.parseHtmlString(question.title ?? ''),
                      style: textTheme(context).headline4!.copyWith(color: AppTheme.secondary),
                    ),
                    Divider(),
                    Text(
                      parseHtmlString.parseHtmlString(question.question!),
                      style: textTheme(context).headline5,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
