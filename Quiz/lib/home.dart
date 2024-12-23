import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/quiz-logo.png',
            width: 300,
            color: Colors.white.withOpacity(0.65),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter!',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white.withOpacity(0.65),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: switchScreen,
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
