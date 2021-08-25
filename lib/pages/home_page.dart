import 'package:flutter/material.dart';
import 'package:math_game/widgets/playerOneBoard.dart';

import 'game_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GamePage(),
    );
  }
}
