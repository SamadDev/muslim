// import 'package:flutter/material.dart';
// import 'package:islamic360/Utils/exports.dart';
// import 'package:provider/provider.dart';

// class SurahSaved extends StatelessWidget {
//   Widget build(BuildContext context) {
//     final data = Provider.of<Saved>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'زەخیرەکراو',
//           style: textTheme(context).headline2,
//         ),
//       ),
//       body: FutureBuilder(
//         future: data.getSaved(),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.waiting:
//               return Center(child: CircularProgressIndicator());
//             default:
//               if (snapshot.hasError)
//                 return Text('هەلە: تاکیە بەرنامەکە داخەو بیکەرەوە');
//               else
//                 return ListView.builder(
//                     padding: EdgeInsets.only(top: 5, bottom: 5),
//                     itemCount: data.list.length,
//                     itemBuilder: (ctx, i) =>
//                         SurahSavedWidget(data: data.list[i]));
//           }
//         },
//       ),
//     );
//   }
// }

// class SurahSavedWidget extends StatelessWidget {
//   final Data data;

//   SurahSavedWidget({required this.data});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<Saved>(context);
//     return Container(
//       margin: EdgeInsets.only(right: 10, left: 10, top: 10),
//       padding: EdgeInsets.all(5),
//       decoration: BoxDecoration(
//           color: AppTheme.white, borderRadius: BorderRadius.circular(15)),
//       child: ListTile(
//           onTap: () {
//             navigatorRouteAnimation(
//               page: AyahScreen(index: data.index, surah: data.surah),
//               context: context,
//             );
//           },
//           leading: StarIcon(number_ayah: data.index, image: 'octagonal_1.svg'),
//           title: Text(
//             data.surah!,
//             style: textTheme(context).headline3,
//           ),
//           subtitle: Text(
//             "150 ئایەت",
//             style: textTheme(context).subtitle1,
//           ),
//           trailing: TextButton(
//             child: Image.asset(
//               'assets/images/close.png',
//               color: AppTheme.red,
//               height: 35,
//               width: 35,
//             ),
//             onPressed: () {
//               provider.removeSaved(data.index);
//             },
//           )),
//     );
//   }
// }
