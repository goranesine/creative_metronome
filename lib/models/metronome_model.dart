import 'dart:async';


import 'package:get/get.dart';
import 'package:math_game/services/audio_sevice.dart';

class MetronomeModel extends GetxController{
  final audioService = Get.find<AudioService>();

  RxDouble tempo = 0.5.obs;
  bool active = false;
  RxBool tickSignal = false.obs;
RxInt tickCounter = 0.obs;
//  MetronomeModel(){start();}

  void start() {
    active = true;

    Timer(_getDuration(), _handleEvent);
  }

  void stop() {

    active = false;
    tickCounter.value = -1;
    audioService.beatCounter.value = -1;
    update();
  }

  void _handleEvent() {
    if (active || tickCounter.value != -1) {
      Timer(_getDuration(), _handleEvent);
    }
audioService.playerOneOnClickSound();
tickSignal.value = !tickSignal.value;
tickCounter < 12 ?  tickCounter.value++ : tickCounter.value = 1;
update();

  }

  Duration _getDuration() {
  //  print(tempo);
    final time = 60 / (tempo*240);
    return Duration(
      seconds: time.toInt(),
      milliseconds: (time * 1000).toInt() % 1000,
      microseconds: (time * 1000000).toInt() % 1000,
    );
  }
}