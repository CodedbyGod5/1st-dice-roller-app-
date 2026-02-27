import 'package:flutter_test/flutter_test.dart';
import 'package:dice_roller/src/models/dice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('DiceModel roll updates values and persists state', () async {
    SharedPreferences.setMockInitialValues({});

    final model = DiceModel();

    final oldLeft = model.left;
    final oldRight = model.right;

    await model.roll();

    expect(model.left, inInclusiveRange(1, 6));
    expect(model.right, inInclusiveRange(1, 6));
    expect(model.left == oldLeft && model.right == oldRight, isFalse);

    // Verify persisted values
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getInt('dice_left'), model.left);
    expect(prefs.getInt('dice_right'), model.right);
    expect(prefs.getDouble('dice_rotation'), model.rotation);
  });
}
