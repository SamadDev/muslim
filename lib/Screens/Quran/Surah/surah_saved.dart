import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class SurahSaved extends StatelessWidget {
  Widget build(BuildContext context) {
    final data = Provider.of<Saved>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'زەخیرەکراو',
          style: textTheme(context).headline2,
        ),
      ),
      body: FutureBuilder(
        future: data.getSaved(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError)
                return Text('هەلە: تاکیە بەرنامەکە داخەو بیکەرەوە');
              else
                return ListView.separated(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    separatorBuilder: (ctx, c) => Divider(
                          color: AppTheme.white.withOpacity(0.2),
                        ),
                    itemCount: data.list.length,
                    itemBuilder: (ctx, i) =>
                        SurahSavedWidget(data: data.list[i], index: i));
          }
        },
      ),
    );
  }
}

class SurahSavedWidget extends StatelessWidget {
  final Data data;
  final index;

  SurahSavedWidget({required this.data, this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Saved>(context);
    return ListTile(
        leading: StarIcon(number_ayah: data.index, image: 'octagonal_1.svg'),
        title: Text(
          data.surah!,
          style: textTheme(context).headline3,
        ),
        subtitle: Text(
          "150 ئایەت",
          style: textTheme(context).subtitle1,
        ),
        trailing: TextButton(
          child: Image.asset(
            'assets/images/close.png',
            color: AppTheme.red,
            height: 22,
            width: 22,
          ),
          onPressed: () {
            provider.removeSaved(data.index);
          },
        ));
  }
}
