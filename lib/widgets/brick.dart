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
double _opacity = 1.0;
  bool canChangeColor = true;
  final Color frontColor = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    _opacity = playerOneGameModel.listColors[widget.index][0] == "#FFFFFF" ? 0.0 : 1.0;

    //  String _isTapped = playerOneGameModel.listColors[widget.index][1];
    // bool isTapped = _isTapped == "false" ? false : true;
    // TODO: implement build
    return

      GestureDetector(
        onTap: () => setState(() {
          if (canChangeColor == true) {
            String _isTapped = playerOneGameModel.listColors[widget.index][1];
            bool isTapped = _isTapped == "false" ? false : true;
            if (isTapped == false) {
              playerOneGameModel.listColors[widget.index][1] = "true";
              canChangeColor = false;
              playerOneGameModel.increaseNumberOffTappedTimes(widget.index, 0);
            }
          } else {
        }
        }),
        child:

           Container(
              color:
                  canChangeColor == false ? HexColor(widget.backColor) : frontColor,



          ),
    );
  }
}
