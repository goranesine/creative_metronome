import 'package:flutter/material.dart';
import 'package:math_game/pages/test_page.dart';


import 'game_page.dart';

class HomePage extends StatelessWidget {
  final Gradient _gradient =
  LinearGradient(colors: [Colors.redAccent, Colors.deepOrange]);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: _gradient),

      child: Scaffold(
          backgroundColor: Colors.transparent,

          body: GamePage()),
    );

  }
}
