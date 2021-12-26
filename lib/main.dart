import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math_game/services/audio_sevice.dart';
import 'package:math_game/services/screen_service.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'models/metronome_model.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  Get.put(AudioService());
  // Get.put(PlayerOneGameModel());
//  Get.put(PlayerTwoGameModel());
  Get.put(ScreenService());
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
        body: HomePage(),
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
    120,
    120,
    120,
    120,
    120,
    120,
    120,
    120,
    120,
    120,
    120,
    120
  ];

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
        bottom: 0,
        right: 0,
        child: FloatingActionButton(
          onPressed: () => metronomeModel.tickCounter.value == 0
              ? metronomeModel.start()
              : metronomeModel.stop(),
        ),
      ),
    ]);
  }

  Widget barCard(double width, double height, int index) {
    //  double barBpm = 0.5;
    int _currentValue = 120;
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
      metronomeModel.tempo.value = metronomeModel.tickCounter.value != 12
          ? barBpmList[index + 4]
          : barBpmList[1];
    }

    return InkWell(
      onTap: () => Get.defaultDialog(
        title: "Adjust BPM",
        content: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            animDurationMultiplier: 5.0,
            infoProperties: InfoProperties(
                modifier: percentageModifier,
                bottomLabelText: "BPM",
                mainLabelStyle: TextStyle(color: Colors.redAccent)),
          ),
          min: 40,
          max: 240,
          initialValue: 120,
          onChangeEnd: (double endValue) {
            setState(() {
              for (var i = 0; i < barBpmList.length - index; i++) {
                barBpmList[11 - i] = endValue.toInt();
              }
            });
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: metronomeModel.tickCounter.value != 0
              ? getColor(index, metronomeModel.tickCounter.value)
              : Colors.redAccent,
          child: Container(
            width: width / 4 - 8,
            height: height / 16,
            child: Text(barBpmList[index].toString()),
          ),
        ),
      ),
    );
  }

  Color getColor(int index, int tickCounter) {
    Color _activeColor = Colors.redAccent;
    if (tickCounter == index || tickCounter == index + 2) {
      _activeColor = Colors.greenAccent;
    } else {
      _activeColor = Colors.redAccent;
    }
    return _activeColor;
  }
}
