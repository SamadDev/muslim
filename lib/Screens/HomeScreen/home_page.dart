import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic360/Screens/Quran/Surah/surah.dart';
import 'package:islamic360/Utils/exports.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.settings_outlined, color: AppTheme.secondary),
              ),
            ],
          ),
        ],
        title: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppTheme.secondary,
            ),
            Text(
              'Rawalpindi, Pakistan',
              style: textTheme(context).headline5,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 270,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    'assets/images/shape1.png',
                    height: 230,fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                  Positioned(bottom: 55,child: Text('04:45 asr',style: textTheme(context).headline2,)),
                  Positioned(bottom: 20,child: Text('Tuesday, 21 May',style: textTheme(context).headline4,)),
                  Positioned(bottom: 0,child: Text('16 RAMADAN 1443 AH',style: textTheme(context).headline6,))
                ],
              ),
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                Expanded(
                    child:
                        CartIcon(text: 'کاتی بانگ', icon: '77.svg', route: '')),
                Expanded(
                    child: CartIcon(text: 'دوعا', icon: '88.svg', route: '')),
                Expanded(
                    child: CartIcon(text: 'قورئان', icon: '99.svg', route: SurahScreen()))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CartIcon(text: 'وێردەکان', icon: '44.svg', route: AzkarTitleScreen())),
                Expanded(
                    child: CartIcon(
                        text: 'رۆژمێری هیجری', icon: '55.svg', route: '')),
                Expanded(
                    child:
                        CartIcon(text: 'مزگەوتەکان', icon: '66.svg', route: ''))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CartIcon(text: 'تەسبیح', icon: '11.svg', route: TasbiScreen())),
                Expanded(
                    child:
                        CartIcon(text: 'دەربارە', icon: '22.svg', route: '')),
                Expanded(
                    child: CartIcon(text: 'قیبلە', icon: '33.svg', route: QiblahCompass()))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CartIcon(text: 'تەسبیح', icon: '11.svg', route: TasbiScreen())),
                Expanded(
                    child:
                    CartIcon(text: 'دەربارە', icon: '22.svg', route: '')),
                Expanded(
                    child: CartIcon(text: 'قیبلە', icon: '33.svg', route: QiblahCompass()))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  final icon;
  final text;
  final route;

  CartIcon({required this.text, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>route));
        },
        child: Container(
            height: 110,
            width: 110,
            color: AppTheme.cart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/$icon",
                  width: 40,
                  height: 40,
                  color: AppTheme.secondary,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  text,
                  style: textTheme(context).headline6,
                )
              ],
            )),
      ),
    );
  }
}
