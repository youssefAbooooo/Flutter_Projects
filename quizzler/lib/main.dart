import 'package:flutter/material.dart';
import 'package:quizzler/questionBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizzlerPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage({super.key});

  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  List<Icon> scoreKeeper = [];
  int score = 0;
  Questionbrain questionbrain = Questionbrain();

  void checkAnswer(bool userAnswer) {
    setState(() {
      if (questionbrain.isFinished()) {
        if (questionbrain.getQuestionAnswer() == userAnswer) {
          score++;
          // print('final question score : $score');
        }
        Alert(
                context: context,
                title: "Finished!",
                desc: "Your score is $score/13")
            .show();
        score = 0;
        questionbrain.reset();
        scoreKeeper.clear();
      } else {
        if (questionbrain.getQuestionAnswer() == userAnswer) {
          score++;
          // print('score : $score');
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        questionbrain.nextQuestoin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 8,
          child: Center(
            child: Text(
              questionbrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 27,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
