import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/models/player_one_game_model.dart';
import 'package:math_game/widgets/brick.dart';
import 'package:math_game/widgets/playerOneBoard.dart';

class GamePage extends StatelessWidget {
//final  playerOneGameModel = Get.find<PlayerOneGameModel>();

  final itemWidth = 50;
  final itemHeight = 50;

  @override
  Widget build(BuildContext context) {
    int listLength = 5;
    return GridView.builder(
      padding: EdgeInsetsGeometry.lerp(EdgeInsets.zero, EdgeInsets.zero, 0.0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: itemWidth / itemHeight,
        crossAxisCount: listLength,
      ),
      itemBuilder: _buildGridItems,
      itemCount: listLength * listLength,
    );
  }
}

Widget _buildGridItems(BuildContext context, int index) {
  final playerOneGameModel = Get.find<PlayerOneGameModel>();

  int gridStateLength = 5;
  int x, y = 0;
  x = (index / gridStateLength).floor();
  y = (index % gridStateLength);
  return Container(
    decoration:
        BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
    child: Center(

            child: GetBuilder<PlayerOneGameModel>(
              init: PlayerOneGameModel(),
              builder: (_)=>
               Opacity(
                    opacity:
                    _.listColors[index][0] == "#FFFFFF"  ? 0.0 : 1.0,
                    child:  Brick(
          backColor: playerOneGameModel.listColors[index][0],
          index: index,
          row: y,
        )),
            ),

    ),
  );
}