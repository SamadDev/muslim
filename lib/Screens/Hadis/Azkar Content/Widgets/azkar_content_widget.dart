import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islamic360/Utils/exports.dart';

class AzkarContentWidget extends StatefulWidget {
  final Azkar azkar;

  AzkarContentWidget({required this.azkar});

  @override
  State<AzkarContentWidget> createState() => _AzkarContentWidgetState();
}

class _AzkarContentWidgetState extends State<AzkarContentWidget> {
  var count;
  @override
  void initState() {
    count = widget.azkar.count;
    super.initState();
  }

  @override
  void dispose() {
    count ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local_data = Provider.of<LocalStorage>(context);
    return InkWell(
      onTap: () {
        setState(() {
          widget.azkar.count == null || widget.azkar.count.toString() == '1' || count == 0 ? "" : count--;
        });
      },
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
                    Text(
                      widget.azkar.ardhikr!,
                      textAlign: TextAlign.start,
                      style: textTheme(context).bodyText1!.copyWith(fontWeight: FontWeight.w500, fontSize: 24),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    local_data.zikr_is_kurdish_tafsir
                        ? Padding(
                            padding: EdgeInsets.only(bottom: 12.0),
                            child: Text(widget.azkar.krdhikr!,
                                textAlign: TextAlign.start, style: textTheme(context).headline4),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            widget.azkar.count == null || widget.azkar.count.toString() == '1'
                ? SizedBox.shrink()
                : PhysicalModel(
                    elevation: 2,
                    shape: BoxShape.circle,
                    color: AppTheme.white,
                    child: Container(
                      alignment: Alignment.center,
                      width: 45,
                      height: 45,
                      child: Text("${count}", style: textTheme(context).headline5!.copyWith(color: AppTheme.black)),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
