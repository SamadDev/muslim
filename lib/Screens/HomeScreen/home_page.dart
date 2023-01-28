import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic360/Utils/exports.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: AppTheme.secondary,
            ),
            Text(
              '.......',
              style: textTheme(context).headline4,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: ClipPathClass(),
                child: Container(
                  height: size.height * 0.45,
                  decoration: BoxDecoration(
                      color: AppTheme.secondary,
                      image: DecorationImage(
                          image: AssetImage('assets/images/mesque2.jpeg'),
                          fit: BoxFit.cover,
                          opacity: 0.1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'عیشا',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: AppTheme.white, fontSize: 45),
                    ),
                    Text(
                      'چوارشەمە - 12 - 2022',
                      style: textTheme(context)
                          .headline4!
                          .copyWith(color: AppTheme.white, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppTheme.primary, width: 0.25),
                              borderRadius: BorderRadius.circular(30)),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: 70,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('دەسپێک',
                                  style: textTheme(context).headline4!.copyWith(
                                      fontSize: 20, color: AppTheme.white)),
                              Text('12:41',
                                  style: textTheme(context).headline4!.copyWith(
                                      fontSize: 20, color: AppTheme.white))
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppTheme.primary, width: 0.25),
                              borderRadius: BorderRadius.circular(30)),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: 70,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('کۆتا',
                                  style: textTheme(context).headline4!.copyWith(
                                      fontSize: 20, color: AppTheme.white)),
                              Text('3:41',
                                  style: textTheme(context).headline4!.copyWith(
                                      fontSize: 20, color: AppTheme.white))
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          PageViewWidget(
            list: [
              SingleChildScrollView(
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                          child: CartIcon(
                              text: 'کاتی بانگ', icon: '77.svg', route: '')),
                      Expanded(
                          child: CartIcon(
                              text: 'دوعا',
                              icon: '88.svg',
                              route: DuaScreen())),
                      Expanded(
                          child: CartIcon(
                              text: 'قورئان',
                              icon: '99.svg',
                              route: SurahScreen()))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CartIcon(
                              text: 'وێردەکان',
                              icon: '44.svg',
                              route: AzkarTitleScreen())),
                      Expanded(
                          child: CartIcon(
                              text: 'رۆژمێری هیجری',
                              icon: '55.svg',
                              route: HijriDatePicker())),
                      Expanded(
                          child: CartIcon(
                              text: 'مزگەوتەکان', icon: '66.svg', route: ''))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CartIcon(
                              text: 'تەسبیح',
                              icon: '11.svg',
                              route: TasbiScreen())),
                      Expanded(
                          child: CartIcon(
                              text: 'پرسیار و وڵام',
                              icon: '22.svg',
                              route: '')),
                      Expanded(
                          child: CartIcon(
                              text: 'قیبلە',
                              icon: '33.svg',
                              route: QiblahCompass()))
                    ],
                  ),
                ]),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: CartIcon(
                                text: 'کتێبخانە',
                                icon: '11.svg',
                                route: TasbiScreen())),
                        Expanded(
                            child: CartIcon(
                                text: 'دەربارە', icon: '22.svg', route: '')),
                        Expanded(
                            child: CartIcon(
                                text: 'زەکات',
                                icon: '33.svg',
                                route: QiblahCompass()))
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
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
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        navigatorRouteAnimation(context: context, page: route);
      },
      child: Column(
        children: [
          Container(
            height: size.height * 0.08,
            width: size.width * 0.17,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 10),
            decoration: BoxDecoration(
                color: AppTheme.cart, borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset(
              "assets/icons/$icon",
              width: 40,
              height: 40,
              color: AppTheme.secondary,
            ),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
