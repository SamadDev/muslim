import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class HijriDatePicker extends StatelessWidget {
  Widget build(BuildContext context) {
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
                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat('a').format(DateTime.now()),
                              style: textTheme(context).headline1!.copyWith(
                                  fontSize: 30, color: AppTheme.white),
                            ),
                            Text(
                              DateFormat('hh:mm:ss').format(DateTime.now()),
                              style: textTheme(context).headline1!.copyWith(
                                  fontSize: 50, color: AppTheme.white),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ]),
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (ctx, i) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 30,
                  width: 30,
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
              // view: HijriDatePickerView.month,
              selectionMode: DateRangePickerSelectionMode.multiple,
              selectionShape: DateRangePickerSelectionShape.circle,
              showNavigationArrow: true,
              selectionColor: AppTheme.orange,
              backgroundColor: AppTheme.white,
              endRangeSelectionColor: AppTheme.primary,
              rangeSelectionColor: AppTheme.orange,
              startRangeSelectionColor: AppTheme.primary,
              todayHighlightColor: AppTheme.orange,

              // monthViewSettings: HijriDatePickerMonthViewSettings(
              //     dayFormat: 'EEE',
              //     viewHeaderStyle: DateRangePickerViewHeaderStyle(
              //         backgroundColor: AppTheme.text)),
              //   headerStyle:
              //       DateRangePickerHeaderStyle(backgroundColor: AppTheme.text),
            ),
          ),
        ],
      ),
    );
  }
}
