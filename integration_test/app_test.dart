import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// The application under test.
import 'package:flutterIntTest/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button; verify counter', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      final incTestKey = Key("increment");
      final decTestKey = Key('decrement');
      final secondScreenKey =  Key("SecondScreen");
      final showKey = Key("show");

      // Finds the floating action button to tap on.
      // Finder fSecondScreen;
      final Finder finc = find.byKey(incTestKey);
      final Finder fdec =find.byKey(decTestKey);
      final Finder fSecondScreen =find.byKey(secondScreenKey);
      final Finder fshow=find.byKey(showKey);

      // Emulate a tap on the floating action button.
      await tester.tap(finc);
      await tester.tap(fdec);
      await tester.tap(fSecondScreen);
      
      await Future.delayed(const Duration(seconds: 3), (){});
      await tester.tap(fshow);
       await Future.delayed(const Duration(seconds: 3), (){});
      print('Button incremente');

      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
    });
  });
}