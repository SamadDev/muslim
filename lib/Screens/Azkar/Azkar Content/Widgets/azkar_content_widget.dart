import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islamic360/Utils/exports.dart';

class AzkarContentWidget extends StatelessWidget {
  final Azkar azkar;

  AzkarContentWidget({required this.azkar});

  @override
  Widget build(BuildContext context) {
    final local_data = Provider.of<LocalStorage>(context);
    return Padding(
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
            style: textTheme(context)
                .headline3!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 25),
          ),
          local_data.zikr_is_kurdish_tafsir
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: AppTheme.secondary.withOpacity(0.3),
                      indent: 10,
                      height: 20,
                      endIndent: 150,
                    ),
                    Text(azkar.krdhikr!, style: textTheme(context).headline4),
                  ],
                )
              : SizedBox.shrink(),
          Divider(),
        ],
      ),
    );
  }
}
