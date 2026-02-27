import 'dart:math';
import 'package:flutter/material.dart';
git remote add origin git@github.com:CodedbyGod5/1st-dice-roller-app-.git
git branch -M main
git push -u origin main
void main() => runApp(const DiceApp());

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage>
    with SingleTickerProviderStateMixin {
  int _left = 1;
  int _right = 1;
  final Random _rng = Random();
  double _rotation = 0;

  void _roll() {
    setState(() {
      _left = _rng.nextInt(6) + 1;
      _right = _rng.nextInt(6) + 1;
      _rotation += pi * 2; // spin animation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dice Roller')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AnimatedRotation(
              turns: _rotation / (2 * pi),
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOutCubic,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildDie(_left),
                  const SizedBox(width: 20),
                  _buildDie(_right),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _roll,
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

  Widget _buildDie(int value) {
    return GestureDetector(
      onTap: _roll,
      child: Container(
        width: 120,
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 1, 59, 24),
          borderRadius: BorderRadius.circular(12),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 4)),
          ],
        ),
        child: Text(
          '$value',
          style: const TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
