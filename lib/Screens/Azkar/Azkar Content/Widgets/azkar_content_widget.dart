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
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 8, left: 8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Card(
            margin: EdgeInsets.only(bottom: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            shadowColor: AppTheme.grey,
            elevation: 1,
            child: Container(
              width: Responsive.sH(context),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    azkar.ardhikr!,
                    style: textTheme(context).bodyText1!.copyWith(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  local_data.zikr_is_kurdish_tafsir
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: Text(azkar.krdhikr!, style: textTheme(context).headline4),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
          azkar.count == null
              ? SizedBox.shrink()
              : PhysicalModel(
                  elevation: 2,
                  shape: BoxShape.circle,
                  color: AppTheme.white,
                  child: Container(
                    alignment: Alignment.center,
                    width: 45,
                    height: 45,
                    child: Text("${azkar.count}", style: textTheme(context).headline5!.copyWith(color: AppTheme.text)),
                  ),
                )
        ],
      ),
    );
  }
}
