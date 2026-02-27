import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dice_roller/main.dart';
import 'package:dice_roller/src/models/dice_model.dart';

class FakeModel extends DiceModel {
  FakeModel() : super(cache: null);

  bool rolled = false;
  @override
  Future<void> roll() async {
    rolled = true;
    notifyListeners();
  }
}

void main() {
  testWidgets('DicePage uses injected model', (tester) async {
    final fake = FakeModel();
    await tester.pumpWidget(
      MaterialApp(home: DicePage(model: fake)),
    );

    // default values should appear
    expect(find.text('1'), findsNWidgets(2));

    // tap roll button
    final button = find.text('Roll');
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(fake.rolled, isTrue);
  });
}
