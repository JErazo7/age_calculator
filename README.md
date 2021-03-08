# age_calculator

A Flutter package that allows you to perform operations between dates:
- Calculate a person's age and the time remaining to their next birthday in years, months and days. 
- Calculate differences between two dates in years, months and days.
- Add years, months and days to any date.

## Getting Started

In your flutter project add the dependency:

dependencies:
  ...
  age_calculator: ^1.0.0

For help getting started with Flutter, view the online documentation.

### Example

```dart
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
  DateTime date = AgeCalculator.add(
      date: DateTime(2021, 1, 2),
      duration: DateDuration(years: 5, months: 2, days: 1));
  print(date);
  // 2026-03-03 00:00:00.000
}
```
