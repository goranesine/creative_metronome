import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:math_game/services/audio_sevice.dart';
import 'package:math_game/services/screen_service.dart';

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GetBuilder<MetronomeModel>(
          // specify type as Controller
          init: metronomeModel, // intialize with the Controller
          builder: (value) => barCard(width, height, 1),
        ),
      ],
    );
  }

  Widget barCard(double width, double height, int index) {
    bool isPlaying = false;
    return InkWell(
      onTap: () => metronomeModel.tickCounter.value == 0 ? metronomeModel.start() : metronomeModel.stop(),
      child: Card(
        color: metronomeModel.tickCounter.value != 0 ? getColor(1, metronomeModel.tickCounter.value) : Colors.redAccent,
        child: Container(
          width: width / 4,
          height: height / 16,
          child: Text(metronomeModel.tickCounter.value.toString()),
        ),
      ),
    );
  }

  Color getColor(int index, int tickCounter) {
    Color _activeColor = Colors.redAccent;
    if (tickCounter == index ||
        tickCounter == index + 2 ) {
   _activeColor = Colors.greenAccent;
    } else {
      _activeColor = Colors.redAccent;
    }
    return _activeColor;
  }
}
