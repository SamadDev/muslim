import 'package:flutter/material.dart';
import 'package:islamic360/Theme/style.dart';
import 'package:lottie/lottie.dart';

class ComingSoonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 60, left: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/icons/coming.json',
                width: 200,
                height: 200,
              ),
              SizedBox(
                height: 15,
              ),
              Text("بەمنزیکانە", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4),
              SizedBox(
                height: 5,
              ),
              Text("ببورە ئەم بەشە لەمکاتەدا بەردەستنیە\nبە زوترین کات هەوڵی بەردەستبونی دەدەین",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: AppTheme.black.withOpacity(0.5))),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.1,
                      minimumSize: Size(200, 40),
                      backgroundColor: AppTheme.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    // Navigator.of(context).pop();
                  },
                  child: Text(
                    "ئپدێتی نوێ",
                    style: textTheme(context).headline5,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ComingSoonDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/wifi.png',
              color: AppTheme.primary,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 15),
            Text(
              "Something went wrong",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 5),
            Text(
              "Make sure wifi or cellular is turned on and\nthen try again",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(color: AppTheme.black.withOpacity(0.5)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(120, 40),
                backgroundColor: AppTheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                // Perform the retry action here
              },
              child: Text(
                "Try again",
                style: textTheme(context).subtitle2!.copyWith(color: AppTheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
