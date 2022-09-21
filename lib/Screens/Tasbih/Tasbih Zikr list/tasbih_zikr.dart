import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class TasbihZikrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TasbihSever>(context, listen: false);
    return AnimationLimiter(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: data.tasbih.length,
          itemBuilder: (ctx, i) => AnimationConfiguration.staggeredList(
            position: i,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 70.0,
              child: FadeInAnimation(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 0, left: 0, top: 5, bottom: 5),
                  child: TasbihZikrListWidget(
                    tasbih: data.tasbih[i],
                    index:i
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
