library age_calculator;

import 'dart:math';

class DateDuration {
  int days;
  int months;
  int years;

  DateDuration({this.days = 0, this.months = 0, this.years = 0});

  String toString() {
    return 'Years: $years, Months: $months, Days: $days';
  }
}

/// Age Class
class AgeCalculator {
  /// _daysInMonth cost contains days per months; daysInMonth method to be used instead.
  static const List<int> _daysInMonth = [
    31, // Jan
    28, // Feb, it varies from 28 to 29
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31 // Dec
  ];

  /// isLeapYear method
  static bool isLeapYear(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  /// daysInMonth method
  static int daysInMonth(int year, int month) =>
      (month == DateTime.february && isLeapYear(year))
          ? 29
          : _daysInMonth[month - 1];

  /// dateDifference method
  static DateDuration dateDifference({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    // Check if toDate to be included in the calculation
    DateTime endDate = toDate;

    int years = endDate.year - fromDate.year;
    int months = 0;
    int days = 0;

    if (fromDate.month > endDate.month) {
      years--;
      months = (DateTime.monthsPerYear + endDate.month - fromDate.month);

      if (fromDate.day > endDate.day) {
        months--;
        days = daysInMonth(fromDate.year + years,
                ((fromDate.month + months - 1) % DateTime.monthsPerYear) + 1) +
            endDate.day -
            fromDate.day;
      } else {
        days = endDate.day - fromDate.day;
      }
    } else if (endDate.month == fromDate.month) {
      if (fromDate.day > endDate.day) {
        years--;
        months = DateTime.monthsPerYear - 1;
        days = daysInMonth(fromDate.year + years,
                ((fromDate.month + months - 1) % DateTime.monthsPerYear) + 1) +
            endDate.day -
            fromDate.day;
      } else {
        days = endDate.day - fromDate.day;
      }
    } else {
      months = (endDate.month - fromDate.month);

      if (fromDate.day > endDate.day) {
        months--;
        days = daysInMonth(fromDate.year + years, (fromDate.month + months)) +
            endDate.day -
            fromDate.day;
      } else {
        days = endDate.day - fromDate.day;
      }
    }

    return DateDuration(days: days, months: months, years: years);
  }

  /// add method
  static DateTime add(
      {required DateTime date, required DateDuration duration}) {
    var newDateTime = date.add(Duration(days: duration.days));
    newDateTime = _addMonths(newDateTime, duration.months);
    newDateTime = _addMonths(newDateTime, duration.years * 12);
    return newDateTime;
  }

  /// subtract methods
  static DateTime subtract(
      {required DateTime date, required DateDuration duration}) {
    var newDateTime = date.subtract(Duration(days: duration.days));
    newDateTime = _addMonths(newDateTime, -duration.months);
    newDateTime = _addMonths(newDateTime, -duration.years * 12);
    return newDateTime;
  }

  static DateDuration age(DateTime birthdate, {DateTime? today}) {
    return dateDifference(fromDate: birthdate, toDate: today ?? DateTime.now());
  }

  static DateDuration timeToNextBirthday(DateTime birthdate,
      {DateTime? fromDate}) {
    DateTime endDate = fromDate ?? DateTime.now();
    DateTime tempDate = DateTime(endDate.year, birthdate.month, birthdate.day);
    DateTime nextBirthdayDate = tempDate.isBefore(endDate)
        ? AgeCalculator.add(date: tempDate, duration: DateDuration(years: 1))
        : tempDate;
    return dateDifference(fromDate: endDate, toDate: nextBirthdayDate);
  }

  static DateTime _addMonths(DateTime dateTime, int months) {
    final modMonths = months % 12;
    var newYear = dateTime.year + ((months - modMonths) ~/ 12);
    var newMonth = dateTime.month + modMonths;
    if (newMonth > 12) {
      newYear++;
      newMonth -= 12;
    }
    final newDay = min(dateTime.day, daysInMonth(newYear, newMonth));
    return DateTime(newYear, newMonth, newDay);
  }
}
