import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math_game/models/addictive_metronome_model.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:neon/neon.dart';

class AddictiveMetronomePage extends StatelessWidget {
  final addictiveMetronomeModel = Get.find<AddictiveMetronomeModel>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    String percentageModifier(double value) {
      final roundedValue = value.toInt().toString();
      return '$roundedValue';
    }

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                GetBuilder(
                  init: AddictiveMetronomeModel(),
                  builder: (value) => Container(
                    width: _width,
                    height: _height / 2,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            addictiveMetronomeModel.beatStatusList.length,
                        itemBuilder: (BuildContext context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onLongPressDown: (v) => addictiveMetronomeModel
                                    .setBeatAccent(index),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 10.0,
                                            spreadRadius: 8.0,
                                            color: addictiveMetronomeModel
                                                        .beatStatusList[index]
                                                        .value ==
                                                    true
                                                ? Colors.amberAccent
                                                : ThemeData.dark().canvasColor,
                                            offset:
                                                Offset.fromDirection(11.0, 5.0))
                                      ],

                                      border: Border.all(color: Colors.amberAccent),

                                      borderRadius: BorderRadiusGeometry.lerp(
                                          BorderRadius.circular(10),
                                          BorderRadius.circular(10),
                                          100.0)),
                                  width: _width /
                                          addictiveMetronomeModel
                                              .beatStatusList.length -
                                      16,
                                ),
                              ),
                            )),
                  ),
                )
              ],
            ),

            // step lights

            Row(
              children: [
                Container(
                  height: _height / 10,
                  width: _width,
                  child: GetBuilder(
                    init: AddictiveMetronomeModel(),
                    builder: (value) => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            addictiveMetronomeModel.beatStatusList.length,
                        itemBuilder: (BuildContext context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: addictiveMetronomeModel
                                                .beatCounter.value ==
                                            index
                                        ? Colors.amberAccent
                                        : Colors.transparent,
                                    border: Border.all(color: Colors.amber),
                                    borderRadius: BorderRadiusGeometry.lerp(
                                        BorderRadius.circular(10),
                                        BorderRadius.circular(10),
                                        100.0)),
                                width: _width /
                                        addictiveMetronomeModel
                                            .beatStatusList.length -
                                    16,
                                //    height: _height/10,
                              ),
                            )),
                  ),
                ),
              ],
            ),
            Divider(
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
                  Container(
                    height: _height / 5,
                    child: GestureDetector(
                      onTap: () => addictiveMetronomeModel.switchOnOff(),
                      child: Neon(
                        //   glowing: true,
                        text: "ON/OFF",
                        font: NeonFont.Monoton,
                        color: Colors.amber,
                      ),
                    ),
                  ),
// horizontal picker
                  bpmPicker(_width, _height),

                  // remove ber
                  GestureDetector(
                    onTap: () => addictiveMetronomeModel.removeBeat(),
                    child: Neon(
                      fontSize: 60,
                      //    glowing: true,
                      text: "-",
                      font: NeonFont.Monoton,
                      color: Colors.amber,
                    ),
                  ),
                  // add ber

                  GestureDetector(
                    onTap: () => addictiveMetronomeModel.addBeat(),
                    child: Neon(
                      fontSize: 60,
                      //  glowing: true,
                      text: "+",
                      font: NeonFont.Monoton,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        //  FloatingActionButton(onPressed:()=> addictiveMetronomeModel.switchOnOff(), child: Text("Switch on/off")),
      ],
    );
  }

  Widget bpmPicker(double width, double height) {
    return GetBuilder(
        init: AddictiveMetronomeModel(),
        builder: (v) => SizedBox(
              width: width / 3,
              height: height / 3,
              child: HorizontalPicker(
                  minValue: 40,
                  maxValue: 240,
                  divisions: 40,
                  height: 50.0,
                  showCursor: false,
                  backgroundColor: Colors.transparent,
                  activeItemTextColor: Colors.white,
                  passiveItemsTextColor: Colors.amber,
                  onChanged: (newTempo) => addictiveMetronomeModel
                      .updateTempoInBpm(newTempo.toInt())),
            ));
  }
}
