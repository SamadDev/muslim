import 'package:flutter/material.dart';

void navigatorRouteAnimation({context,page}){
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (BuildContext context,
            Animation animation,
            Animation  secondaryAnimation) {
          return page;
        },
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return Align(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
}