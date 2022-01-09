import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:math_game/models/addictive_metronome_model.dart';

Widget bpmPicker(double width, double height) {
  final addictiveMetronomeModel = Get.find<AddictiveMetronomeModel>();

  return GetBuilder(
      init: AddictiveMetronomeModel(),
      builder: (v) => SizedBox(
        width: width / 3,
        height: height / 3,
        child: HorizontalPicker(
            initialPosition: InitialPosition.center,
            minValue: 40,
            maxValue: 300,
            divisions: 52,
            height: 10.0,
            showCursor: false,
            backgroundColor: Colors.transparent,
            activeItemTextColor: Colors.white,
            passiveItemsTextColor: Colors.amber,
            onChanged: (newTempo) => addictiveMetronomeModel
                .updateTempoInBpm(newTempo.toInt())),
      ));
}