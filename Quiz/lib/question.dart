import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'answer_button.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Question...',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          AnswerButton(answer: 'answer1...', onPressed: () {}),
          const SizedBox(height: 30),
          AnswerButton(answer: 'answer2...', onPressed: () {}),
          const SizedBox(height: 30),
          AnswerButton(answer: 'answer3...', onPressed: () {}),
          const SizedBox(height: 30),
          AnswerButton(answer: 'answer4...', onPressed: () {}),
        ],
      ),
    );
  }
}
