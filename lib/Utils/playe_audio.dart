import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

class Audio with ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  bool is_play = false;
  bool state = false;

  void changeState(bool states) {
    state = states;
    notifyListeners();
  }

  Future<void> play_audio({int index = 0, scrollC, list, type}) async {
    try {
      changeState(true);
      is_play = false;
      player = AudioPlayer();
      int audio_index = index;
      String next_audio = list[audio_index].audio;
      audio_index++;
      await player.setUrl(next_audio);
      await player.play();
      await scrollC.scrollToIndex(index + 1);
      if (is_play == false) {
        if (index <= list.length - 1) {
          await play_audio(
              index: audio_index, scrollC: scrollC, list: list, type: type);
        }
        notifyListeners();
      }
    } catch (e) {
      print("Connection aborted:");
    }
  }

  Future<void> stopAudio() async {
    try {
      is_play = true;
      changeState(false);
      await player.pause();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> pauseAudio() async {
    try {
      await player.pause();
    } catch (e) {
      print(e);
    }
  }
}

// final player = AudioPlayer();
// Ayat? lastAyat;
//
// bool hardStop = false;
//
// Future<void> playAudio(Surah surah, int index, AutoScrollController scrollC) async {
//   Ayat ayat = surah.ayat![index];
//   if (ayat.audio != null) {
//     try {
//       await stopAudio(ayat);
//       hardStop = false;
//       tabC.animateTo(
//         114 - surah.id!,
//         duration: Duration(milliseconds: 500),
//       );
//       await Future.delayed(Duration(milliseconds: 500));
//       scrollC.scrollToIndex(
//         index + 2,
//         duration: Duration(milliseconds: 500),
//         preferPosition: AutoScrollPosition.begin,
//       );
//
//       if (lastAyat != null) {
//         // SUDAH PERNAH PLAY
//         // print("STOP AUDIO...");
//         // print(">> SUDAH PERNAH PLAY");
//         ayat.kondisiAudio = "stop"; // jaga2 saja
//         lastAyat!.kondisiAudio = "stop";
//         await player.stop();
//         update();
//       }
//
//       lastAyat = ayat;
//       await player.setUrl(ayat.audio!);
//       ayat.kondisiAudio = "playing";
//       update();
//       // print("SEDANG MULAI MEMUTAR AUDIO...");
//       await player.play();
//       // print("STOP AUDIO...");
//       ayat.kondisiAudio = "stop";
//       update();
//
//       // NEXT AUDIO
//       if (hardStop == false) {
//         if (index < surah.totalAyat! - 1) {
//           await playAudio(surah, index + 1, scrollC);
//         }
//       }
//     } on PlayerException catch (e) {
//       Get.defaultDialog(
//         title: "Terjadi Kesalahan",
//         middleText: e.message.toString(),
//       );
//     } on PlayerInterruptedException catch (e) {
//       Get.defaultDialog(
//         title: "Terjadi Kesalahan",
//         middleText: "Connection aborted: ${e.message}",
//       );
//     } catch (e) {
//       Get.defaultDialog(
//         title: "Terjadi Kesalahan",
//         middleText: "Tidak dapat play audio.",
//       );
//     }
//   } else {
//     Get.defaultDialog(
//       title: "Terjadi Kesalahan",
//       middleText: "URL Audio tidak ada / tidak dapat diakses.",
//     );
//   }
// }
//
// void pauseAudio(Ayat ayat) async {
//   try {
//     // print("PAUSE AUDIO...");
//     hardStop = true;
//     await player.pause();
//     ayat.kondisiAudio = "pause";
//     update();
//   } on PlayerException catch (e) {
//     Get.defaultDialog(
//       title: "Terjadi Kesalahan",
//       middleText: e.message.toString(),
//     );
//   } on PlayerInterruptedException catch (e) {
//     Get.defaultDialog(
//       title: "Terjadi Kesalahan",
//       middleText: "Connection aborted: ${e.message}",
//     );
//   } catch (e) {
//     Get.defaultDialog(
//       title: "Terjadi Kesalahan",
//       middleText: "Tidak dapat pause audio.",
//     );
//   }
// }
//
// void resumeAudio(Surah surah, int index, AutoScrollController scrollC) async {
//   Ayat ayat = surah.ayat![index];
//   try {
//     // print("RESUME AUDIO...");
//     hardStop = false;
//     ayat.kondisiAudio = "playing";
//     update();
//     await player.play();
//     ayat.kondisiAudio = "stop";
//     update();
//
//     // NEXT AUDIO
//     if (hardStop == false) {
//       if (index < surah.totalAyat! - 1) {
//         await playAudio(surah, index + 1, scrollC);
//       }
//     }
//   } on PlayerException catch (e) {
//     Get.defaultDialog(
//       title: "Terjadi Kesalahan",
//       middleText: e.message.toString(),
//     );
//   } on PlayerInterruptedException catch (e) {
//     Get.defaultDialog(
//       title: "Terjadi Kesalahan",
//       middleText: "Connection aborted: ${e.message}",
//     );
//   } catch (e) {
//     Get.defaultDialog(
//       title: "Terjadi Kesalahan",
//       middleText: "Tidak dapat resume audio.",
//     );
//   }
// }
//
// Future<void> stopAudio(Ayat ayat) async {
//   try {
//     hardStop = true;
//     await player.stop();
//     ayat.kondisiAudio = "stop";
//     update();
//   } on PlayerException catch (e) {
//     Get.defaultDialog(
//       title: "Terjadi Kesalahan",
//       middleText: e.message.toString(),
//     );
//   } on PlayerInterruptedException catch (e) {
//     Get.defaultDialog(
//       title: "Terjadi Kesalahan",
//       middleText: "Connection aborted: ${e.message}",
//     );
//   } catch (e) {
//     Get.defaultDialog(
//       title: "Terjadi Kesalahan",
//       middleText: "Tidak dapat stop audio.",
//     );
//   }
// }
