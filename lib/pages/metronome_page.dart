import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math_game/models/metronome_model.dart';
import 'package:math_game/services/audio_sevice.dart';
import 'package:math_game/widgets/custom_delegate.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CreativeMetronomePage extends StatefulWidget {
  @override
  State<CreativeMetronomePage> createState() => _CreativeMetronomePageState();
}

class _CreativeMetronomePageState extends State<CreativeMetronomePage> {
  final metronomeModel = Get.find<MetronomeModel>();
  final audioService = Get.find<AudioService>();

  double sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        GridView.builder(
          itemCount: 48,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisSpacing: 3.0,
            crossAxisCount: 4,
            height: height / 12,
          ),
          itemBuilder: (context, index) {
            return barCard(index + 1);
          },
        ),
      ],
    );
  }

  Widget barCard(int index) {
    String percentageModifier(double value) {
      final roundedValue = value.toInt().toString();
      return '$roundedValue';
    }

    return InkWell(
        onDoubleTap: () => metronomeModel.active
            ? metronomeModel.stop()
            : metronomeModel.start(),
        onTap: () => Get.defaultDialog(
              title: "Adjust BPM",
              content: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  infoProperties: InfoProperties(
                      modifier: percentageModifier,
                      bottomLabelText: "BPM",
                      mainLabelStyle: TextStyle(color: Colors.redAccent)),
                ),
                min: 40,
                max: 240,
                initialValue: metronomeModel.barBpmList[index - 1].toDouble(),
                onChangeEnd: (double endValue) {
                  metronomeModel.updateBpmMap(index - 1, endValue);
                },
              ),
            ),
        child: GetBuilder(
            init: MetronomeModel(),
            builder: (value) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: metronomeModel.tickSignal.value == true &&
                            metronomeModel.activeBarIndex.value == index
                        ? AssetImage("assets/greenBlock.png")
                        : AssetImage("assets/redBlock.png"),
                  ),
                ),
                child: Center(
                  child: Text(
                      index != 1
                      ? metronomeModel.barBpmList[index-1] == metronomeModel.barBpmList[index-2]
                   ?   ""
                   : metronomeModel.barBpmList[index-1].toString():metronomeModel.barBpmList[index-1].toString(),
                    style: TextStyle(
                      color: Colors.white54,
                      decorationStyle: TextDecorationStyle.dotted,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),)));
  }
}
