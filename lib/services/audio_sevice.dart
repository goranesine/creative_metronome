import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioService extends GetxController {
  final player = AudioCache();
  AudioPlayer ?backgroundPlayer;

  AudioPlayer advancedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

//  String? localFilePath;
  // String? localAudioCacheURI;
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

  AudioService() {

    player.loadAll([playerTwoPlaySounds.first]);
 //   playBackgroundMusic();
  }

  Future playBackgroundMusic() async {
    // backgroundPlayer.stop();
    backgroundPlayer = await player.loop("backgroundMusic.mp3",stayAwake: true);
  }

  void testPlay(){
    player.play(playerTwoPlaySounds.first,
        mode: PlayerMode.LOW_LATENCY);
  }

  void playerOneOnClickSound() async {
    if (playOrderPlayerOne.value == false) {
      await player.play(playerOnePlaySounds.first,
          mode: PlayerMode.LOW_LATENCY);
      playOrderPlayerOne.value == false
          ? playOrderPlayerOne.value = true
          : playOrderPlayerOne.value = false;
    } else {
      await player.play(playerOnePlaySounds.last, mode: PlayerMode.LOW_LATENCY);
      playOrderPlayerOne.value == false
          ? playOrderPlayerOne.value = true
          : playOrderPlayerOne.value = false;
    }
  }

  void playerTwoOnClickSound() async {
    if (playOrderPlayerTwo == false) {
      await player.play(playerTwoPlaySounds.first,
          mode: PlayerMode.LOW_LATENCY);
      playOrderPlayerTwo == false
          ? playOrderPlayerTwo = true
          : playOrderPlayerTwo = false;
    } else {
      await player.play(playerTwoPlaySounds.last, mode: PlayerMode.LOW_LATENCY);
      playOrderPlayerTwo == false
          ? playOrderPlayerTwo = true
          : playOrderPlayerTwo = false;
    }
  }

  void startLoop() async {
    for(var i=0; i<4;i++){
      Future.delayed(Duration(seconds: i),()=>playFreezeSound());
    }
  }

  void playFreezeSound() async {
    await player.play("playerFreezed.wav");
  }

  void stopLoop() async {}

  @override
  void dispose() {
    backgroundPlayer?.dispose();
    super.dispose();
  }
}
