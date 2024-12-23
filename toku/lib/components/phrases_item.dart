import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:toku/model/object.dart';

class PhrasesItem extends StatelessWidget {
  const PhrasesItem({super.key, required this.object});

  final Object object;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.blueGrey,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  object.textInJapanese,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  object.textInEnglish,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              // print('pressed');
              final player = AudioPlayer();
              player.play(AssetSource(object.sound));
            },
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
