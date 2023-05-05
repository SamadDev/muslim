import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';

class PageViewWidget extends StatefulWidget {
  final list;
  PageViewWidget({this.list});
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final PageController _pageViewController = PageController(initialPage: 0);
  int _activePage = 0;
  List pages = [];
  @override
  void initState() {
    pages = widget.list;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
            margin: EdgeInsets.only(
              top: size.height * 0.36,
              right: 20,
              left: 20,
            ),
            decoration: BoxDecoration(
                color: AppTheme.white, borderRadius: BorderRadius.circular(35)),
            child: PageView.builder(
                controller: _pageViewController,
                onPageChanged: (int index) {
                  setState(() {
                    _activePage = index;
                  });
                },
                itemCount: pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return pages[index];
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
              pages.length,
                  (index) => Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 5,right: 8.0, left: 8),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: _activePage == index
                      ? AppTheme.black
                      : AppTheme.grey,
                ),
              )),
        )
      ],
    );
  }
}
