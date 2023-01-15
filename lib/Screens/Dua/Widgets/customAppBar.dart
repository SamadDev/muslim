import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';

class CustomDuaAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          child: ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              height: size.height * 0.2,
              width: size.width,
              decoration: BoxDecoration(
                color: AppTheme.secondary,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/mosque_top.png',
                    ),
                    opacity: 0.1,
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 60, right: 15, left: 15, bottom: 10),
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 25, left: 5),
          width: size.width,
          decoration: BoxDecoration(
              color: AppTheme.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'قُالُ اللَّهُ تَبَارَكَ وَتَعَالَى',
                      style: textTheme(context)
                          .bodyText2!
                          .copyWith(fontFamily: 'amir', fontSize: 18),
                    ),
                    Text(
                      "وَقَالَ رَبُّكُمُ ادْعُونِي أَسْتَجِبْ لَكُمْ",
                      style: textTheme(context)
                          .bodyText1!
                          .copyWith(fontFamily: 'amir'),
                    ),
                  ]),
              Expanded(
                  child: Image.asset(
                "assets/images/pray_night.png",
                // color: AppTheme.secondary,
                height: 70,
                width: 70,
              ))
            ],
          ),
        )
      ],
    );
  }
}
