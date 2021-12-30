import 'dart:async';

import 'package:get/get.dart';
import 'package:math_game/services/audio_sevice.dart';

class MetronomeModel extends GetxController {
  final audioService = Get.find<AudioService>();
  RxList<int> barBpmList = <int>[].obs;

  RxInt tempo = 120.obs;
  bool active = false;
  RxBool tickSignal = false.obs;
  RxInt tickCounter = 0.obs;
  RxInt activeBarIndex = 0.obs;

  MetronomeModel() {
    List.generate(48, (index) => barBpmList.add(120));
  }

  void updateBpmMap(int index, double endValue) {
    for (var i = 0; i < barBpmList.length - index; i++) {
      barBpmList[barBpmList.length - i - 1] = endValue.toInt();
    }

    update();
   // calculateActiveBar();
  }

  void calculateActiveBar() {
    if (tickCounter.value % 4 == 0 && activeBarIndex.value < 48) {
      activeBarIndex.value++;

      update();
    }else if(activeBarIndex.value > 47){
      activeBarIndex.value = -1;
      update();
      start();
    }
  }

  void start() {
    active = true;
    update();
    Timer(_getDuration(), () => _handleEvent());
  }

  void stop() {
    active = false;
    tickCounter.value = -1;
    audioService.beatCounter.value = -1;
    activeBarIndex.value = 0;
    update();
  }

  void _handleEvent() {
    //  calculateActiveBar(index);
    if (active || tickCounter.value != -1) {
      tempo.value = barBpmList[activeBarIndex.value];
update();
      Timer(_getDuration(), () => _handleEvent());

    }
    calculateActiveBar();
    playSound();
  }

  void playSound() {
    audioService.playerOneOnClickSound();
    tickSignal.value = !tickSignal.value;
    if(tickCounter < 192){
      tickCounter.value++;
      update();
    } else{ tickCounter.value = -1;
      audioService.beatCounter.value = -1;
      activeBarIndex.value = 1;
      update();}


  }

  Duration _getDuration() {
    //  print(tempo);
    final time = 60 / barBpmList[activeBarIndex.value];
    return Duration(
      seconds: time.toInt(),
      milliseconds: (time * 1000).toInt() % 1000,
      microseconds: (time * 1000000).toInt() % 1000,
    );
  }
}
