import 'package:age_calculator/age_calculator.dart';

void main() {
  DateTime birthday = DateTime(1997, 3, 5);

  DateDuration duration;

  // Find out your age as of today's date 2021-03-08
  duration = AgeCalculator.age(birthday);
  print('Your age is $duration'); // Your age is Years: 24, Months: 0, Days: 3

  //Find out your age on any given date
  duration = AgeCalculator.age(birthday, today: DateTime(2030, 5, 1));
  print('Your age is $duration'); // Your age is Years: 33, Months: 1, Days: 26

  // Find out when your next birthday will be at 2021-03-08
  duration = AgeCalculator.timeToNextBirthday(birthday);
  print('You next birthday will be in $duration');
  // You next birthday will be in Years: 0, Months: 11, Days: 25

  // Find out when your next birthday will be on any given date
  duration = AgeCalculator.timeToNextBirthday(birthday,
      fromDate: DateTime(2021, 3, 2));
  print('You next birthday will be in $duration');
  // You next birthday will be in Years: 0, Months: 0, Days: 3

  // Find out the difference between two dates
  duration = AgeCalculator.dateDifference(
    fromDate: DateTime(2021, 1, 2),
    toDate: DateTime(2025, 5, 2),
  );
  print('The difference is $duration');
  // You next birthday will be in Years: 4, Months: 4, Days: 0

  // Add time to any date
  DateTime date;

  print('\nAdd Example:');
  date = AgeCalculator.add(
      date: DateTime(2021, 1, 2),
      duration: DateDuration(years: 5, months: 2, days: 1));
  print(date);
  // 2026-03-03 00:00:00.000

  date = AgeCalculator.add(
      date: DateTime(2023, 2, 28),
      duration: DateDuration(months: 6));
  print(date);
  // 2024-02-29 00:00:00.000

  // Subtract time to any date
  print('\nSubtract Example:');
  date = AgeCalculator.subtract(
      date: DateTime(2021, 1, 2),
      duration: DateDuration(years: 5, months: 2, days: 1));
  print(date);
  // 2015-11-01 00:00:00.000

  date = AgeCalculator.subtract(
      date: DateTime(2023, 8, 31),
      duration: DateDuration(months: 6));
  print(date);
  // 2023-02-28 00:00:00.000
}
