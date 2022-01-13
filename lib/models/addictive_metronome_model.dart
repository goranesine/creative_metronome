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
  RxInt listLength = 4.obs;
  RxBool isAutomaticIncreaserOn = false.obs;
  RxInt barCounter = 0.obs;

  AddictiveMetronomeModel() {
    beatCounter.value = -1;
    calculateBeatDurationInMilliseconds();
    //  testTempoChange();
  }

  void testTempoChange() {
    Timer(Duration(seconds: 10), () => updateTempoInBpm(180));
    update();
  }

  void automaticIncreaserOnOff() {
    isAutomaticIncreaserOn.value = !isAutomaticIncreaserOn.value;
    barCounter.value = 0;
    update();
  }

  void startAutomaticTimeIncreasment() {
    if (tempoInBpm.value <= 295 && isAutomaticIncreaserOn.value == true) {
      audioService.playTempoChange();
      tempoInBpm.value = tempoInBpm.value + 5;
      barCounter.value = 0;
      update();
      calculateBeatDurationInMilliseconds();
    }
  }

  void getListLength() {
    listLength.value = beatStatusList.length;
    update();
  }

  void addBeat() {
    if (beatStatusList.length > 1 && beatStatusList.length < 8) {
      beatStatusList.add(RxBool(false));
      barCounter.value = 0;

      update();
      getListLength();
      calculateBeatDurationInMilliseconds();
    }
  }

  void removeBeat() {
    if (beatStatusList.length > 2) {
      beatStatusList.removeLast();
      barCounter.value = 0;

      update();
      getListLength();
      calculateBeatDurationInMilliseconds();
    }
  }

  void setBeatAccent(int index) {
    bool oldValue = beatStatusList[index].value;
    beatStatusList[index].value = !oldValue;
    update();
  }

  void calculateBeatDurationInMilliseconds() {
    beatDurationInMilliseconds =
        Duration(milliseconds: 60000.0 ~/ tempoInBpm.value);
    update();
  }

  void updateTempoInBpm(int newTempo) {
    if (tempoInBpm.value >= 40 && tempoInBpm.value <= 300) {
      tempoInBpm.value = newTempo;
      update();
      calculateBeatDurationInMilliseconds();
    }
  }

  void switchOnOff() {
    if (isMetronomePlaying.value == false) {
      barCounter.value = 0;
      isMetronomePlaying.value = true;
      update();
      initMetronome();
    } else {
      isMetronomePlaying.value = false;
      beatCounter.value = -1;
      barCounter.value = 0;

      update();
    }
  }

  void initMetronome() {
    Timer(beatDurationInMilliseconds,
        () => isMetronomePlaying.value == true ? initMetronome() : null);

    updateBeatCounter();
  }

  void updateBeatCounter() {
    if (beatCounter < beatStatusList.length - 1) {
      beatCounter++;
      update();
      playSound();
    } else {
      barCounter.value > 4 ? barCounter.value = 0 : barCounter.value++;

      beatCounter.value = 0;
      update();

      playSound();
    }
  }

  void updateBarCounter() {}

  void playSound() {
    if (barCounter.value == 4) {
      startAutomaticTimeIncreasment();
    }
    print("beatnumber:$beatCounter");
    print("barcounter: $barCounter");
    print("tempoinbpm$tempoInBpm");
    beatStatusList[beatCounter.value].value == true
        ? audioService.playAccent()
        : audioService.playDownNote();
  }
}
