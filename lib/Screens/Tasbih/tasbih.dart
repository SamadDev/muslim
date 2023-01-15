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
      appBar: AppBar(elevation: 1, actions: [
        IconButton(
            onPressed: () {
              navigatorRouteAnimation(
                  context: context, page: TasbihZikrScreen());
            },
            icon: Icon(
              Icons.change_circle,
              size: 35,
            )),
        IconButton(
            onPressed: () {
              data.resetCount();
            },
            icon: Icon(
              Icons.refresh_outlined,
              size: 35,
            ))
      ]),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          data.addOne();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0, right: 8, left: 8),
                child: Container(
                  child: Text(
                    zikr ?? "الستغفر اللە",
                    style: textTheme(context).headline1!.copyWith(
                        color: AppTheme.secondary, fontFamily: 'noor'),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "${data.count}",
                style: textTheme(context)
                    .headline1!
                    .copyWith(color: AppTheme.secondary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
