import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class SurahScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final data = Provider.of<QuranServes>(context, listen: false);
    final saved = Provider.of<Saved>(context, listen: false);
    final localStorage= Provider.of<LocalStorage>(context, listen: false);
    Future<void> getData() async {
      await data.getQuran();
      await saved.getSaved();
      await localStorage.fetch_local();
    }

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(55), child: CustomAppBarWidget()),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    snap: false,
                    pinned: false,
                    floating: false,
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

