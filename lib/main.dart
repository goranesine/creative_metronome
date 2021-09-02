import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/pages/home_page.dart';
import 'package:math_game/widgets/playerOneBoard.dart';


void main() {
  Get.put(PlayerOneGameModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return GetMaterialApp(
      title: 'Math game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}