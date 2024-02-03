import 'package:islamic360/Utils/exports.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    required this.width,
    required this.height,
    this.radius = 3,
    this.padding = 0,
  });

  final double width;
  final double height;
  final double radius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding, left: padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Shimmer.fromColors(
          baseColor: AppTheme.white,
          highlightColor: Colors.grey[300]!,
          child: Container(
            padding: EdgeInsets.only(right: padding, left: padding),
            width: width,
            height: height,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: AppTheme.white),
          ),
        ),
      ),
    );
  }
}

class ShimmerQuranScreen extends StatelessWidget {
  const ShimmerQuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12, left: 12),
      child: Column(
        children: [
          Card(
            elevation: 0,
            child: SizedBox(
              height: 160,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                color: AppTheme.quran_text_background ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerEffect(width: double.infinity, height: 20),
                    Divider(
                      endIndent: 200,
                      color: AppTheme.grey.withOpacity(0.15),
                    ),
                    ShimmerEffect(width: double.infinity, height: 24),
                    Divider(),
                  ],

                ),
              ),
            ),
          ),
          Card(
            elevation: 0,
            child: SizedBox(
              height: 160,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                color: AppTheme.quran_text_background ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerEffect(width: double.infinity, height: 20),
                    Divider(
                      endIndent: 200,
                      color: AppTheme.grey.withOpacity(0.15),
                    ),
                    ShimmerEffect(width: double.infinity, height: 24),
                    Divider(),
                  ],

                ),
              ),
            ),
          ),
          Card(
            elevation: 0,
            child: SizedBox(
              height: 160,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                color: AppTheme.quran_text_background ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerEffect(width: double.infinity, height: 20),
                    Divider(
                      endIndent: 200,
                      color: AppTheme.grey.withOpacity(0.15),
                    ),
                    ShimmerEffect(width: double.infinity, height: 24),
                    Divider(),
                  ],

                ),
              ),
            ),
          ),
          Card(
            elevation: 0,
            child: SizedBox(
              height: 160,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                color: AppTheme.quran_text_background ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerEffect(width: double.infinity, height: 20),
                    Divider(
                      endIndent: 200,
                      color: AppTheme.grey.withOpacity(0.15),
                    ),
                    ShimmerEffect(width: double.infinity, height: 24),
                    Divider(),
                  ],

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

