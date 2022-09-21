import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';



class CustomAppBarWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: Text(
        'سورەت',
        style: textTheme(context).headline2!.copyWith(color: AppTheme.white),
      ),
      actions: [
       Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                    ),
                    child: IconButton(
                        onPressed: () {
                         Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SuraSearch()));
                        },
                        icon: Icon(Icons.search, size: 30)),
                  ),
                ],
              )
      ],
    );
  }
}
