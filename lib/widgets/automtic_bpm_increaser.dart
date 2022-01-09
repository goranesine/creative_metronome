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
        () => Container(
          height: widget._height / 3,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 10, color: Colors.amber),
              borderRadius: BorderRadiusGeometry.lerp(
                  BorderRadius.circular(10), BorderRadius.circular(10), 100.0)),
          width:
              (widget._width / addictiveMetronomeModel.beatStatusList.length -
                      16) *
                  2,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    //  width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "    INCREASE EVERY                          BPM",
                          textAlign: TextAlign.center,
                        ),
                      )),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 130,
                        height: 100,
                        child: Center(
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
                        )),

                    VerticalDivider(thickness: 5.0,
                      color: Colors.amber,),
                    SizedBox(
                        width: 130,
                        height: 100,
                        child: Center(
                          child: NumberPicker(
                            //   itemHeight: 100.0,
                              selectedTextStyle: _textStyle,
                              itemCount: 1,
                              step: 5,
                              minValue: 40,
                              maxValue: 300,
                              value: _bpm,
                              onChanged: (newValue) {
                                setState(() {
                                  _bpm = newValue;
                                });
                              }),
                        )),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                     // width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "                   BARS                                SPEED",
                          textAlign: TextAlign.center,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
