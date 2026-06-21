import 'package:flutter_test/flutter_test.dart';

import 'package:dinolog_app/model/converters/date_converter.dart';

void main() {
  group('Format RFC3339 DateTime', () {
    test('should format local DateTime to RFC3339 string', () {
      final dateTime = DateTime(2026, 6, 21, 13, 30, 45, 123);
      final formatted = formatRfc3339DateTime(dateTime);
      expect(formatted, '2026-06-21T11:30:45.123Z');
    });

    test('should format Utc DateTime to RFC3339 string', () {
      final dateTime = DateTime.utc(2026, 6, 21, 13, 30, 45, 123);
      final formatted = formatRfc3339DateTime(dateTime);
      expect(formatted, '2026-06-21T13:30:45.123Z');
    });
  });
}
