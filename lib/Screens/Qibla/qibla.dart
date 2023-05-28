import 'package:flutter/cupertino.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' show pi;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islamic360/Utils/exports.dart';

class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController = StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("قیبلەنما"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
            if (snapshot.data!.enabled == true) {
              switch (snapshot.data!.status) {
                case LocationPermission.always:
                case LocationPermission.whileInUse:
                  return QiblahCompassWidget();

                case LocationPermission.denied:
                  return LocationErrorWidget(
                    error: "تکایە دڵنیابەوە کردنەوەیە لۆکەیشنت",
                    callback: _checkLocationStatus,
                  );
                case LocationPermission.deniedForever:
                  return LocationErrorWidget(
                    error: "تکایە دڵنیابەوە کردنەوەیە لۆکەیشنت",
                    callback: _checkLocationStatus,
                  );
                default:
                  return Container();
              }
            } else {
              return LocationErrorWidget(
                error: "تکایە دڵنیابەوە کردنەوەیە لۆکەیشنت",
                callback: _checkLocationStatus,
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled && locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatelessWidget {
  final _kaabaSvg = SvgPicture.asset('assets/images/4.svg');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CupertinoActivityIndicator();
        }

        final qiblahDirection = snapshot.data!;
        var angle = ((qiblahDirection.qiblah) * (pi / 195) * -1);

        return Container(
          margin: EdgeInsets.only(bottom: 60),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Transform.rotate(
                angle: angle,
                child: SvgPicture.asset('assets/images/5.svg', // compass
                    color: AppTheme.secondary),
              ),
              _kaabaSvg,
              SvgPicture.asset('assets/images/3.svg', //needle
                  color: AppTheme.secondary),
              Positioned(
                bottom: 40,
                child: Text(
                  "بۆ ئەوەی ئەنجامێکی تەواوت دەسکەوێت\nهەردوو سەری سەهمەکە بخەرە راستییەک\nسەرەتاش چەند جاڕێک ئمەرەکەت راوەشێنە.",
                  textAlign: TextAlign.center,
                  style: textTheme(context).subtitle1,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
