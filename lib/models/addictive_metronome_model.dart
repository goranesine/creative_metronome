import 'dart:async';

import 'package:get/get.dart';
import 'package:math_game/services/audio_sevice.dart';

class AddictiveMetronomeModel extends GetxController {
  final audioService = Get.find<AudioService>();
  RxInt beatCounter = 1.obs;
  RxInt tempoInBpm = 120.obs;
  RxBool isMetronomePlaying = false.obs;
  Duration beatDurationInMilliseconds = Duration();
  RxList<RxBool> beatStatusList =
      <RxBool>[RxBool(true), RxBool(false), RxBool(false), RxBool(false)].obs;

  AddictiveMetronomeModel() {
    beatCounter.value = -1;
    calculateBeatDurationInMilliseconds();
  }

  void addBeat() {
    if (beatStatusList.length > 1 && beatStatusList.length < 8) {
      beatStatusList.add(RxBool(false));
  //    beatCounter = 0;

      update();
      calculateBeatDurationInMilliseconds();
    }
  }

  void removeBeat() {
    if (beatStatusList.length > 2) {
      beatStatusList.removeLast();
   //   beatCounter = 0;

      update();
      calculateBeatDurationInMilliseconds();
    }
  }

  void setBeatAccent(int index){
bool oldValue = beatStatusList[index].value;
beatStatusList[index].value = !oldValue;
    update();
  }

  void calculateBeatDurationInMilliseconds() {

      beatDurationInMilliseconds = Duration(milliseconds: 60000.0 ~/ tempoInBpm.value);
update();
  }

  void updateTempoInBpm(int newTempo) {
    if (tempoInBpm.value >= 40 && tempoInBpm.value <= 240) {
      tempoInBpm.value = newTempo;
      update();
      calculateBeatDurationInMilliseconds();
    }
  }

  void switchOnOff() {
    if (isMetronomePlaying.value == false) {
      isMetronomePlaying.value = true;
      update();
      initMetronome();
    } else {
      isMetronomePlaying.value = false;
      beatCounter.value = -1;

      update();
    }
  }

  void initMetronome() {
    Timer(beatDurationInMilliseconds,
        () => isMetronomePlaying.value == true ? initMetronome() : null);
    updateBeatCounter();
  }

  void updateBeatCounter() {
    if (beatCounter < beatStatusList.length-1) {
      beatCounter++;
      update();
      playSound();
    } else {
      beatCounter.value = 0;
      update();
      playSound();
    }
  }

  void playSound() {
    beatStatusList[beatCounter.value ].value == true
        ? audioService.playAccent()
        : audioService.playDownNote();
  }
}
