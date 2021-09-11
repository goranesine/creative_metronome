import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/pages/game_page.dart';
import 'package:math_game/pages/home_page.dart';

class WinPage extends StatelessWidget{
  final String whoWin;
  final playerOneGameModel = Get.find<PlayerOneGameModel>();

   WinPage({required this.whoWin}){
     playerOneGameModel.playerOneWins.value = false;
   }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [Center(
          child: Text("Winner is : $whoWin"),

        ),
        ElevatedButton(onPressed:()=> Get.off(()=> HomePage()), child: Text("Play again?"))],

    );
  }

}
