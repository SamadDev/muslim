import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  AlertDialogWidget({this.title, this.child, this.onPress, this.onPress1});

  final child;
  final title;
  final onPress;
  final onPress1;

  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: new Text(
          title,
          style: Theme.of(context).textTheme.headline3!.copyWith(
              decoration: TextDecoration.underline,
              fontFamily: 'nrt',
              // color: AppTheme.black,
              fontWeight: FontWeight.w500),
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("گەرانەوە",
                      style: Theme.of(context).textTheme.headline4)),
              Spacer()
            ],
          ),
        ],
      );
    });
  }
}
