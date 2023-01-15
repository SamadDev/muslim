import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:islamic360/Utils/exports.dart';

class ButtonNavigationScreen extends StatefulWidget {
  const ButtonNavigationScreen({Key? key}) : super(key: key);

  @override
  State<ButtonNavigationScreen> createState() => _ButtonNavigationScreenState();
}

class _ButtonNavigationScreenState extends State<ButtonNavigationScreen> {
  int currentIndex = 0;
  var snakShape = SnakeShape.circle;
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  SnakeShape snakeShape = SnakeShape.circle;
  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);
  List screens = [
    HomePage(),
    SurahScreen(),
    QiblahCompass(),
    TasbiScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: SnakeNavigationBar.color(
        unselectedLabelStyle: textTheme(context).headline5,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: snakShape,
        shape: bottomBarShape,
        padding: const EdgeInsets.all(12),
        snakeViewColor: AppTheme.secondary,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? AppTheme.secondary : null,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        showSelectedLabels: false,
        selectedLabelStyle: textTheme(context).headline5,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            print(index);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.book)),
          BottomNavigationBarItem(icon: Icon(Icons.compare_arrows_sharp)),
          BottomNavigationBarItem(icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
