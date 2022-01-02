  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:flutter/widgets.dart';
  import 'package:get/get.dart';
import 'package:math_game/pages/metronome_page.dart';
  import 'package:math_game/services/audio_sevice.dart';
  import 'package:sleek_circular_slider/sleek_circular_slider.dart';

  import 'models/metronome_model.dart';
  import 'package:wakelock/wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  Get.put(AudioService());

  Get.put(MetronomeModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      title: 'Color game',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: HomePageTest(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final metronomeModel = Get.find<MetronomeModel>();

  double sliderValue = 0.5;
  List<int> barBpmList = [

  ];
_HomePageState(){
  List.generate(209, (index) => barBpmList.add(120));

}
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Positioned(
        left: 0,
        top: 0,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 1),
        ),
      ),
      Positioned(
        left: width / 4,
        top: 0,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 5),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: 0,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 9),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: 0,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 13),
        ),
      ),
      Positioned(
        left: 0,
        top: height / 12,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 17),
        ),
      ),
      Positioned(
        left: width / 4,
        top: height / 12,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 21),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: height / 12,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 25),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: height / 12,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 29),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 2,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 33),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 2,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 37),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 2,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 41),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 2,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 45),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 3,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 49),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 3,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 53),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 3,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 57),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 3,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 61),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 4,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 65),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 4,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 69),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 4,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 73),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 4,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 77),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 5,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 81),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 5,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 85),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 5,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 89),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 5,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 93),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 6,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 97),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 6,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 101),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 6,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 105),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 6,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 109),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 7,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 113),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 6,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 117),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 6,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 121),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 6,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 125),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 7,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 129),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 7,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 133),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 7,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 137),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 7,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 141),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 8,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 145),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 8,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 149),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 8,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 153),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 8,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 157),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 9,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 161),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 9,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 165),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 9,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 169),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 9,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 173),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 10,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 177),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 10,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 181),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 10,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 185),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 10,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 189),
        ),
      ),
      Positioned(
        left: 0,
        top: (height / 12) * 11,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 193),
        ),
      ),
      Positioned(
        left: width / 4,
        top: (height / 12) * 11,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 197),
        ),
      ),
      Positioned(
        left: (width / 4) * 2,
        top: (height / 12) * 11,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 201),
        ),
      ),
      Positioned(
        left: (width / 4) * 3,
        top: (height / 12) * 11,
        child: GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 205),
        ),
      ),


    ]);
  }

  Widget barCard(double width, double height, int index) {
    String percentageModifier(double value) {
      final roundedValue = value.toInt().toString();
      return '$roundedValue';
    }

    if (metronomeModel.tickCounter.value == index ||
        metronomeModel.tickCounter.value == index + 1 ||
        metronomeModel.tickCounter.value == index + 2) {
      metronomeModel.tempo.value = barBpmList[index];
      //   print(metronomeModel.tickCounter.value);
    } else if (metronomeModel.tickCounter.value == index + 3) {
      metronomeModel.tempo.value = metronomeModel.tickCounter.value != 192
          ? barBpmList[index + 4]
          : barBpmList[1];
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
          initialValue: barBpmList[index].toDouble(),
          onChangeEnd: (double endValue) {
            setState(() {
              for (var i = 0; i < barBpmList.length - index; i++) {
                barBpmList[208 - i] = endValue.toInt();
              }
            });
          },
        ),
      ),
      child: Card(
        color: metronomeModel.tickCounter.value != 0
            ? getColor(index, metronomeModel.tickCounter.value)
            : Colors.redAccent,
        child: Container(
          width: width / 4,
          height: height / 12,
          child: Text(
            barBpmList[index].toString(),
            textAlign: TextAlign.center,

          ),
        ),
      ),
    );
  }

  Color getColor(int index, int tickCounter) {
    Color _activeColor = Colors.redAccent;
    if (tickCounter == index && metronomeModel.tickSignal.value == true ||
        tickCounter == index + 2 && metronomeModel.tickSignal.value == true) {
      _activeColor = Colors.greenAccent;
    }
    return _activeColor;
  }
}
