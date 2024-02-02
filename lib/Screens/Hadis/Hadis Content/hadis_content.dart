import 'package:flutter/material.dart';
import 'package:islamic360/Screens/Hadis/Hadis%20Content/Widgets/hadis_content_widget.dart';
import 'package:islamic360/Serves/hadis.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class HadisContentScreen extends StatelessWidget {
  final title;

  HadisContentScreen({this.title});

  Widget build(BuildContext context) {
    final data = Provider.of<HadisServer>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: textTheme(context).headlineMedium!.copyWith(color: AppTheme.primary),
        ),
      ),
      body: FutureBuilder(
        future: data.getMuslimContent(title: title),
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
                return Consumer<HadisServer>(
                    builder: (ctx, hadis, _) => ListView.builder(
                        padding: EdgeInsets.only(bottom: 5, top: 5),
                        itemCount: hadis.muslimList_content.length,
                        itemBuilder: (ctx, i) => HadisContentWidget(
                          hadis: hadis.muslimList_content[i],
                        )));
          }
        },
      ),
    );
  }
}
