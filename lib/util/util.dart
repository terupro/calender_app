import 'package:flutter/material.dart';
import 'package:nholiday_jp/nholiday_jp.dart';
import 'package:table_calendar/table_calendar.dart';

textColor(DateTime day) {
  const _defaultTextColor = Colors.black87;
  final holidays = NHolidayJp.getByYear(day.year);
  if (holidays
      .map((e) => DateTime(day.year, e.month, e.date))
      .toList()
      .where((element) => isSameDay(element, day))
      .isNotEmpty) {
    return Colors.red;
  }
  if (day.weekday == DateTime.sunday) {
    return Colors.red;
  }
  if (day.weekday == DateTime.saturday) {
    return Colors.blue[600]!;
  }
  return _defaultTextColor;
}

final dayTime = DateTime.now();
final baseBackGroundColor = Colors.grey[200];
