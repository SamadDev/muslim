
import 'package:islamic360/Utils/exports.dart';


class AyahWidget extends StatelessWidget {
  final Ayahs ayah;
  final Ayah tafsir;
  final index;

  AyahWidget({required this.ayah, required this.tafsir,required this.index});

  @override
  Widget build(BuildContext context) {

    final local_storage = Provider.of<LocalStorage>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {
                print(ayah.audio);
                // play_audio(url:ayah.audio, index: null);
              },
              child: Icon(Icons.play_arrow)),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: ayah.text,
              // text: ayah.text!,
              style: textTheme(context)
                  .bodyText1!
                  .copyWith(fontSize: local_storage.quran_font_size),
            ),
            WidgetSpan(
              // baseline: TextBaseline.alphabetic,
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ayah.svg',
                      width: 30,
                      height: 30,
                      color: AppTheme.secondary,
                    ),
                    Text(ayah.numberInSurah!,
                        style: textTheme(context).headline5!.copyWith(
                              color: AppTheme.black,
                            ))
                  ],
                ),
              ),
            )
          ])),
          SizedBox(
            height: 5,
          ),
          local_storage.is_kurdish_tafsir
              ? Text(
                  tafsir.text!,
                  style: textTheme(context).bodyText2!.copyWith(
                      fontSize: local_storage.kurdish_tafsir_font_size),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }


}
