import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:math_game/models/player_one_game_model.dart';

class Brick extends StatefulWidget {
  final String backColor;
  final int column;

  final int row;

  const Brick(
      {required this.backColor, required this.column, required this.row});

  @override
  State<StatefulWidget> createState() => _BrickState();
}

class _BrickState extends State<Brick> {
  final playerOneGameModel = Get.find<PlayerOneGameModel>();

  bool canChangeColor = true;
  final Color frontColor = Colors.redAccent;
  bool isTapped = false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => setState(() {
        if (canChangeColor == true) {
          isTapped == false ? isTapped = true : isTapped = false;
          canChangeColor = false;
          playerOneGameModel.numberOffTappedTimes;
        } else {}
      }),
      child: Container(
        color: isTapped == true ? HexColor(widget.backColor) : frontColor,
      ),
    );
  }
}
