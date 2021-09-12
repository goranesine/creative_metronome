import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/pages/home_page.dart';
import 'package:math_game/services/audio_sevice.dart';

import 'models/player_two_game_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AudioService());
  Get.put(PlayerOneGameModel());
  Get.put(PlayerTwoGameModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      title: 'Math game',
      theme: ThemeData.dark(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
