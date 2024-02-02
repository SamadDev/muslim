import 'package:islamic360/Utils/exports.dart';
import 'package:islamic360/Widgets/comming_soon_Screen.dart';

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
            backgroundColor: AppTheme.primary,
            snap: false,
            pinned: false,
            floating: false,
            leading: SizedBox(),
            expandedHeight: size.height * 0.40,
            flexibleSpace: SizedBox(
              height: size.height * 0.46,
              child: Image.asset(
                'assets/images/header2.png',
                fit: BoxFit.cover,
              ),
            ),
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
                        Expanded(child: CartIcon(text: 'کاتی بانگ', icon: '77.svg', route: ComingSoonScreen())),
                        Expanded(child: CartIcon(text: 'وێردەکان', icon: '44.svg', route: AzkarTitleScreen())),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'پاڕانەوە', icon: '88.svg', route: DuaScreen())),
                        Expanded(child: CartIcon(text: 'رۆژمێری هیجری', icon: '55.svg', route: HijriDatePicker())),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'تەسبیح', icon: '11.svg', route: TasbiScreen())),
                        Expanded(child: CartIcon(text: 'قیبلە', icon: '33.svg', route: QiblahCompass()))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'فەرمودە', icon: '11.svg', route: HadisTitleScreen())),
                        Expanded(
                          child: CartIcon(text: 'پرسیار و وڵام', icon: 'question.svg', route: QuestionTitleScreen()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'نزیکترین مزگەوت', icon: '66.svg', route: ComingSoonScreen())),
                        Expanded(child: CartIcon(text: 'کتێبخانە', icon: 'book.svg', route: ComingSoonScreen()))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: CartIcon(text: 'دەربارە', icon: '22.svg', route: ComingSoonScreen())),
                        // Expanded(child: CartIcon(text: 'زەکات', icon: '33.svg', route: QiblahCompass())),
                        Expanded(child: CartIcon(text: 'کاتی بانگ', icon: '77.svg', route: ComingSoonScreen())),
                      ],
                    ),
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
                  width: 45,
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
                  text,
                  maxLines: 2,
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
