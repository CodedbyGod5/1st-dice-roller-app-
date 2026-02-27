import 'dart:math';
import 'package:flutter/foundation.dart';

import 'services/cache_service.dart';

/// Application state for the dice roller.
///
/// This class is a [ChangeNotifier] so widgets can listen for changes.
class DiceModel extends ChangeNotifier {
  DiceModel({CacheService? cache}) : _cache = cache ?? const CacheService() {
    _loadFromCache();
  }

  final CacheService _cache;
  final Random _rng = Random();

  int _left = 1;
  int _right = 1;
  double _rotation = 0;

  int get left => _left;
  int get right => _right;
  double get rotation => _rotation;

  /// Roll both dice and animate a full rotation.
  Future<void> roll() async {
    _left = _rng.nextInt(6) + 1;
    _right = _rng.nextInt(6) + 1;
    _rotation += pi * 2;
    notifyListeners();
    await _cache.saveState(left: _left, right: _right, rotation: _rotation);
  }

  Future<void> _loadFromCache() async {
    final state = await _cache.loadState();
    if (state != null) {
      _left = state['left'] as int;
      _right = state['right'] as int;
      _rotation = state['rotation'] as double;
      notifyListeners();
    }
  }
}
