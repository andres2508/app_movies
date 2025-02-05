import 'package:app_movies/infrastructure/json/json_date.converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TMDB DateTimeJsonConverter', () {
    test('Convert a correct date from string', () {
      const converter = DateTimeConverter();
      const valueToConvert = '2024-12-19';
      final result = converter.fromJson(valueToConvert);

      expect(result, DateTime(2024, 12, 19));
    });

    test('Convert a null date from string', () {
      const converter = DateTimeConverter();
      const valueToConvert = '';
      final result = converter.fromJson(valueToConvert);

      expect(result, null);
    });
  });
}
