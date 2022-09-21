import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';


class HelperScreen extends StatelessWidget {
  final icon;
  final text;
  HelperScreen({this.text,this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            icon,
            color: AppTheme.secondary,
            size: 35,
          ),
        ),
        SizedBox(height: 10,),
        Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }
}
