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
    audioService.playOrderPlayerOne.value = true;
    update();
  }

  void _handleEvent() {
audioService.playerOneOnClickSound();
tickSignal.value = !tickSignal.value;
tickCounter < 64 ?  tickCounter.value++ : tickCounter.value = 1;
update();
    if (active) {
      Timer(_getDuration(), _handleEvent);
    }
  }

  Duration _getDuration() {
    final time = 60 / (tempo*240);
    return Duration(
      seconds: time.toInt(),
      milliseconds: (time * 1000).toInt() % 1000,
      microseconds: (time * 1000000).toInt() % 1000,
    );
  }
}