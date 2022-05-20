import 'package:flutter_test/flutter_test.dart';
import 'package:starting_template/src/services/locator.dart';

void main() {
  setUpServices();

  group('test::examples', () {
    test('::the_first', () async {
      String u = "notNull";
      expect(u, isNotNull);
    });
  });
}
