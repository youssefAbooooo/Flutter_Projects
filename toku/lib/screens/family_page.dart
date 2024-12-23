import 'package:flutter/material.dart';
import 'package:toku/components/row_containerr.dart';
import 'package:toku/model/object.dart';

class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});

  final List<Object> family = const [
    Object(
        sound: 'sounds/family_members/father.wav',
        textInEnglish: 'Father',
        image: 'assets/images/family_members/family_father.png',
        textInJapanese: 'Chichioya'),
    Object(
        sound: 'sounds/family_members/daughter.wav',
        textInEnglish: 'Daughter',
        image: 'assets/images/family_members/family_daughter.png',
        textInJapanese: 'Musume'),
    Object(
        sound: 'sounds/family_members/grand father.wav',
        textInEnglish: 'Grand Father',
        image: 'assets/images/family_members/family_grandfather.png',
        textInJapanese: 'Ojiisan'),
    Object(
        sound: 'sounds/family_members/grand mother.wav',
        textInEnglish: 'Grand Mother',
        image: 'assets/images/family_members/family_grandmother.png',
        textInJapanese: 'Sobo'),
    Object(
        sound: 'sounds/family_members/mother.wav',
        textInEnglish: 'Mother',
        image: 'assets/images/family_members/family_mother.png',
        textInJapanese: 'Hahaoya'),
    Object(
        sound: 'sounds/family_members/older bother.wav',
        textInEnglish: 'Older Brother',
        image: 'assets/images/family_members/family_older_brother.png',
        textInJapanese: 'Oniisan'),
    Object(
        sound: 'sounds/family_members/older sister.wav',
        textInEnglish: 'Older Sister',
        image: 'assets/images/family_members/family_older_sister.png',
        textInJapanese: 'Ane'),
    Object(
        sound: 'sounds/family_members/son.wav',
        textInEnglish: 'Son',
        image: 'assets/images/family_members/family_son.png',
        textInJapanese: 'Musuko'),
    Object(
        sound: 'sounds/family_members/younger brohter.wav',
        textInEnglish: 'Younger Brother',
        image: 'assets/images/family_members/family_younger_brother.png',
        textInJapanese: 'Otouto'),
    Object(
        sound: 'sounds/family_members/younger sister.wav',
        textInEnglish: 'Younger Sister',
        image: 'assets/images/family_members/family_younger_sister.png',
        textInJapanese: 'Imouto'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Family Members'),
      ),
      body: ListView.builder(
        itemCount: family.length,
        itemBuilder: (context, index) {
          return RowContainerr(object: family[index]);
        },
      ),
    );
  }
}
