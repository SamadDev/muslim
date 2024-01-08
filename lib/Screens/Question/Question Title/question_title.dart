import 'package:flutter/material.dart';
import 'package:islamic360/Screens/Question/Question%20Title/Widgets/question_title_widget.dart';
import 'package:islamic360/Serves/question_title.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class QuestionTitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final get = Provider.of<QuestionTitleService>(context, listen: false);
    TextEditingController controller = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.secondary,
          onPressed: () {
            get.openGmailAndComposeEmail();
          },
          child: Icon(Icons.question_answer_sharp)),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 8),
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
          'پرسیارەکان',
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(color: AppTheme.secondary, borderRadius: BorderRadius.circular(4)),
            child: Consumer<QuestionTitleService>(
                builder: (ctx, data, _) => TextField(
                      cursorColor: AppTheme.white,
                      controller: controller,
                      style: textTheme(context).headline4!.copyWith(color: AppTheme.white),
                      decoration: InputDecoration(
                          labelStyle: textTheme(context).headline4,
                          hintText: 'گەڕان بکە بۆ پرسیار....',
                          hintStyle: Theme.of(context).textTheme.headline4!.copyWith(color: AppTheme.white),
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
            future: get.getQuestionTitle(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: Text('چاوەروانی....'));
                default:
                  if (snapshot.hasError)
                    return Text('هەلە: تکایە بەرنامەکە داخەو بیکەرەوە');
                  else
                    return Consumer<QuestionTitleService>(
                      builder: (ctx, title, _) => Expanded(
                        child: ListView.separated(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            separatorBuilder: (ctx, c) => Divider(
                                  height: 6,
                                  color: AppTheme.white.withOpacity(1),
                                ),
                            itemCount: title.search_question_title.length == 0 || controller.text.isEmpty
                                ? title.question_title_list.length
                                : title.search_question_title.length,
                            itemBuilder: (ctx, i) => QuestionTitleWidget(
                                  data: title.search_question_title.length == 0 || controller.text.isEmpty
                                      ? title.question_title_list[i]
                                      : title.search_question_title[i],
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
