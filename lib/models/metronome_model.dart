import 'dart:async';

import 'package:get/get.dart';
import 'package:math_game/services/audio_sevice.dart';

class MetronomeModel extends GetxController {
  final audioService = Get.find<AudioService>();
  RxList<int> barBpmList = <int>[].obs;

  RxInt tempo = 40.obs;
  bool active = false;
  RxBool tickSignal = false.obs;
  RxInt tickCounter = 0.obs;
  RxInt activeBarIndex = 0.obs;
  bool playAccent = true;

  MetronomeModel() {
    List.generate(48, (index) => barBpmList.add(120));
    metronomeInitState();
  }

  void metronomeInitState() {
    updateBpmMap(0, 40);
    playAccent = true;
    active = false;
    tickSignal.value = false;
    tickCounter.value = 0;
    activeBarIndex.value = 1;
    update();
  }

  void metronomeAfterLastBarState() {
    playAccent = true;
    active = true;
    tickSignal.value = true;
    tickCounter.value = 1;
    activeBarIndex.value = 1;
    update();
  }

  void metronomeAfterStopBarState() {
    playAccent = true;
    active = false;
    tickSignal.value = false;
    tickCounter.value = 0;
    activeBarIndex.value = 1;
    update();
  }

  void metronomeAfterPlayPressedState() {
    playAccent = true;
    active = true;
    tickCounter.value = 0;
    activeBarIndex.value = 1;
    update();
  }

  void start() {
    metronomeAfterPlayPressedState();
    Timer(_getDuration(), () => _handleEvent());
  }

  Duration _getDuration() {
    //  print(tempo);
    final time = 60 / barBpmList[activeBarIndex.value - 1];
    return Duration(
      seconds: time.toInt(),
      milliseconds: (time * 1000).toInt() % 1000,
      microseconds: (time * 1000000).toInt() % 1000,
    );
  }

  void _handleEvent() {
    calculateActiveBar();
    Timer(_getDuration(), () => active == true ? _handleEvent() : null);

    calculateAccent();
    playSound();
  }

  void updateBpmMap(int index, double endValue) {
    barBpmList[index] = endValue.toInt();
    for (var i = 0; i < barBpmList.length - index; i++) {
      barBpmList[barBpmList.length - i - 1] = endValue.toInt();
    }

    update();
  }

  void calculateActiveBar() {
    if (tickCounter.value % 4 == 0 &&
        activeBarIndex.value < 48 &&
        tickCounter.value > 3) {
      activeBarIndex.value++;

      update();
    }
  }

  void calculateAccent() {
    if (tickCounter.value % 4 == 0) {
      playAccent = true;
      update();
    } else {
      playAccent = false;
      update();
    }
  }

  void stop() {
    metronomeAfterStopBarState();
  }

  void playSound() {
    if (tickCounter.value < 192 && active == true) {
      tickSignal.value = !tickSignal.value;

      tickCounter.value++;

      update();
      playAccent == true
          ? audioService.playAccent()
          : audioService.playDownNote();
    } else {
      metronomeAfterLastBarState();
      playAccent == true
          ? audioService.playAccent()
          : audioService.playDownNote();
    }
  }
}
