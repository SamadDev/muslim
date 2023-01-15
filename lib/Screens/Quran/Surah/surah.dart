import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class SurahScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final data = Provider.of<QuranServes>(context, listen: false);
    final saved = Provider.of<Saved>(context, listen: false);
    Future<void> getData() async {
      await data.getQuran();
      await saved.getSaved();
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(55), child: CustomAppBarWidget()),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        snap: false,
                        pinned: false,
                        floating: true,
                        leading: SizedBox(),
                        expandedHeight: 170,
                        flexibleSpace: FlexibleSpaceBar(background: LastRead()),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (context, i) => QuranListWidget(
                                  surah: data.quran_list[i],
                                ),
                            childCount: data.quran_list.length),
                      ),
                    ],
                  ),
      ),
    );
  }
}




// FutureBuilder(
//         future: data.getQuran(),
        // builder: (context, snapshot) {
        //   switch (snapshot.connectionState) {
        //     case ConnectionState.waiting:
        //       return Center(child: CircularProgressIndicator());
        //     default:
        //       if (snapshot.hasError)
        //         return Text('هەلە: تاکیە بەرنامەکە داخەو بیکەرەوە');
        //       else
        //         return SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       LastRead(),
//                       Expanded(
//                         child: Consumer<QuranServes>(
//                             builder: (ctx, surah, _) => ListView.separated(
//                                 shrinkWrap: true,
//                                 primary: true,
//                                 physics: BouncingScrollPhysics(
//                                     parent: AlwaysScrollableScrollPhysics()),
//                                 padding: EdgeInsets.only(top: 5, bottom: 5),
//                                 separatorBuilder: (ctx, c) => Divider(
//                                       color: AppTheme.white.withOpacity(0.2),
//                                     ),
//                                 itemCount: surah.quran_list.length,
//                                 itemBuilder: (ctx, i) => QuranListWidget(
//                                       surah: surah.quran_list[i],
//                                     ))),
//                       ),
//                     ],
//                   ),
//                 );
//           }
//         },
//       ),