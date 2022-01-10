import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math_game/models/addictive_metronome_model.dart';
import 'package:math_game/widgets/automtic_bpm_increaser.dart';
import 'package:math_game/widgets/bpm_picker.dart';
import 'package:math_game/widgets/stateful_beat.dart';
import 'package:math_game/widgets/step_sequencer.dart';

class AddictiveMetronomePage extends StatelessWidget {
  final addictiveMetronomeModel = Get.find<AddictiveMetronomeModel>();
  final _textStyle = TextStyle(
    color: Colors.amber,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    String percentageModifier(double value) {
      final roundedValue = value.toInt().toString();
      return '$roundedValue';
    }

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
bool isMetronomeOnAutomatic = true;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/sky.jpg"), fit: BoxFit.cover),
          ),
          width: _width,
          height: _height,
        ),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: _width,
                  height: _height / 2,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: addictiveMetronomeModel.listLength.value,
                      itemBuilder: (BuildContext context, index) =>
                          StateFulBeat(_width, index),
                    ),
                  ),
                )
              ],
            ),

            // step lights

            Row(
              children: [
                SizedBox(
                  height: _height / 10,
                  width: _width,
                  child: Obx(()=> ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              addictiveMetronomeModel.listLength.value,
                          itemBuilder: (BuildContext context, index) =>
                      StepSequencer(
                          index,_width,
                         )),
                  ),

                ),
              ],
            ),
            Divider(
              thickness: 5.0,
              height: 10.0,
              color: Colors.amber,
            ),

            // control panel
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // on/off
                  GestureDetector(
                    onTap: () => addictiveMetronomeModel.switchOnOff(),
                    child: Text(
                      "ON/OFF",
                      style: _textStyle,
                    ),
                  ),
// horizontal picker
                 isMetronomeOnAutomatic == false
                  ? AutomaticBpmIncreaser(_width,_height) : bpmPicker(_width, _height),

                  // remove ber
                  GestureDetector(
                    onTap: () => addictiveMetronomeModel.removeBeat(),
                    child: Icon(
                      Icons.remove_circle,
                      color: Colors.amber,
                      size: 50.0,
                    ),
                  ),
                  // add ber

                  GestureDetector(
                    onTap: () => addictiveMetronomeModel.addBeat(),
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.amber,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
            ),

            Divider(
              thickness: 5.0,
              height: 0.0,
              color: Colors.amber,
            ),
          ],
        ),

        //  FloatingActionButton(onPressed:()=> addictiveMetronomeModel.switchOnOff(), child: Text("Switch on/off")),
      ],
    );
  }


}
