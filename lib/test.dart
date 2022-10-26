import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioTextSync extends StatefulWidget {
  const AudioTextSync({Key? key}) : super(key: key);

  @override
  _AudioTextSyncState createState() => _AudioTextSyncState();
}

class _AudioTextSyncState extends State<AudioTextSync> {
  final player = AudioPlayer();
  final texts = {
    3: 'Hi',
    7: 'How are you?',
    12: 'Bye',
  };
  static const maximumDisplayTime = 1;
  var displayText = '';
  var lastShownSecond = -maximumDisplayTime - 1;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(displayText),
              ElevatedButton(
                onPressed: _playOrPause,
                child: const Text('Play/Pause'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _init() async {
    player.onPositionChanged.listen(
          (event) {
        final text = texts[event.inSeconds];
        if (text != null) {
          setState(() {
            displayText = text;
            lastShownSecond = event.inSeconds;
          });
        } else if (event.inSeconds - lastShownSecond >= maximumDisplayTime) {
          setState(() {
            displayText = '';
          });
        }
      },
    );
  }

  _playOrPause() async {
    if (player.state == PlayerState.playing) {
      await player.pause();
    } else {
    }
  }
}