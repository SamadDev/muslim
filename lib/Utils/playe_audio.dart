import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Audio with ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  int curent_index = 0;
  bool state = false;

  void changeState(bool states) {
    state = states;
    notifyListeners();
  }

  // Future<void> play_audio({int index = 0, scrollC, list, type}) async {
  //   try {
  //     player = AudioPlayer();
  //     if (last_index != 0) {
  //       index = last_index - 1;
  //       notifyListeners();
  //     }
  //     changeState(true);
  //
  //     int audio_index = index;
  //     audio_index = last_index;
  //     String next_audio = list[audio_index].audio;
  //     audio_index++;
  //     player.setUrl(next_audio);
  //     player.play();
  //     await scrollC.scrollToIndex(index + 1, preferPosition: AutoScrollPosition.begin);
  //     if (state == false) {
  //       if (index <= list.length - 1) {
  //         print(index);
  //         print(list.length - 1);
  //         last_index++;
  //         await play_audio(index: audio_index, scrollC: scrollC, list: list, type: type);
  //       }
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     print("Connection aborted:$e");
  //   }
  // }

  Future<void> play_audio_offline({index, scrollC, list, type, surahIndex, playIndex = false}) async {
    print("____________________play audio $index offline______________");
    try {
      //"to add 0 00 before number to be the same of audio file name"
      surahIndex = surahIndex.toString().padLeft(3, '0');
      if (playIndex) {
        stopAudio();
      }
      changeState(true);
      player = AudioPlayer();
      curent_index = index;
      index++;
      String ayahIndex = index.toString().padLeft(3, '0');
      await player.setAsset('assets/quran/$surahIndex$ayahIndex.mp3');
      await player.play();
      print("________before scroll__index____ $index _______________");
      await scrollC.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
      if (state == true && index <= list.length) {
        print("______inside the if loop____index__ $index ______________");
        await play_audio_offline(index: index, scrollC: scrollC, list: list, type: type, surahIndex: surahIndex);
        notifyListeners();
      }
      if (state == false) {
        print('state is false');
      } else {
        print("completed");
        changeState(false);
        index = 0;
        index = 0;
        player.dispose();
        notifyListeners();
      }
    } catch (e) {
      print("Error is: $e");
    }
  }

  // Future<void> play_audio_online({int index = 0, scrollC, list, type}) async {
  //   try {
  //     print("____________________play audio online______________");
  //     if (last_index != 0) {
  //       index = last_index;
  //       notifyListeners();
  //     }
  //     print("index is " + index.toString());
  //     changeState(true);
  //     player = AudioPlayer();
  //     audio_index = index;
  //     print(list[audio_index].audio);
  //     await player.setUrl(list[audio_index].audio);
  //     await player.play();
  //     audio_index++;
  //     await scrollC.scrollToIndex(index + 1, preferPosition: AutoScrollPosition.middle);
  //     if (state == true && audio_index < list.length) {
  //       print('if ssta is true and audio_index<length of list');
  //       last_index++;
  //       await play_audio_online(
  //         index: audio_index,
  //         scrollC: scrollC,
  //         list: list,
  //         type: type,
  //       );
  //       notifyListeners();
  //     } else if (state == false) {
  //       print('state is false');
  //     } else {
  //       print("completed");
  //       changeState(false);
  //       index = 0;
  //       last_index = 0;
  //       audio_index = 0;
  //       player.dispose();
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     print("Connection aborted:$e");
  //   }
  // }

  // Future<void> pauseAudio() async {
  //   try {
  //     changeState(false);
  //     await player.stop();
  //     notifyListeners();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> stopAudio() async {
    try {
      changeState(false);
      await player.stop();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  // Pause the audio
  // void stopAudio() async {
  //   changeState(false);
  //   _isPaused = true;
  //   await player.pause();
  //   player.positionStream.listen((position) {
  //     _currentPosition = position;
  //   });
  //   notifyListeners();
  // }
}
