import 'package:fbutton_nullsafety/fbutton_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/widgets/brick.dart';
import 'package:fcontrol_nullsafety/fdefine.dart';

class PlayerOneBoard extends StatelessWidget {
  final playerOneGameModel = Get.find<PlayerOneGameModel>();

  @override
  Widget build(BuildContext context) {
    //  String _isTapped = playerOneGameModel.listColors[widget.index][1];
    // bool isTapped = _isTapped == "false" ? false : true;
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            //  height: 400,
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
        ],
      ),
    );
  }

  Widget brick(BuildContext context, int index) {
    FLightOrientation lightOrientation = FLightOrientation.RightBottom;
    Color mainShadowColor = Colors.black;
    String mainBackgroundColor = "#FF0000";

    bool _isTapped = false;

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
                width: 190,
                height: 60,
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
