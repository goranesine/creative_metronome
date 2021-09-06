import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/widgets/brick.dart';


class PlayerOneBoard extends StatelessWidget {
//final  playerOneGameModel = Get.find<PlayerOneGameModel>();

  final itemWidth = 30;
  final itemHeight = 25;

  @override
  Widget build(BuildContext context) {
    int listLength = 6;
    return GridView.builder(
     // padding: EdgeInsetsGeometry.lerp(EdgeInsets.zero, EdgeInsets.zero, 5.0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: itemWidth / itemHeight,
        crossAxisCount: listLength,

      ),
      itemBuilder:  _buildGridItems,
      itemCount: listLength * listLength,
    ) ;
  }
}

Widget _buildGridItems(BuildContext context, int index) {
  final String frontColor = "#ff0000";
  int gridStateLength = 6;
  int x, y = 0;
  x = (index / gridStateLength).floor();
  y = (index % gridStateLength);
  return Container(
//    decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
    child: Center(
      child: GetBuilder<PlayerOneGameModel>(
        init: PlayerOneGameModel(),
        builder: (_) => Brick(
          backColor: _.listOffColorsAndBool[index][1] == "false"
              ? frontColor
              : _.listOffColorsAndBool[index][0],
          index: index,
          row: y,
        ),
      ),
    ),
  );
}
