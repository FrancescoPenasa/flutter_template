/// how to
/// flutter driver \ --driver=test_driver/integration_test_driver.dart \ --target=integration_test/development_integrationTest.dart
/// flutter test integration_test/development_integrationTest.dart -d emulator-5554
// ignore_for_file: file_names

import 'package:starting_template/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DEV::Integration Test::Successful ', () {
    testWidgets("Traditional Login/Logout", (tester) async {
      app.main();

      await tester.pumpAndSettle(
        const Duration(seconds: 1),
      );

      Container c = Container(child: Text("Test"),);

      expect(c, findsOneWidget);
    });
  });
}
