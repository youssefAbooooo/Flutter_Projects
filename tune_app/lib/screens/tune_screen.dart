import 'package:flutter/material.dart';
import 'package:tune_app/components/tune_item.dart';
import 'package:tune_app/models/tune_model.dart';

class TuneScreen extends StatelessWidget {
  const TuneScreen({super.key});

  final List<TuneModel> items = const [
    TuneModel(color: Colors.red, sound: 'note1.wav'),
    TuneModel(color: Colors.orange, sound: 'note2.wav'),
    TuneModel(color: Colors.yellow, sound: 'note3.wav'),
    TuneModel(color: Colors.lightGreen, sound: 'note4.wav'),
    TuneModel(color: Colors.green, sound: 'note5.wav'),
    TuneModel(color: Colors.blue, sound: 'note6.wav'),
    TuneModel(color: Colors.purple, sound: 'note7.wav'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D2F31),
        foregroundColor: Colors.white,
        title: const Center(
          child: Text('Flutter tune'),
        ),
      ),
      body: Column(
        children: items.map((e) => TuneItem(tuneModel: e)).toList(),
      ),
    );
  }

  // List<Widget> getTuneItem() {
  //   List<TuneItem> items = [];

  //   for (var element in tuneColors) {
  //     items.add(TuneItem(
  //       color: element,
  //     ));
  //   }
  //   return items;
  // }
}
