import 'package:flutter/material.dart';
import 'package:islamic360/Screens/Question/Question%20Content/Widgets/question_content_widget.dart';
import 'package:islamic360/Serves/question_content.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class QuestionContentScreen extends StatelessWidget {
  final titleId;
  final title;

  QuestionContentScreen({this.titleId, this.title});

  Widget build(BuildContext context) {
    final data = Provider.of<QuestionServer>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: textTheme(context).headlineMedium!.copyWith(color: AppTheme.primary),
        ),
      ),
      body: FutureBuilder(
        future: data.getQuestion(titleId: titleId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                color: AppTheme.secondary,
              ));
            default:
              if (snapshot.hasError)
                return Text('هەلە: تکایە بەرنامەکە داخەو بیکەرەوە');
              else
                return Consumer<QuestionServer>(
                    builder: (ctx, question, _) => ListView.builder(
                        padding: EdgeInsets.only(bottom: 5, top: 5),
                        itemCount: question.question_list.length,
                        itemBuilder: (ctx, i) => QuestionContentWidget(
                              question: question.question_list[i],
                            )));
          }
        },
      ),
    );
  }
}
