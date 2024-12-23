import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playsound(int noteNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$noteNumber.wav'));
  }

  Widget buildkey({required int soundNumber, required Color color}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
          backgroundColor: color,
        ),
        child: Container(),
        onPressed: () {
          playsound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildkey(color: Colors.blue.shade700, soundNumber: 1),
              buildkey(color: Colors.blue.shade600, soundNumber: 2),
              buildkey(color: Colors.blue.shade500, soundNumber: 3),
              buildkey(color: Colors.blue.shade400, soundNumber: 4),
              buildkey(color: Colors.blue.shade300, soundNumber: 5),
              buildkey(color: Colors.blue.shade200, soundNumber: 6),
              buildkey(color: Colors.blue.shade100, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
