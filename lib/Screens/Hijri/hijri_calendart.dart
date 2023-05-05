import 'package:flutter/material.dart';
import 'package:islamic360/Utils/exports.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:hijri/hijri_calendar.dart';


class HijriDatePicker extends StatefulWidget {
  @override
  State<HijriDatePicker> createState() => _HijriDatePickerState();
}

class _HijriDatePickerState extends State<HijriDatePicker> {
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final translate = Provider.of<Translate>(context, listen: false);
    // var selectedDate = new HijriCalendar.now();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Text('رۆژمێری هیجری'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              height: size.height * 0.25,
              decoration: BoxDecoration(
                  // color: AppTheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/hijri1.png'),
                    fit: BoxFit.cover,
                    // opacity: 0.2
                  )),
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
                              style: textTheme(context)
                                  .headline5!
                                  .copyWith(color: AppTheme.white, fontFamily: 'nrt'),
                            ),
                            Text(
                              DateFormat('hh:mm:ss').format(DateTime.now()),
                              style: textTheme(context)
                                  .headline1!
                                  .copyWith(fontSize: 45, height: 1.2, color: AppTheme.white),
                            ),
                          ],
                        );
                      },
                    ),
                    //todo
                    Text('',
                        style: textTheme(context)
                            .headline2!
                            .copyWith(color: AppTheme.white, height: 2))
                  ]),
            ),
            // HijriMonthPicker(
            //   lastDate: HijriCalendar()
            //     ..hYear = 1445
            //     ..hMonth = 9
            //     ..hDay = 25,
            //   firstDate: HijriCalendar()
            //     ..hYear = 1438
            //     ..hMonth = 12
            //     ..hDay = 25,
            //   onChanged: (HijriCalendar value) {
            //     // setState(() {
            //     //   selectedDate = selectedDate;
            //     // });
            //   }, selectedDate: HijriCalendar.now(),
            //   // selectedDate: ,
            // ),
            //
            // Container(height: 200,child: MyHomePage()),

            Container(
              margin: EdgeInsets.only(top: 20, bottom: 15),
              height: 55,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (ctx, i) {
                  return Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.only(right: 12, left: 3),
                      width: 55,
                      decoration: BoxDecoration(
                          border: translate.weekdays[DateTime.now().weekday % 7] ==
                                  translate.weekdays[i]
                              ? Border.all(color: AppTheme.orange, width: 1)
                              : Border.all(color: AppTheme.white),
                          borderRadius: BorderRadius.circular(50),
                          color: AppTheme.secondary),
                      child: Center(
                        child: Text(
                          translate.weekdays[i],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme(context).headline6!.copyWith(color: AppTheme.white),
                        ),
                      ));
                },
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(15)),
              child: SfHijriDateRangePicker(
                monthFormat: ("MMM"),
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
                headerStyle: DateRangePickerHeaderStyle(
                    textStyle: TextStyle(color: AppTheme.secondary),
                    backgroundColor: AppTheme.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Future<Null> _selectDate(BuildContext context) async {
//     final HijriCalendar? picked = await showHijriDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       lastDate: new HijriCalendar()
//         ..hYear = 1445
//         ..hMonth = 9
//         ..hDay = 25,
//       firstDate: new HijriCalendar()
//         ..hYear = 1438
//         ..hMonth = 12
//         ..hDay = 25,
//       initialDatePickerMode: DatePickerMode.day,
//     );
//     if (picked != null)
//       setState(() {
//         selectedDate = picked;
//       });
//   }}
//
//
//

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedDate = new HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              HijriMonthPicker(
                lastDate: HijriCalendar()
                  ..hYear = 1445
                  ..hMonth = 9
                  ..hDay = 25,
                firstDate: HijriCalendar()
                  ..hYear = 1438
                  ..hMonth = 12
                  ..hDay = 25,
                onChanged: (HijriCalendar value) {
                  setState(() {
                    selectedDate = selectedDate;
                  });
                },
                selectedDate: selectedDate,
              ),

              new Text(
                '${selectedDate.toString()}',
                style: Theme.of(context).textTheme.headline5,
              ),
              new Text(
                '${selectedDate.fullDate()}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      );
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _selectDate(context),
        tooltip: 'Pick Date',
        child: new Icon(Icons.event),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final HijriCalendar? picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,
      lastDate: new HijriCalendar()
        ..hYear = 1445
        ..hMonth = 9
        ..hDay = 25,
      firstDate: new HijriCalendar()
        ..hYear = 1438
        ..hMonth = 12
        ..hDay = 25,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
      });
  }
}