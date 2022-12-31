import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islamic360/Utils/exports.dart';


class AzkarContentWidget extends StatelessWidget {
  final Azkar azkar;

  AzkarContentWidget({required this.azkar});

  @override
  Widget build(BuildContext context) {
    final local_data=Provider.of<LocalStorage>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0,right: 8,left: 8),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 5, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 35,
              width: double.infinity,
              color: AppTheme.secondary,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      //06230e
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.copy,
                          color: AppTheme.primary,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: AppTheme.primary,
                          )),
                    ],
                  )),
            ),
            Text(
              azkar.ardhikr!,
              style: textTheme(context).headline3!.copyWith(color: AppTheme.primary, fontWeight: FontWeight.w500),
            ),
            Divider(color: AppTheme.white_think.withOpacity(0.3),indent: 10,endIndent: 150,),
           local_data.zikr_is_kurdish_tafsir? Text(
              azkar.krdhikr!,
              style: textTheme(context)
                  .headline5!.copyWith(color: AppTheme.primary, fontWeight: FontWeight.w400,
                fontFamily: 'nrt',),
            ):SizedBox.shrink(),
            Divider(),
          ],
        ),
      ),
    );
  }
}
