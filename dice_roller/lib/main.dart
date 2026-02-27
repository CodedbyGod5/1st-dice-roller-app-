import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/widgets/die.dart';
import 'src/models/dice_model.dart';

void main() => runApp(const DiceApp());

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiceModel(),
      child: MaterialApp(
        title: 'Dice Roller',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatelessWidget {
  /// Optional model that can be injected for tests. If null, provider is used.
  const DicePage({super.key, this.model});

  final DiceModel? model;

  @override
  Widget build(BuildContext context) {
    final effectiveModel = model ?? context.watch<DiceModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Dice Roller')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AnimatedRotation(
              turns: effectiveModel.rotation / (2 * pi),
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOutCubic,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Die(value: effectiveModel.left, onTap: effectiveModel.roll),
                  const SizedBox(width: 20),
                  Die(value: effectiveModel.right, onTap: effectiveModel.roll),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: effectiveModel.roll,
              icon: const Icon(Icons.casino_outlined),
              label: const Text('Roll'),
            ),
            const SizedBox(height: 12),
            Text('Tap a die to roll',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
