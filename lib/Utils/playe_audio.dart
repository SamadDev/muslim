import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

Future<void> play_audio({url, required int index, scrollC, list}) async {
  try {
    int audio_index = index;
    for (int i = index; i <= list.length; i++) {
    final next_audio = list[audio_index].audio;
      audio_index++;
      final player = AudioPlayer();
      await player.setUrl(next_audio);
      await player.play();
      scrollC.scrollToIndex(audio_index, preferPosition: AutoScrollPosition.begin);
    }
  } catch (e) {
    print("Connection aborted:");
  }
}

class AudioPlayerFunction with ChangeNotifier {
  final player = AudioPlayer();
  bool hardStop = false;

  Future<void> playAudio(url, index) async {
    if (url != null) {
      try {
        if (index < 50) {
          int index_plus = index + 1;
          // await playAudio(url , index_plus);
          // await player.setUrl(url);
          print(index);
          print(url);
        }
      } on PlayerException catch (e) {
      } on PlayerInterruptedException catch (e) {
      } catch (e) {}
    } else {}
  }

// void dispose() {
//   player.stop();
//   player.dispose();
//   dispose();
// }
}

///////////////////

// final player = AudioPlayer();
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
