import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:math_game/models/addictive_metronome_model.dart';
import 'package:math_game/widgets/step_sequencer.dart';

class AddictiveMetronomePage extends StatelessWidget {
  final addictiveMetronomeModel = Get.find<AddictiveMetronomeModel>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

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
                    builder:(value)=> ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: addictiveMetronomeModel.beatStatusList.length,
                        itemBuilder: (BuildContext context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white54),
                            ),
                            width: _width/addictiveMetronomeModel.beatStatusList.length - 16,
                                child: Text(addictiveMetronomeModel.beatStatusList[index].toString()),
                              ),
                        )),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed:()=> addictiveMetronomeModel.switchOnOff(), child: Text("ON/OFF")),
                ElevatedButton(onPressed:()=> addictiveMetronomeModel.addBeat(), child: Text("+")),
                ElevatedButton(onPressed:()=> addictiveMetronomeModel.removeBeat(), child: Text("-")),
              ],
            )
          ],
        ),

        //  FloatingActionButton(onPressed:()=> addictiveMetronomeModel.switchOnOff(), child: Text("Switch on/off")),
      ],
    );
  }
}
