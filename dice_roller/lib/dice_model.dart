import 'dart:math';
import 'package:flutter/foundation.dart';

/// Application state for the dice roller.
///
/// This class is a [ChangeNotifier] so widgets can listen for changes.
class DiceModel extends ChangeNotifier {
  final Random _rng = Random();

  int _left = 1;
  int _right = 1;
  double _rotation = 0;

  int get left => _left;
  int get right => _right;
  double get rotation => _rotation;

  /// Roll both dice and animate a full rotation.
  void roll() {
    _left = _rng.nextInt(6) + 1;
    _right = _rng.nextInt(6) + 1;
    _rotation += pi * 2;
    notifyListeners();
  }
}
