import 'package:flutter_test/flutter_test.dart';
import 'package:timetable_app/shared/utils/week_of_year_ext.dart';

void main() {
  group('DateUtils.weekOfYear tests', () {
    
    test('Чётная неделя', () {
      expect(DateTime(2026, 2, 8).weekOfYear % 2, equals(0));
    });

    test('Чётная неделя', () {
      expect(DateTime(2026, 2, 9).weekOfYear % 2, equals(1));
    });

  });
}

