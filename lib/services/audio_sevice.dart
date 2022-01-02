import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioService extends GetxController {
  final player = AudioCache();
  AudioPlayer? backgroundPlayer;

  AudioPlayer advancedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  final List<String> playerOnePlaySounds = [
    "playerOnePlay1.wav",
    "playerOnePlay2.wav",
  ];
  final List<String> playerTwoPlaySounds = [
    "playerTwoPlay1.wav",
    "playerTwoPlay2.wav"
  ];

  RxBool playOrderPlayerOne = false.obs;
  bool playOrderPlayerTwo = false;
  RxInt beatCounter = 0.obs;

  AudioService() {
    player.loadAll([playerOnePlaySounds.first]);
    //   playBackgroundMusic();
  }

  Future playBackgroundMusic() async {
    // backgroundPlayer.stop();
    backgroundPlayer =
        await player.loop("backgroundMusic.mp3", stayAwake: true);
  }

  void playAccent() async {
    await player.play(playerOnePlaySounds.first, mode: PlayerMode.LOW_LATENCY);
  }

  void playDownNote() async {
    await player.play(playerOnePlaySounds.last, mode: PlayerMode.LOW_LATENCY);
  }

  @override
  void dispose() {
    player.clearAll();
    super.dispose();
  }
}
