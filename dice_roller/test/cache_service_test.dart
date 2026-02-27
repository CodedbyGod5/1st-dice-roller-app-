import 'package:flutter_test/flutter_test.dart';
import 'package:dice_roller/src/services/cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('CacheService saves and loads state', () async {
    SharedPreferences.setMockInitialValues({});
    final cache = CacheService();

    await cache.saveState(left: 3, right: 5, rotation: 6.28);

    final loaded = await cache.loadState();
    expect(loaded, isNotNull);
    expect(loaded!['left'], 3);
    expect(loaded['right'], 5);
    expect((loaded['rotation'] as double).toStringAsFixed(2), '6.28');

    await cache.clear();
    final afterClear = await cache.loadState();
    expect(afterClear, isNull);
  });
}
