import 'package:flutter/material.dart';
import 'package:toku/components/phrases_item.dart';
import 'package:toku/model/object.dart';

class PhrasesPage extends StatelessWidget {
  const PhrasesPage({super.key});

  final List<Object> family = const [
    Object(
        sound: 'sounds/phrases/are_you_coming.wav',
        textInEnglish: 'Are you coming',
        textInJapanese: 'Kimasu ka'),
    Object(
        sound: 'sounds/phrases/dont_forget_to_subscribe.wav',
        textInEnglish: 'Dont forget to subscribe',
        textInJapanese: 'Kōdoku o o wasurenaku'),
    Object(
        sound: 'sounds/phrases/how_are_you_feeling.wav',
        textInEnglish: 'How are you feeling',
        textInJapanese: 'Go kibun wa ikagadesu ka'),
    Object(
        sound: 'sounds/phrases/i_love_anime.wav',
        textInEnglish: 'I love anime',
        textInJapanese: 'Watashi wa anime ga daisukidesu'),
    Object(
        sound: 'sounds/phrases/i_love_programming.wav',
        textInEnglish: 'I love programming',
        textInJapanese: 'Watashi wa puroguramingu ga \ndaisukidesu'),
    Object(
        sound: 'sounds/phrases/programming_is_easy.wav',
        textInEnglish: 'Programming is easy',
        textInJapanese: 'Puroguramingu wa kantan'),
    Object(
        sound: 'sounds/phrases/what_is_your_name.wav',
        textInEnglish: 'What is your name',
        textInJapanese: 'Anata no namae wa nanidesu ka'),
    Object(
        sound: 'sounds/phrases/where_are_you_going.wav',
        textInEnglish: 'Where are you going',
        textInJapanese: 'Doko ni iku no'),
    Object(
        sound: 'sounds/phrases/yes_im_coming.wav',
        textInEnglish: 'Yes im coming',
        textInJapanese: 'Hai, ikimasu'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Phrases'),
      ),
      body: ListView.builder(
        itemCount: family.length,
        itemBuilder: (context, index) {
          return PhrasesItem(object: family[index]);
        },
      ),
    );
  }
}
