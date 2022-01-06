import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math_game/models/addictive_metronome_model.dart';
import 'package:math_game/widgets/step_sequencer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
                Container(
                  width: _width,
                  height: _height / 2,
                  child: GetBuilder(
                    init: AddictiveMetronomeModel(),
                    builder: (value) => ListView.builder(
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
                                      color: addictiveMetronomeModel
                                                  .beatCounter.value ==
                                              index
                                          ? Colors.grey
                                          : Colors.transparent,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: addictiveMetronomeModel
                                                        .beatStatusList[index]
                                                        .value ==
                                                    true &&
                                                addictiveMetronomeModel
                                                        .beatCounter.value ==
                                                    index
                                            ? AssetImage(
                                                "assets/greenBlock.png")
                                            : AssetImage("assets/redBlock.png"),
                                      ),
                                      border: Border.all(color: Colors.white54),
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
                                        ? Colors.grey
                                        : Colors.transparent,
                                    border: Border.all(color: Colors.white54),
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
              color: Colors.grey,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => addictiveMetronomeModel.switchOnOff(),
                      child: Text("ON/OFF")),
                  SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      infoProperties: InfoProperties(
                          modifier: percentageModifier,
                          bottomLabelText: "BPM",
                          mainLabelStyle: TextStyle(color: Colors.redAccent)),
                    ),
                    min: 40,
                    max: 240,
                    initialValue:
                        addictiveMetronomeModel.tempoInBpm.value.toDouble(),
                    onChangeEnd: (double endValue) {
                      addictiveMetronomeModel
                          .updateTempoInBpm(endValue.toInt());
                    },
                  ),
                  ElevatedButton(
                      onPressed: () => addictiveMetronomeModel.removeBeat(),
                      child: Text("-")),
                  ElevatedButton(
                      onPressed: () => addictiveMetronomeModel.addBeat(),
                      child: Text("+")),
                ],
              ),
            ),
          ],
        ),

        //  FloatingActionButton(onPressed:()=> addictiveMetronomeModel.switchOnOff(), child: Text("Switch on/off")),
      ],
    );
  }
}
