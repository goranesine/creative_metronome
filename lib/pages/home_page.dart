import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/services/screen_service.dart';

import 'game_page.dart';

class HomePage extends StatelessWidget {
  final playerOneGameModel = Get.find<PlayerOneGameModel>();
  final screenService = Get.find<ScreenService>();

  final Gradient _gradient =
      LinearGradient(colors: [Colors.redAccent, Colors.deepOrange]);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    screenService.storeScreenDimension(_width, _height);
    return Container(
      width: _width,
        height: _height,
        decoration: BoxDecoration(gradient: _gradient),
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: () => playerOneGameModel.endGame(),
                child: Text("end game")),
            backgroundColor: Colors.transparent,
            body: GamePage()));
  }
}
