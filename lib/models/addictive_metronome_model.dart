import 'dart:async';

import 'package:get/get.dart';
import 'package:math_game/services/audio_sevice.dart';

class AddictiveMetronomeModel extends GetxController {
  final audioService = Get.find<AudioService>();
  int beatCounter = 0;
  RxInt tempoInBpm = 120.obs;
  RxBool isMetronomePlaying = false.obs;
  Duration beatDurationInMilliseconds = Duration(milliseconds: 500);
  RxList<RxBool> beatStatusList =
      <RxBool>[RxBool(true), RxBool(false), RxBool(false), RxBool(false)].obs;

  AddictiveMetronomeModel() {
    //  initMetronome();
  }

  void addBeat() {
    if (beatStatusList.length > 1 && beatStatusList.length < 8) {
      beatStatusList.add(RxBool(false));
      update();
    }
  }

  void removeBeat() {
    if (beatStatusList.length > 2) {
      beatStatusList.removeLast();
      update();
    }
  }

  void updateTempoInBpm(int newTempo) {
    if (tempoInBpm.value > 40 && tempoInBpm.value < 240) {
      tempoInBpm.value = newTempo;
      beatDurationInMilliseconds = Duration(milliseconds: newTempo ~/ 0.24);
      update();
    }
  }

  void switchOnOff() {
    if (isMetronomePlaying.value == false) {
      isMetronomePlaying.value = true;
      update();
      initMetronome();
    } else {
      isMetronomePlaying.value = false;
      beatCounter = 0;

      update();
    }
  }

  void initMetronome() {
    Timer(beatDurationInMilliseconds,
        () => isMetronomePlaying.value == true ? initMetronome() : null);
    updateBeatCounter();
  }

  void updateBeatCounter() {
    if (beatCounter < beatStatusList.length) {
      beatCounter++;
      update();
      playSound();
    } else {
      beatCounter = 1;
      update();
      playSound();
    }
  }

  void playSound() {
    beatStatusList[beatCounter - 1].value == true
        ? audioService.playAccent()
        : audioService.playDownNote();
    print(beatCounter);
  }
}
