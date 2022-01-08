  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:flutter/widgets.dart';
  import 'package:get/get.dart';
import 'package:math_game/pages/addictive_metronome_page.dart';
import 'package:math_game/pages/metronome_page.dart';
  import 'package:math_game/services/audio_sevice.dart';
  import 'package:sleek_circular_slider/sleek_circular_slider.dart';

  import 'models/addictive_metronome_model.dart';
import 'models/metronome_model.dart';
  import 'package:wakelock/wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wakelock.enable();
  Get.put(AudioService());
  Get.put(MetronomeModel());
  Get.put(AddictiveMetronomeModel());


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
  //  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
      title: 'Color game',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: AddictiveMetronomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
