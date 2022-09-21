import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic360/Theme/style.dart';

class StarIcon extends StatelessWidget {
  final number_ayah;
  final image;
  StarIcon({this.number_ayah,this.image});


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/$image',
          height: 50,
          width: 50,
          color: AppTheme.secondary,
        ),
        Text(
          number_ayah.toString(),
          style: textTheme(context).headline6!.copyWith(color: AppTheme.white),
        )
      ],
    );
  }
}