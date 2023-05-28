import 'package:flutter/material.dart';
import 'package:islamic360/Theme/style.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.location_off,
            size: 120,
            color: AppTheme.secondary,
          ),
          SizedBox(height: 20,),
          Text(
            error!,style: textTheme(context).headline5,
          ),
          SizedBox(height: 30,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.secondary,padding: EdgeInsets.symmetric(horizontal: 10,)
            ),
            child:  Text("هەوڵدانەوە",style: textTheme(context).headline5!.copyWith(color: AppTheme.primary)),
            onPressed: () {
              if (callback != null) callback!();
            },
          )
        ],
      ),
    );
  }
}