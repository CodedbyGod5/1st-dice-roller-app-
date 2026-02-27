import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dice_roller/src/widgets/die.dart';

void main() {
  testWidgets('Die displays value and responds to tap', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Die(value: 4, onTap: () => tapped = true),
        ),
      ),
    );

    expect(find.text('4'), findsOneWidget);

    await tester.tap(find.byType(Die));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });
}
