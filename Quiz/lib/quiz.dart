import 'package:flutter/material.dart';
import 'package:quiz/question.dart';

import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = Home(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const Questions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurpleAccent,
                Colors.purpleAccent,
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
