import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int soundNumber) async{
    final player = AudioPlayer();
    await player.setSource(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Container(
          color: color,
          height: double.maxFinite,
          width: double.maxFinite,
        ),
        onPressed: () async {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.blueGrey, soundNumber: 2),
              buildKey(color: Colors.blue, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.yellow, soundNumber: 5),
              buildKey(color: Colors.orange, soundNumber: 6),
              buildKey(color: Colors.deepPurpleAccent, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
