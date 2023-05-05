import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LastRead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Saved>(context, listen: false);
    return GestureDetector(
      onTap: () {
        navigatorRouteAnimation(
            context: context,
            page: AyahScreen(
              index: data.data!.index,
              surah: data.data!.surah,
            ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/mesque2.jpeg'),
                opacity: 0.1,
                fit: BoxFit.cover),
            color: AppTheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'کۆتا خوێندنەوە',
                      style: textTheme(context)
                          .headline4!
                          .copyWith(color: AppTheme.white, fontSize: 22,height: 1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset('assets/images/octagonal_1.svg',
                                height: 50, color: AppTheme.white),
                            Text(
                              data.data!.ayah.toString(),
                              style: textTheme(context)
                                  .headline6!
                                  .copyWith(color: AppTheme.white),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.data!.surah!,
                              style: textTheme(context).headline3!.copyWith(
                                  fontSize: 30,
                                  color: AppTheme.white,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              "ئایەتی ${data.data!.ayah}",
                              style: textTheme(context)
                                  .headline4!
                                  .copyWith(color: AppTheme.white,height: 1),
                            ),
                          ],
                        ),
                      ],
                    )
                  ]),
            ),
            Container(
              child: Image.asset(
                'assets/images/quran_book.png',
              ),
            )
          ],
        ),
      ),
    );
  }
}
