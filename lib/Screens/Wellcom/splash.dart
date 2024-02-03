import 'dart:async';
import 'package:islamic360/Utils/exports.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Provider.of<LocalStorage>(context, listen: false).fetch_local();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondary,
      body: Image.asset("assets/images/Splash.png", fit: BoxFit.fill,width: double.infinity,height: double.infinity),
    );
  }
}

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/Splash.png", fit: BoxFit.fill);
    // return Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Container(
    //         height: 40.h,
    //         width: 40.w,
    //         child: Image.asset(
    //           'assets/images/quran_icon.png',
    //           height: 30.h,
    //           width: 30.w,
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       Text("Islamic 360",style: textTheme(context).headline1!.copyWith(color: AppTheme.white))
    //       // Padding(
    //       //   padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50),
    //       //   child: Image.asset('assets/images/quran_icon.png'),
    //       // )
    //     ],
    //   ),
    // );
  }
}
