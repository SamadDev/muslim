import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Audio with ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  bool state = false;
  int last_index = 0;
  int audio_index = 0;

  void changeState(bool states) {
    state = states;
    notifyListeners();
  }

  Future<void> play_audio({int index = 0, scrollC, list, type}) async {
    try {
      print('run');
      player = AudioPlayer();
      if (last_index != 0) {
        index = last_index - 1;
        notifyListeners();
      }
      changeState(true);

      int audio_index = index;
      audio_index = last_index;
      String next_audio = list[audio_index].audio;
      audio_index++;

      player.setUrl(next_audio);
      await player.play();
      await scrollC.scrollToIndex(index + 1);
      if (state == false) {
        if (index <= list.length - 1) {
          print(index);
          print(list.length - 1);
          last_index++;
          await play_audio(
              index: audio_index, scrollC: scrollC, list: list, type: type);
        }
        notifyListeners();
      }
    } catch (e) {
      print("Connection aborted:");
    }
  }

  Future<void> play_audio_offline(
      {int index = 0, scrollC, list, type, number}) async {
    try {
      //to add 0 00 before number to be the same of audio file name
      number = number.padLeft(3, '0');
      if (last_index != 0) {
        index = last_index;
        notifyListeners();
      }
      changeState(true);
      player = AudioPlayer();
      audio_index = index;
      audio_index++;
      await player.setAsset(audio_index < 10
          ? 'assets/audio/${number}00${audio_index.toString()}.mp3'
          : audio_index < 100
              ? 'assets/audio/${number}0${audio_index.toString()}.mp3'
              : 'assets/audio/${number.toString()}${audio_index.toString()}.mp3');
      await player.play();
      await scrollC.scrollToIndex(index + 1);
      print(audio_index.toString() + "_____" + list.length.toString());
      if (state == true && audio_index < list.length) {
        last_index++;
        await play_audio_offline(
            index: audio_index,
            scrollC: scrollC,
            list: list,
            type: type,
            number: number);
        notifyListeners();
      } else if (state == false) {
        print('state is false');
      } else {
        print("completed");
        changeState(false);
        index = 0;
        last_index = 0;
        audio_index = 0;
        player.dispose();
        notifyListeners();
      }
    } catch (e) {
      print("Connection aborted:");
    }
  }

  Future<void> pauseAudio() async {
    try {
      changeState(false);
      await player.pause();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> stopAudio() async {
    try {
      changeState(false);
      await player.pause();
      last_index = 0;
      audio_index = 0;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
