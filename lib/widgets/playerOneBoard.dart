import 'package:fbutton_nullsafety/fbutton_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/models/player_two_game_model.dart';
import 'package:math_game/services/screen_service.dart';
import 'package:fcontrol_nullsafety/fdefine.dart';

class PlayerOneBoard extends StatelessWidget {
  final playerOneGameModel = Get.find<PlayerOneGameModel>();
  final playerTwoGameModel = Get.find<PlayerTwoGameModel>();
  final screenService = Get.find<ScreenService>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GetBuilder(
            init: playerTwoGameModel,
            builder: (_) => AnimatedContainer(
              curve: Curves.bounceInOut,
              duration: Duration(milliseconds: 500),
              width: playerTwoGameModel.freezPlayerOne.value == true
                  ? 0
                  : screenService.screenWidth.value,
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10.0),
                itemCount: 30,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: brick,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget brick(BuildContext context, int index) {
    FLightOrientation lightOrientation = FLightOrientation.RightBottom;
    Color mainShadowColor = Colors.black;
    String mainBackgroundColor = "#FF0000";

    return GetBuilder(
        init: playerOneGameModel,
        builder: (_) => playerOneGameModel.listOffColorsAndBool[index][2] ==
                "false"
            ? FButton(
                surfaceStyle: FSurface.Concave,
                corner: FCorner.all(10.0),
                isSupportNeumorphism: true,
                lightOrientation: lightOrientation,
                onPressed: () {
                  playerOneGameModel.listOffColorsAndBool[index][1] == "false"
                      ? playerOneGameModel.onTap(index)
                      : null;
                },
                highlightShadowColor: Colors.white,
                clickEffect: true,
                color:
                    playerOneGameModel.listOffColorsAndBool[index][1] == "true"
                        ? HexColor(
                            playerOneGameModel.listOffColorsAndBool[index][0])
                        : HexColor(mainBackgroundColor),
                shadowColor: mainShadowColor,
                strokeColor: HexColor(mainBackgroundColor),
                strokeWidth:
                    playerOneGameModel.listOffColorsAndBool[index][2] == "true"
                        ? 0.0
                        : 1.0,
              )
            : FButton(
                // surfaceStyle: FSurface.Concave,
                image:
                    playerOneGameModel.listOffColorsAndBool[index][2] == "true"
                        ? Container(
                            child: Icon(
                              Icons.grid_4x4_outlined,
                              size: 55.0,
                              color: Colors.black.withRed(70),
                            ),
                            color: Colors.black)
                        : null,
                corner: FCorner.all(10.0),
                isSupportNeumorphism: true,
                lightOrientation: lightOrientation,

                highlightShadowColor: Colors.white,

                shadowColor: mainShadowColor,
                strokeColor: HexColor(mainBackgroundColor),
                strokeWidth: 0.0,
              ));
  }
}
