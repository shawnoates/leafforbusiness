import 'package:flutter/material.dart';
import 'package:leaf_for_business/configs/configs.dart';

class Utils {
  /// We need to find number of weekdays and weekends in the date range user has selected
  /// for the promotion and then generate the stripe sheet accordingly
  /// $5 per weekday (Mon, Tue, Wed, Thu)
  /// $10 per weekend day (Fri, Sat, Sun)
  static List<int> weekDaysAndWeekendCount(DateTimeRange range) {
    int weekdaysCount = 0;
    int weekendsCount = 0;

    for (DateTime date = range.start;
        date.isBefore(range.end);
        date = date.add(1.days)) {
      if (date.weekday >= DateTime.monday &&
          date.weekday <= DateTime.thursday) {
        weekdaysCount++;
      } else {
        weekendsCount++;
      }
    }

    /// Returns with weekdays on first index & weekends count on last index
    return [weekdaysCount, weekendsCount];
  }

  static bool isWeekDay(DateTime date) {
    final weekDays = [
      DateTime.monday,
      DateTime.tuesday,
      DateTime.wednesday,
      DateTime.thursday,
      DateTime.friday,
    ];

    return weekDays.contains(date.weekday);
  }
}
