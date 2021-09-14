import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/pages/game_page.dart';
import 'package:math_game/pages/home_page.dart';
import 'package:math_game/services/screen_service.dart';

class WinPage extends StatelessWidget {
 final int  whoWin;
  final playerOneGameModel = Get.find<PlayerOneGameModel>();
  final screenService = Get.find<ScreenService>();

  WinPage({required this.whoWin}) {
    playerOneGameModel.playerOneWins.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
   children: [
     Positioned(
       top: 0,
       left: 0,
       child: Container(
         color: Colors.blue,
         width: screenService.screenWidth.value,
         height: screenService.screenHeightInPercentage.value * 15.0,
       ),
     ),
     Positioned(
       top: screenService.screenHeightInPercentage.value * 15.0,
       left: 0,
       child: Container(
         color: Colors.greenAccent,
         width: screenService.screenWidth.value,
         height:screenService.screenHeightInPercentage.value * 70.0,
         child: RotatedBox(
             quarterTurns: whoWin == 1 ? 1: 3 ,
             child: Image.asset("assets/winner_looser.jpg",
             fit: BoxFit.cover,)),
       ),
     ),
     Positioned(
       top: screenService.screenHeightInPercentage.value * 85.0,
       left: 0,
       child: Container(
         width: screenService.screenWidth.value,
         height: screenService.screenHeightInPercentage.value * 15.0,
         child: SizedBox(
         //  width: 250.0,
           child: Center(
             child: DefaultTextStyle(
               style: const TextStyle(
                 fontSize: 45,
                 color: Colors.white,
                 shadows: [
                   Shadow(
                     blurRadius: 10.0,
                     color: Colors.white,
                     offset: Offset(10, 0),
                   ),
                 ],
               ),
               child: AnimatedTextKit(
                 repeatForever: true,
                 animatedTexts: [
                   FlickerAnimatedText('PLAY'),
                   FlickerAnimatedText('AGAIN'),
                 ],
                 onTap: () {
                   Get.off(() => GamePage(
                   ));
                 },
               ),
             ),
           ),
         ),
       ),
     ),
      ],
    );
  }
}
