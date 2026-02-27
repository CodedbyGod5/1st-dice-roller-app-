import 'package:flutter/material.dart';

/// A square "die" that displays a value and invokes [onTap] when pressed.
class Die extends StatelessWidget {
  const Die({
    Key? key,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  final int value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const double size = 120;
    const borderRadius = BorderRadius.all(Radius.circular(12));

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 1, 59, 24),
          borderRadius: borderRadius,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withAlpha(128),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
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
