import 'dart:developer' as developer;
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const RollDice());
}

class RollDice extends StatelessWidget {
  const RollDice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF360033), Color(0xFF0b8793)],
            ),
          ),
          child: const Center(child: RollActive()),
        ),
      ),
    );
  }
}

class RollActive extends StatefulWidget {
  const RollActive({super.key});

  @override
  State<RollActive> createState() => _RollActiveState();
}

class _RollActiveState extends State<RollActive> {
  int imageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('images/dice-$imageNumber.png', width: 200),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            setState(() {
              developer.log('Clicked!');
              imageNumber = Random().nextInt(6) + 1;
              developer.log('imageNumber = $imageNumber');
            });
          },
          child: const Text(
            'Roll Dice',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ],
    );
  }
}
