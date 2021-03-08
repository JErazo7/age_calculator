import 'package:age_calculator/age_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var birthdate;
  var today;

  setUp(() {
    birthdate = DateTime(1997, 3, 5);
    today = DateTime(2021, 3, 8);
  });

  group('Find out', () {
    test('your age', () {
      expect(AgeCalculator.age(birthdate, today: today).toString(),
          DateDuration(years: 24, months: 0, days: 3).toString());
    });
    test('your next birthday', () {
      expect(
          AgeCalculator.timeToNextBirthday(birthdate, fromDate: today)
              .toString(),
          DateDuration(years: 0, months: 11, days: 25).toString());
    });

    test('difference between two dates', () {
      expect(
          AgeCalculator.dateDifference(toDate: today, fromDate: birthdate)
              .toString(),
          DateDuration(years: 24, months: 0, days: 3).toString());
    });
  });

  group('Add', () {
    test('days', () {
      expect(
          AgeCalculator.add(
              date: DateTime(2021, 3, 5), duration: DateDuration(days: 36)),
          DateTime(2021, 4, 10));
    });
    test('months', () {
      expect(
          AgeCalculator.add(
              date: DateTime(2021, 3, 5), duration: DateDuration(months: 20)),
          DateTime(2022, 11, 5));
    });

    test('years', () {
      expect(
          AgeCalculator.add(
              date: DateTime(2021, 3, 5), duration: DateDuration(years: 10)),
          DateTime(2031, 3, 5));
    });

    test('days, months and years', () {
      expect(
          AgeCalculator.add(
              date: DateTime(2021, 3, 5),
              duration: DateDuration(
                years: 10,
                months: 3,
                days: 5,
              )),
          DateTime(2031, 6, 10));
    });
  });
}
