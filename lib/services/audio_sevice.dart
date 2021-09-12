import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
class AudioService extends GetxController{
 final  player = AudioCache();
 // AudioPlayer advancedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
//  String? localFilePath;
 // String? localAudioCacheURI;

AudioService(){
     player.loadAll(['background_music.mp3']).then((value) => play(),);


}

  void play()async{
 // await  player.loadAll(['assets/background_music.mp3']);

   //  await player.play('background_music.mp3');

  }
@override
  void dispose() {
    player.clearAll();
    super.dispose();
  }
}