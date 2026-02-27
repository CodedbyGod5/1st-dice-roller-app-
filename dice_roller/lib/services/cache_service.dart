import 'package:shared_preferences/shared_preferences.dart';

/// Simple cache wrapper around SharedPreferences for the dice state.
class CacheService {
  static const _keyLeft = 'dice_left';
  static const _keyRight = 'dice_right';
  static const _keyRotation = 'dice_rotation';

  const CacheService();

  Future<void> saveState({required int left, required int right, required double rotation}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyLeft, left);
    await prefs.setInt(_keyRight, right);
    await prefs.setDouble(_keyRotation, rotation);
  }

  Future<Map<String, dynamic>?> loadState() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(_keyLeft) || !prefs.containsKey(_keyRight) || !prefs.containsKey(_keyRotation)) {
      return null;
    }
    return {
      'left': prefs.getInt(_keyLeft) ?? 1,
      'right': prefs.getInt(_keyRight) ?? 1,
      'rotation': prefs.getDouble(_keyRotation) ?? 0.0,
    };
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLeft);
    await prefs.remove(_keyRight);
    await prefs.remove(_keyRotation);
  }
}
