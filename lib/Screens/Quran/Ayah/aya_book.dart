// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:islamic360/Utils/exports.dart';
// import 'package:provider/provider.dart';
//
// class AyahPng extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<String>.generate(
//       1024,
//       (index) => 'assets/images/quran_pages/page${(index + 1).toString().padLeft(3, '0')}.png',
//     );
//     final glyphProvider = Provider.of<GlyphService>(context, listen: false);
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: IconThemeData(color: AppTheme.black),
//           backgroundColor: AppTheme.transparent,
//         ),
//         body: FutureBuilder(
//           future: glyphProvider.getGlyph(3),
//           builder: (ctx, snap) => snap.connectionState == ConnectionState.waiting
//               ? CircularProgressIndicator()
//               : SizedBox(
//             width: double.maxFinite,
//             height: double.maxFinite,
//             child: Stack(
//               fit: StackFit.loose,
//                     children: [
//                       Image.asset('assets/images/p4.png'),
//                       ListView.builder(
//                           itemCount: glyphProvider.glyph.length,
//                           itemBuilder: (ctx, i) => DrawGlyph(
//                               minX: glyphProvider.glyph[i].minX!,
//                               minY: glyphProvider.glyph[i].minY!,
//                               maxX: glyphProvider.glyph[i].maxX!,
//                               maxY: glyphProvider.glyph[i].maxY!)),
//                     ],
//                   ),
//               ),
//         ));
//   }
// }
//
// class DrawGlyph extends StatelessWidget {
//   const DrawGlyph({
//     required this.minX,
//     required this.minY,
//     required this.maxX,
//     required this.maxY,
//   });
//   final int minX;
//   final int minY;
//   final int maxX;
//   final int maxY;
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       return Stack(
//         children: <Widget>[
//           Transform.translate(
//               offset: Offset(constraints.biggest.width * (minX / 1260), constraints.biggest.height * (minY / 2000)),
//               child: Container(
//                 width: constraints.biggest.width * ((maxX - minX) / 1260),
//                 height: constraints.biggest.height * ((maxY - minY) / 2000),
//                 color: Colors.green.withOpacity(0.3),
//               )),
//         ],
//       );
//     });
//   }
// }

import 'package:flutter/material.dart';

import '../../../Serves/Saved.dart';
import '../../../Theme/style.dart';
import 'package:provider/provider.dart';

class AyahPng extends StatelessWidget {
  final initialPage;

  AyahPng(this.initialPage);

  @override
  Widget build(BuildContext context) {
    print(initialPage);
    final images = List<String>.generate(
      1024,
      (index) => 'assets/images/quran_pages/page${(index).toString().padLeft(3, '0')}.png',
    );
    final save = Provider.of<Saved>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
          //   child: GestureDetector(
          //     onTap: () async {
          //       await save.removeSaved();
          //       await save.setSaved(Data(ayah: '1', index: , surah: surah));
          //       await save.getSaved();
          //     },
          //
          //     child: Image.asset(
          //       'assets/images/bookmark.png',
          //       width: 20,
          //       height: 20,
          //       color: AppTheme.white,
          //     ),
          //   ),
          // ),
        //   IconButton(
        //     tooltip: 'لیستی قورئان',
        //     icon: Icon(
        //       Icons.keyboard_arrow_down_outlined,
        //       color: AppTheme.white,
        //     ),
        //     onPressed: () {},
        //   )
        // ],
      )]),
      body: PageView.builder(
        controller: PageController(
          viewportFraction: 1,
          initialPage: int.parse(initialPage.toString()),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (ctx, i) => LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Image.asset(
                images[i],
                fit: BoxFit.cover,
              ),
            ],
          );
        }),
      ),
    );
  }
}

class DrawGlyph extends StatelessWidget {
  const DrawGlyph({required this.minX, required this.minY, required this.maxX, required this.maxY});
  final int minX;
  final int minY;
  final int maxX;
  final int maxY;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: <Widget>[
          Transform.translate(
              offset: Offset(constraints.biggest.width * (minX / 1270), constraints.biggest.height * (minY / 2000)),
              child: Container(
                width: constraints.biggest.width * ((maxX - minX) / 1260),
                height: constraints.biggest.height * ((maxY - minY) / 2000),
                color: Colors.green.withOpacity(0.3),
              )),
        ],
      );
    });
  }
}
