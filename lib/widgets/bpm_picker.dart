import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/models/addictive_metronome_model.dart';
import 'package:math_game/widgets/horizontal_picker.dart';

Widget bpmPicker(double width, double height) {
  final addictiveMetronomeModel = Get.find<AddictiveMetronomeModel>();

  return SizedBox(
        width: width / 3,
        height: height / 3,
        child: HorizontalPicker(
          initialValue: 120,
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
      );
}