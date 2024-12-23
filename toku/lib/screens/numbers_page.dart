import 'package:flutter/material.dart';
import 'package:toku/components/row_containerr.dart';
import 'package:toku/model/object.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({super.key});
  final List<Object> numbers = const [
    Object(
        sound: 'sounds/numbers/number_one_sound.mp3',
        image: 'assets/images/numbers/number_one.png',
        textInJapanese: 'ichi',
        textInEnglish: 'one'),
    Object(
        sound: 'sounds/numbers/number_two_sound.mp3',
        image: 'assets/images/numbers/number_two.png',
        textInJapanese: 'ni',
        textInEnglish: 'two'),
    Object(
        sound: 'sounds/numbers/number_three_sound.mp3',
        image: 'assets/images/numbers/number_three.png',
        textInJapanese: 'san',
        textInEnglish: 'three'),
    Object(
        sound: 'sounds/numbers/number_four_sound.mp3',
        image: 'assets/images/numbers/number_four.png',
        textInJapanese: 'shi',
        textInEnglish: 'four'),
    Object(
        sound: 'sounds/numbers/number_five_sound.mp3',
        image: 'assets/images/numbers/number_five.png',
        textInJapanese: 'go',
        textInEnglish: 'five'),
    Object(
        sound: 'sounds/numbers/number_six_sound.mp3',
        image: 'assets/images/numbers/number_six.png',
        textInJapanese: 'roku',
        textInEnglish: 'six'),
    Object(
        sound: 'sounds/numbers/number_seven_sound.mp3',
        image: 'assets/images/numbers/number_seven.png',
        textInJapanese: 'shichi',
        textInEnglish: 'seven'),
    Object(
        sound: 'sounds/numbers/number_eight_sound.mp3',
        image: 'assets/images/numbers/number_eight.png',
        textInJapanese: 'hachi',
        textInEnglish: 'eight'),
    Object(
        sound: 'sounds/numbers/number_nine_sound.mp3',
        image: 'assets/images/numbers/number_nine.png',
        textInJapanese: 'ku',
        textInEnglish: 'nine'),
    Object(
        sound: 'sounds/numbers/number_ten_sound.mp3',
        image: 'assets/images/numbers/number_ten.png',
        textInJapanese: 'juu',
        textInEnglish: 'ten'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 89, 97),
        title: const Text('Numbers'),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (BuildContext context, int index) {
          return RowContainerr(object: numbers[index]);
        },
      ),
    );
  }
}
