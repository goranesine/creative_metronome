import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/pages/home_page.dart';
import 'package:math_game/services/audio_sevice.dart';
import 'package:math_game/services/screen_service.dart';

import 'models/player_two_game_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AudioService());
  Get.put(PlayerOneGameModel());
  Get.put(PlayerTwoGameModel());
  Get.put(ScreenService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      title: 'Color game',
      theme: ThemeData.dark(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
