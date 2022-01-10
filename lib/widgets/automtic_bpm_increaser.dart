import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:math_game/models/addictive_metronome_model.dart';

class AutomaticBpmIncreaser extends StatefulWidget {
  final double _width;
  final double _height;

  const AutomaticBpmIncreaser(this._width, this._height);

  @override
  State<StatefulWidget> createState() => _StateFulBeat();
}

class _StateFulBeat extends State<AutomaticBpmIncreaser> {
  final addictiveMetronomeModel = Get.find<AddictiveMetronomeModel>();
  int _currentIncreamentPoint = 4;
  int _bpm = 140;
  final _textStyle = TextStyle(
    color: Colors.amber,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () =>  SizedBox(
          width: widget._width / 3,
          height: widget._height / 3,
          child: NumberPicker(
                  //   itemHeight: 100.0,
                    selectedTextStyle: _textStyle,
                    itemCount: 1,
                    step: 1,
                    minValue: 1,
                    maxValue: 10,
                    value: _currentIncreamentPoint,
                    onChanged: (newValue) {
                      setState(() {
                        _currentIncreamentPoint = newValue;
                      });
                    }),
        ),

        ),
      );
  }
}
