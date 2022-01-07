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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/sky.jpg"),fit: BoxFit.cover),
          ),
            width: _width,
            height: _height,
           ),
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
                                          //  blurRadius: 5.0,
                                         //   spreadRadius: 1.0,
                                            color: addictiveMetronomeModel
                                                        .beatStatusList[index]
                                                        .value ==
                                                    true
                                                ? Colors.amber
                                                : Colors.transparent,
                                          //  offset: Offset.fromDirection(11.0, 5.0)
                                        )
                                      ],

                                      border: Border.all(
                                          width: 10,
                                          color: Colors.amber),

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
                                        ? Colors.amber
                                        : Colors.transparent,
                                    border: Border.all(color: Colors.amber,width: 5.0),
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
                    child: Text("ON/OFF",style: _textStyle,),
                  ),
// horizontal picker
                  bpmPicker(_width, _height),

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

  Widget bpmPicker(double width, double height) {
    return GetBuilder(
        init: AddictiveMetronomeModel(),
        builder: (v) => SizedBox(
              width: width / 3,
              height: height / 3,
              child: HorizontalPicker(
                initialPosition: InitialPosition.center,
                  minValue: 40,
                  maxValue: 240,
                  divisions: 40,
                  height: 10.0,
                  showCursor: false,

                  backgroundColor: Colors.transparent,
                  activeItemTextColor: Colors.white,
                  passiveItemsTextColor: Colors.amber,
                  onChanged: (newTempo) => addictiveMetronomeModel
                      .updateTempoInBpm(newTempo.toInt())),
            ));
  }
}
