import 'dart:async';

import 'package:get/get.dart';
import 'package:math_game/services/audio_sevice.dart';

class MetronomeModel extends GetxController {
  final audioService = Get.find<AudioService>();
  RxList<int> barBpmList = <int>[].obs;

  RxInt tempo = 120.obs;
  bool active = false;
  RxBool tickSignal = false.obs;
  RxInt tickCounter = 187.obs;
  RxInt activeBarIndex = 47.obs;

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
    if (tickCounter.value % 4 == 0 && activeBarIndex.value < 48 && tickCounter.value >3) {
      activeBarIndex.value++;

      update();
    }else if(activeBarIndex.value > 48){
      activeBarIndex.value = 1;
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
    tickCounter.value = 0;
    audioService.beatCounter.value = 0;
    activeBarIndex.value = 1;
    update();
  }

  void _handleEvent() {
    //  calculateActiveBar(index);
    if (active || tickCounter.value != 0) {
      tempo.value = barBpmList[activeBarIndex.value-1];
update();
      Timer(_getDuration(), () => _handleEvent());

    }
    calculateActiveBar();
    playSound();
  }

  void playSound() {
    tickSignal.value = !tickSignal.value;
    if(tickCounter.value < 192 && active == true){
      tickCounter.value++;

      update();
    } else{ tickCounter.value = 1;
      audioService.beatCounter.value = 1;
      activeBarIndex.value = 1;
      tickCounter.value = 0;
      update();}
   active == true ? audioService.playerOneOnClickSound() : active = true;


  }


  Duration _getDuration() {
    //  print(tempo);
    final time = 60 / barBpmList[activeBarIndex.value-1];
    return Duration(
      seconds: time.toInt(),
      milliseconds: (time * 1000).toInt() % 1000,
      microseconds: (time * 1000000).toInt() % 1000,
    );
  }
}
