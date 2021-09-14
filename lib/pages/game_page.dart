import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/models/player_two_game_model.dart';
import 'package:math_game/services/screen_service.dart';
import 'package:math_game/widgets/playerOneBoard.dart';
import 'package:math_game/pages/win_page.dart';
import 'package:math_game/widgets/playerTwoBoard.dart';

class GamePage extends StatelessWidget {
  final playerOneGameModel = Get.find<PlayerOneGameModel>();
  final playerTwoGameModel = Get.find<PlayerTwoGameModel>();
  final screenService = Get.find<ScreenService>();

  GamePage() {
    playerOneGameModel.addListener(() {
      playerOneGameModel.playerOneWins.value == true
          ? Get.off(() => WinPage(
                whoWin: 1,
              ))
          : null;
    });

    playerTwoGameModel.addListener(() {
      playerTwoGameModel.playerTwoWins.value == true
          ? Get.off(() => WinPage(
                whoWin: 2,
              ))
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = screenService.screenWidth.value;
    double _height = screenService.screenHeight.value;
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: _height / 70),
            child: PlayerOneBoard()),
        Padding(
            padding: EdgeInsets.only(top: _height / 30),
            child: middleBar(_width, _height)),
        Padding(
            padding: EdgeInsets.only(top: _height / 30),
            child: PlayerTwoBoard()),
      ],
    );
  }

  Widget middleBar(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder(
          init: playerTwoGameModel,
          builder: (_) => Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(20.0, 30.0)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.orangeAccent.withRed(90),
                      offset: Offset(5.0, 5.0),
                    )
                  ],
                  color: playerTwoGameModel.currentTappedColor.value == "0"
                      ? Colors.greenAccent
                      : HexColor(playerTwoGameModel.currentTappedColor.value)),
              width: width / 3,
              height: height / 20,
            ),
          ),
        ),
        GetBuilder(
          init: playerOneGameModel,
          builder: (_) => Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(20.0, 30.0)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.orangeAccent.withRed(90),
                      offset: Offset(5.0, 5.0),
                    )
                  ],
                  color: playerOneGameModel.currentTappedColor.value == "0"
                      ? Colors.greenAccent
                      : HexColor(playerOneGameModel.currentTappedColor.value)),
              width: width / 3,
              height: height / 20,
            ),
          ),
        ),
      ],
    );
  }
}
