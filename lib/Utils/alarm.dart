import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

int alarmId = 1;

// ignore: unused_element
void _examples() {

  // runs alarm timer at exact time
  AndroidAlarmManager.oneShotAt(
    // date time format (year,month,date,hour,minutes,seconds)
    DateTime(2021, 02, 18, 14, 10),
    alarmId,
    fireAlarm,
  );
}

void fireAlarm() {
  print('Alarm Fired at${DateTime.now()}');
}