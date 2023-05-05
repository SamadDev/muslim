import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';

class DuaWidget extends StatelessWidget {
  final Dua dua;
  DuaWidget({required this.dua});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 40,
          padding: EdgeInsets.all(2),
          width: 150,
          decoration: BoxDecoration(
              color: AppTheme.secondary,
              borderRadius: BorderRadius.circular(15)),
          child: Align(
            alignment: Alignment.center,
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
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                      color: AppTheme.primary,
                    ))
              ],
            ),
          ),
        ),
        Text(
          dua.dua!,
          style: textTheme(context).bodyText1!.copyWith(fontSize: 20),
        ),
      ]),
    );
  }
}
