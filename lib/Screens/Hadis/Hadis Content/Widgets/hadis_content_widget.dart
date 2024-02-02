import 'package:islamic360/Utils/exports.dart';

class HadisContentWidget extends StatelessWidget {
  final Muslim hadis;

  HadisContentWidget({required this.hadis});

  @override
  Widget build(BuildContext context) {
    final parseHtmlString = Provider.of<HadisServer>(context, listen: false);
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5, right: 8, left: 8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Card(
              color: AppTheme.white.withOpacity(0.5),
              margin: EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              shadowColor: AppTheme.grey,
              elevation: 0,
              child: Container(
                width: Responsive.sH(context),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      hadis.door!,
                      style: textTheme(context).headline4!.copyWith(color: AppTheme.secondary),
                    ),
                    Divider(),
                    Text(
                      hadis.hadeth!,
                      style: GoogleFonts.notoSansArabic(   color: AppTheme.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
