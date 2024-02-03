import 'package:islamic360/Utils/exports.dart';

class PageViewCard extends StatelessWidget {
  final type;
  final image;
  final bool? isSelected;
  PageViewCard({this.type, this.isSelected, this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (type == "png") {
            Provider.of<LocalStorage>(context, listen: false).setQuranPageView(type);
          }
          Provider.of<LocalStorage>(context, listen: false).setQuranPageView(type);
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: isSelected! ? AppTheme.secondary : AppTheme.transparent)),
          child: Image.asset(
            'assets/images/$image',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
