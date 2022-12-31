import 'package:flutter/material.dart';
import 'package:islamic360/Theme/style.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HijriDatePicker extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('رۆژمێری هیجری'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/hijri.jpg',
            fit: BoxFit.cover,
          ),
          Expanded(
            child: SfHijriDateRangePicker(
              view: HijriDatePickerView.month,
              selectionMode: DateRangePickerSelectionMode.multiple,
              selectionShape: DateRangePickerSelectionShape.rectangle,
              showNavigationArrow: true,
              selectionColor: AppTheme.primary,
              backgroundColor: AppTheme.text,
              endRangeSelectionColor: AppTheme.primary,
              rangeSelectionColor: AppTheme.primary,
              startRangeSelectionColor: AppTheme.primary,
              todayHighlightColor: AppTheme.text,
              monthViewSettings: HijriDatePickerMonthViewSettings(
                  dayFormat: 'EEE',
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      backgroundColor: AppTheme.text)),
              headerStyle:
                  DateRangePickerHeaderStyle(backgroundColor: AppTheme.text),
            ),
          ),
        ],
      ),
    );
  }
}
