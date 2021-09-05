import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/widgets/playerOneBoard.dart';
import 'package:math_game/pages/win_page.dart';

class GamePage extends StatelessWidget {
  final playerOneGameModel = Get.find<PlayerOneGameModel>();

  GamePage() {
    playerOneGameModel.addListener(() {
      playerOneGameModel.playerOneWins.value == true
          ? Get.off(()=>WinPage(
              whoWin: "Player One",
            ))
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
             PlayerOneBoard(),
        ElevatedButton(onPressed:
        ()=>playerOneGameModel.endGame(), child: Text("end game")),

      ],
    );
  }
}
