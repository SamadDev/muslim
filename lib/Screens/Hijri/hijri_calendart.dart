import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';

class HijriDatePicker extends StatelessWidget {
  Widget build(BuildContext context) {
    // var _today = HijriCalendar.now();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('رۆژمێری هیجری'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: size.height * 0.25,
            decoration: BoxDecoration(
                color: AppTheme.secondary,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('assets/images/hijri1.png'),
                    fit: BoxFit.cover,
                    opacity: 0.2)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('a').format(DateTime.now()) == "AM"
                                ? "بەیانیان"
                                : 'ئێواران',
                            style: textTheme(context).headline5!.copyWith(
                                color: AppTheme.white, fontFamily: 'nrt'),
                          ),
                          Text(
                            DateFormat('hh:mm:ss').format(DateTime.now()),
                            style: textTheme(context).headline1!.copyWith(
                                fontSize: 45,
                                height: 1.2,
                                color: AppTheme.white),
                          ),
                        ],
                      );
                    },
                  ),
                  Text(HijriCalendar.now().toString(),
                      style: textTheme(context)
                          .headline2!
                          .copyWith(color: AppTheme.white, height: 2))
                ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (ctx, i) {
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppTheme.secondary),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppTheme.white, borderRadius: BorderRadius.circular(15)),
            child: SfHijriDateRangePicker(
              view: HijriDatePickerView.month,
              selectionMode: DateRangePickerSelectionMode.multiple,
              selectionShape: DateRangePickerSelectionShape.circle,
              showNavigationArrow: true,
              selectionColor: AppTheme.orange,
              backgroundColor: AppTheme.white,
              endRangeSelectionColor: AppTheme.primary,
              rangeSelectionColor: AppTheme.orange,
              startRangeSelectionColor: AppTheme.primary,
              todayHighlightColor: AppTheme.orange,
              monthViewSettings: HijriDatePickerMonthViewSettings(
                  dayFormat: 'EEE',
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      backgroundColor: AppTheme.white)),
              headerStyle: DateRangePickerHeaderStyle(
                  textStyle: TextStyle(color: AppTheme.secondary),
                  backgroundColor: AppTheme.white),
            ),
          ),
        ],
      ),
    );
  }
}
