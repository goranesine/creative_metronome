import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_game/models/player_one_game_model.dart';

class Brick extends StatefulWidget {
  final String backColor;
  final int index;

  final int row;
  const Brick(
      {required this.backColor, required this.index, required this.row});

  @override
  State<StatefulWidget> createState() => _BrickState();
}

class _BrickState extends State<Brick> {
  final playerOneGameModel = Get.find<PlayerOneGameModel>();

  @override
  Widget build(BuildContext context) {


    //  String _isTapped = playerOneGameModel.listColors[widget.index][1];
    // bool isTapped = _isTapped == "false" ? false : true;
    // TODO: implement build
    return GestureDetector(
      onTap: ()=> playerOneGameModel.listColors2[widget.index][1] == "false"?
          playerOneGameModel.onTap(widget.index) : null,
      child: Container(
        color: playerOneGameModel.listColors2[widget.index][2] == "false" ? HexColor(widget.backColor) : Colors.white ,
      ),
    );
  }
}
