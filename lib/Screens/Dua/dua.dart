import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:provider/provider.dart';

class DuaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final get = Provider.of<DuaServse>(context, listen: false);
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('نزاو پاڕانەوە'),
      ),
      body: FutureBuilder(
        future: get.getDua(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        snap: false,
                        pinned: false,
                        floating: false,
                        leading: SizedBox(),
                        expandedHeight: 220,
                        flexibleSpace: FlexibleSpaceBar(background: CustomDuaAppBar()),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) => DuaWidget(
                            dua: get.dua[i],
                          ),
                          childCount: get.dua.length
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
