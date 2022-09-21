import 'package:flutter/material.dart';
import 'package:islamic360/Theme/style.dart';

class AlertDialogWidget extends StatelessWidget {
  AlertDialogWidget({this.title, this.child, this.onPress, this.onPress1});

  final child;
  final title;
  final onPress;
  final onPress1;

  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        backgroundColor: AppTheme.primary,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: new Text(
          title,
          style: Theme.of(context).textTheme.headline3!.copyWith(decoration: TextDecoration.underline),
        ),
        content: child,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                  ),
                  onPressed: onPress,
                  child: Text("ریسێت",
                      style: Theme.of(context).textTheme.headline4)),
              SizedBox(
                width: 5,
              ),
              OutlinedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ))),
                child: Text("گەرانەو",
                    style: Theme.of(context).textTheme.headline5),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ],
      );
    });
  }
}
