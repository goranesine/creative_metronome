import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math_game/models/metronome_model.dart';
import 'package:math_game/services/audio_sevice.dart';
import 'package:math_game/widgets/custom_delegate.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class HomePageTest extends StatefulWidget {
  @override
  State<HomePageTest> createState() => _HomePageTestState();
}

class _HomePageTestState extends State<HomePageTest> {
  final metronomeModel = Get.find<MetronomeModel>();
  final audioService = Get.find<AudioService>();

  double sliderValue = 0.5;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      Stack(
        children: [ GridView.builder(
          itemCount: 48,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 4,
            height: height / 12,
          ),
          itemBuilder: (context, index) {
            return barCard( index+1);
          },
        ),

          Positioned(
            top: height /2 -100,
            child: GetBuilder(
              init: MetronomeModel(),
              builder: (value)=>
                  Text("Active bar index : ${metronomeModel.activeBarIndex}",textScaleFactor: 3,),
            ),
          ), Positioned(
            top: height /2 -50,
            child: GetBuilder(
              init: MetronomeModel(),
              builder: (value)=>
                  Text("Tick counter : ${metronomeModel.tickCounter}",textScaleFactor: 3,),
            ),
          ), Positioned(
            top: height /2,
            child: GetBuilder(
              init: MetronomeModel(),
              builder: (value)=>
                  Text("Play accent : ${metronomeModel.playAccent}",textScaleFactor: 3,),
            ),
          ),Positioned(
            top: height /2 +50,
            child: GetBuilder(
              init: MetronomeModel(),
              builder: (value)=>
                  Text("Active : ${metronomeModel.active}",textScaleFactor: 3,),
            ),
          ),Positioned(
            top: height /2 +100,
            child: GetBuilder(
              init: MetronomeModel(),
              builder: (value)=>
                  Text("Tick signal : ${metronomeModel.tickSignal}",textScaleFactor: 3,),
            ),
          ),],
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
            // animDurationMultiplier: 5.0,
            infoProperties: InfoProperties(
                modifier: percentageModifier,
                bottomLabelText: "BPM",
                mainLabelStyle: TextStyle(color: Colors.redAccent)),
          ),
          min: 40,
          max: 240,
          initialValue: metronomeModel.barBpmList[index-1].toDouble(),
          onChangeEnd: (double endValue) {
            metronomeModel.updateBpmMap(index-1, endValue);
          },
        ),
      ),
      child: GetBuilder(
        init: MetronomeModel(),
        builder: (value)=>Card(
          color: metronomeModel.tickSignal.value == true && metronomeModel.activeBarIndex.value == index
              ? Colors.greenAccent
              : Colors.redAccent,
          child: Container(
            // width: width / 4,
            // height: height / 12,
            child: Text(
              metronomeModel.barBpmList[index-1].toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }


}
