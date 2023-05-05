import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class TasbiScreen extends StatelessWidget {
  final zikr;

  TasbiScreen({this.zikr});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TasbihSever>(context);
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        leading: BackButton(onPressed: ()=>navigatorRouteAnimation(context: context,page: NavigationButtonScreen()),),
          elevation: 1,
          title: Text(
            zikr ?? "أسْتَغْفِرُ اللهَ",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
      body: InkWell(
        onTap: () {
          data.addOne();
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50,top: 180),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: AppTheme.secondary, borderRadius: BorderRadius.circular(180)),
                  height: 250,
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${data.count}",
                        style: textTheme(context).headline1!.copyWith(color: AppTheme.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0, top: 8, left: 8),
                        child: Text(
                          zikr ?? "أسْتَغْفِرُ اللهَ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme(context).bodyText1!.copyWith(height: 1, color: AppTheme.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 8, left: 3),
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.white, side: BorderSide(color: AppTheme.secondary)),
                        onPressed: () {
                          data.resetCount();
                        },
                        child: Text(
                          "سفر کردنەوە",
                          style: textTheme(context).headline5,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 3, left: 8),
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppTheme.secondary),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (cxt) => TasbihZikrScreen()));
                          data.addOne();
                        },
                        child: Text("گۆڕین", style: textTheme(context).headline5!.copyWith(color: AppTheme.white)),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
