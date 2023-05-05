import 'package:flutter/material.dart';
import 'package:islamic360/Theme/style.dart';

class AyahPng extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> imageList = List<String>.generate(
      1024,
      (index) => 'assets/images/1024/page${(index + 1).toString().padLeft(3, '0')}.png',
    );

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppTheme.black),
          backgroundColor: AppTheme.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: PageController(viewportFraction: 1),
                scrollDirection: Axis.horizontal,
                children: imageList.map((image) {
                  return Image.asset(
                    image,
                    fit: BoxFit.fill,
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }
}
