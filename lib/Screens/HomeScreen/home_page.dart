import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic360/Screens/Hijri/hijri_calendart.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: false,
            pinned: false,
            floating: false,
            leading: SizedBox(),
            expandedHeight: size.height * 0.45,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              height: size.height * 0.45,
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(color: AppTheme.primary,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/header2.png'),
                    fit: BoxFit.cover,
                  )),
            )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(right: 8, left: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CartIcon(
                      text: 'قورئان',
                      icon: '99.svg',
                      route: SurahScreen(),
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'کاتی بانگ', icon: '77.svg', route: '')),
                        Expanded(child: CartIcon(text: 'دوعا', icon: '88.svg', route: DuaScreen())),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'وێردەکان', icon: '44.svg', route: AzkarTitleScreen())),
                        Expanded(child: CartIcon(text: 'رۆژمێری هیجری', icon: '55.svg', route: HijriDatePicker())),
                        // Expanded(child: CartIcon(text: 'مزگەوتەکان', icon: '66.svg', route: ''))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'مزگەوتەکان', icon: '66.svg', route: '')),
                        Expanded(child: CartIcon(text: 'قیبلە', icon: '33.svg', route: QiblahCompass()))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'تەسبیح', icon: '11.svg', route: TasbiScreen())),
                        Expanded(child: CartIcon(text: 'پرسیار و وڵام', icon: '22.svg', route: '')),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'کاتی بانگ', icon: '77.svg', route: '')),
                        Expanded(child: CartIcon(text: 'کتێبخانە', icon: '11.svg', route: TasbiScreen())),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'دەربارە', icon: '22.svg', route: '')),
                        Expanded(child: CartIcon(text: 'زەکات', icon: '33.svg', route: QiblahCompass()))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'مزگەوتەکان', icon: '66.svg', route: '')),
                        Expanded(child: CartIcon(text: 'قیبلە', icon: '33.svg', route: QiblahCompass()))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

class CartIcon extends StatelessWidget {
  final icon;
  final text;
  final route;
  final width;

  CartIcon({required this.text, required this.icon, required this.route, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          navigatorRouteAnimation(context: context, page: route);
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            margin: EdgeInsets.all(8),
            height: 85,
            decoration: BoxDecoration(color: AppTheme.cart, borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 8, left: 8, bottom: 5, top: 10),
                  decoration:
                      BoxDecoration(color: AppTheme.secondary.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                  child: SvgPicture.asset(
                    "assets/icons/$icon",
                    width: 4.w,
                    height: 4.h,
                    color: AppTheme.secondary,
                  ),
                ),
                Text(
                  text,maxLines: 2,
                  style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 13.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
