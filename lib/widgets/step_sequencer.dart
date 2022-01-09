import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/models/addictive_metronome_model.dart';

class StepSequencer extends StatefulWidget {
  final int index;
  final double _width;

  StepSequencer(this.index, this._width);

  @override
  State<StepSequencer> createState() => _StepSequencerPageState();
}

class _StepSequencerPageState extends State<StepSequencer> {
  Color _currentColor = Colors.transparent;
  late Color _newColor;
  final addictiveMetronomeModel = Get.find<AddictiveMetronomeModel>();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
        Obx(()=>
          Container(
              decoration: BoxDecoration(
                  color: addictiveMetronomeModel.beatCounter.value == widget.index
                  ? Colors.amber
                  :Colors.transparent,
                  border: Border.all(color: Colors.amber, width: 5.0),
                  borderRadius: BorderRadiusGeometry.lerp(
                      BorderRadius.circular(10), BorderRadius.circular(10), 100.0)),
              width: widget._width / addictiveMetronomeModel.listLength.value - 16,
              //    height: _height/10,
            ),
        ),


    );
  }
}
