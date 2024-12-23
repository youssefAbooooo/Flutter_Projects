import 'package:flutter/material.dart';
import 'package:toku/components/row_containerr.dart';
import 'package:toku/model/object.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  final List<Object> colors = const [
    Object(
        sound: 'sounds/colors/black.wav',
        textInEnglish: 'Black',
        image: 'assets/images/colors/color_black.png',
        textInJapanese: 'shikkoku'),
    Object(
        sound: 'sounds/colors/brown.wav',
        textInEnglish: 'Brown',
        image: 'assets/images/colors/color_brown.png',
        textInJapanese: 'chairo'),
    Object(
        sound: 'sounds/colors/dusty yellow.wav',
        textInEnglish: 'Dusty',
        image: 'assets/images/colors/color_dusty_yellow.png',
        textInJapanese: 'kusunda kiiro'),
    Object(
        sound: 'sounds/colors/gray.wav',
        textInEnglish: 'Gray',
        image: 'assets/images/colors/color_gray.png',
        textInJapanese: 'gurē'),
    Object(
        sound: 'sounds/colors/green.wav',
        textInEnglish: 'Green',
        image: 'assets/images/colors/color_green.png',
        textInJapanese: 'midori'),
    Object(
        sound: 'sounds/colors/red.wav',
        textInEnglish: 'Red',
        image: 'assets/images/colors/color_red.png',
        textInJapanese: 'aka'),
    Object(
        sound: 'sounds/colors/white.wav',
        textInEnglish: 'White',
        image: 'assets/images/colors/color_white.png',
        textInJapanese: 'shiro'),
    Object(
        sound: 'sounds/colors/yellow.wav',
        textInEnglish: 'Yellow',
        image: 'assets/images/colors/yellow.png',
        textInJapanese: 'kiiro'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors'),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return RowContainerr(object: colors[index]);
        },
      ),
    );
  }
}
