import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioService extends GetxController {
  final player = AudioCache();
  AudioPlayer? backgroundPlayer;

  AudioPlayer advancedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  final List<String> playerOnePlaySounds = [
    "accent.wav",
    "click.wav",
  ];
  final List<String> playerTwoPlaySounds = [
    "playerTwoPlay1.wav",
    "playerTwoPlay2.wav"
  ];

  RxBool playOrderPlayerOne = false.obs;
  bool playOrderPlayerTwo = false;

  AudioService() {
   playAtInitWithMutedSound();
  //  player.loadAll([playerOnePlaySounds.first]);
    //   playBackgroundMusic();
  }

  void playAtInitWithMutedSound() async {
    await player.play(playerOnePlaySounds.first, mode: PlayerMode.LOW_LATENCY,volume: 0.0);
    await player.play(playerOnePlaySounds.last, mode: PlayerMode.LOW_LATENCY,volume: 0.0);

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
