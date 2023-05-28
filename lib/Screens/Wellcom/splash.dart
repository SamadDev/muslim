import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Provider.of<LocalStorage>(context,listen:false).fetch_local();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondary,
      body: SplashWidget(),
    );
  }
}

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            child: Image.asset(
              'assets/images/quran_icon.png',
              height: 30.h,
              width: 30.w,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0,horizontal: 30),
            child: Image.asset('assets/images/bsmila.png',color: AppTheme.white,fit: BoxFit.contain,),
          )
        ],
      ),
    );
  }
}
