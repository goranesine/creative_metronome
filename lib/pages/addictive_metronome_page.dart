

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:math_game/models/addictive_metronome_model.dart';

class AddictiveMetronomePage extends StatelessWidget{
  final addictiveMetronomeModel = Get.find<AddictiveMetronomeModel>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

return Stack(
  children: [
    ElevatedButton(onPressed:()=> addictiveMetronomeModel.switchOnOff(), child: Text("Switch on/off")),
  ],
);  }

}