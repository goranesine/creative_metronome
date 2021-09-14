import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
class AudioService extends GetxController{
 final  player = AudioCache();
 // AudioPlayer advancedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
//  String? localFilePath;
 // String? localAudioCacheURI;

AudioService(){
     player.loadAll(["bravo.wav","odlicno.wav"]);

play();
}

  void play()async{
 player.play('bravo.wav');

   //  await player.play('background_music.mp3');

  }
@override
  void dispose() {
    player.clearAll();
    super.dispose();
  }
}