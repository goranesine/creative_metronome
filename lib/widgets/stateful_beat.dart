import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/models/addictive_metronome_model.dart';

class StateFulBeat extends StatefulWidget {
  final double _width;
  final int index;

  const StateFulBeat(this._width,  this.index);

  @override
  State<StatefulWidget> createState() => _StateFulBeat();
}

class _StateFulBeat extends State<StateFulBeat> {
  final addictiveMetronomeModel = Get.find<AddictiveMetronomeModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPressDown: (v) =>
            addictiveMetronomeModel.setBeatAccent(widget.index),
        child: Obx(
          () => Container(
            decoration: BoxDecoration(
                color: addictiveMetronomeModel
                            .beatStatusList[widget.index].value ==
                        true
                    ? Colors.amber
                    : Colors.transparent,
                border: Border.all(width: 10, color: Colors.amber),
                borderRadius: BorderRadiusGeometry.lerp(
                    BorderRadius.circular(10),
                    BorderRadius.circular(10),
                    100.0)),
            width:
                widget._width / addictiveMetronomeModel.beatStatusList.length -
                    16,
          ),
        ),
      ),
    );
  }
}
