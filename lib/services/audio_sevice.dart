import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioService extends GetxController {
  final player = AudioCache();

  // AudioPlayer advancedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
//  String? localFilePath;
  // String? localAudioCacheURI;
  final List<String> positiveAnswerSounds = [
    "bravo.wav",
    "odlicno.wav",
    "prva_liga.wav",
    "svaka_cast.wav",
    "vau.wav"
  ];
  final List<String> negativeAnswerSounds = [
    "a.wav",
    "joj.wav",
    "lose.wav",
    "m_ne.wav",
    "ne_tako.wav",
    "slabo.wav"
  ];

  AudioService() {
    player.loadAll([]);
  }

  void playPositiveMatchedColors() async {
    player.play(positiveAnswerSounds.first);
    positiveAnswerSounds.shuffle();
  }
  void playNegativeMatchedColors() async {
    player.play(negativeAnswerSounds.first);
    negativeAnswerSounds.shuffle();
  }

  @override
  void dispose() {
    player.clearAll();
    super.dispose();
  }
}
