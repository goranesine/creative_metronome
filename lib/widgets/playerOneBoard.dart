import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_game/models/player_one_game_model.dart';

class PlayerOneBoard extends StatelessWidget {
  final playerOneGameModel = Get.find<PlayerOneGameModel>();

  PlayerOneBoard() {
    ever(playerOneGameModel.gridState, (newItems) {
      print('new items here $newItems');
    });
  }

  @override
  Widget build(BuildContext context) {
    int gridStateLength = playerOneGameModel.gridState.length;

    double _width = MediaQuery.of(context).size.width;
    final _statusBarHeight = MediaQuery.of(context).padding.top;
    double _height = MediaQuery.of(context).size.height - _statusBarHeight;

    final double itemHeight =
        (MediaQuery.of(context).size.height - _statusBarHeight) / 10;
    final double itemWidth = MediaQuery.of(context).size.width / 5;

    return Stack(
      children: [
        Positioned(
          top: 0 + _statusBarHeight,
          left: 0,
          child: Container(
            color: Colors.green,
            width: _width,
            height: _height / 2,
            child: Center(
              child: GetBuilder<PlayerOneGameModel>(
                  builder: (_) => Text(
                        'clicks: ${playerOneGameModel.gridState}',
                      )),
            ),
          ),
        ),
        Positioned(
          top: _height / 2 + _statusBarHeight,
          left: 0,
          child: Container(
            color: Colors.red,
            width: _width,
            height: _height / 2,
            //    padding: const EdgeInsets.all(8.0),
            //       margin: const EdgeInsets.all(8.0),
            //    decoration: BoxDecoration(
            //      border: Border.all(color: Colors.black, width: 2.0)),

            child: GetBuilder<PlayerOneGameModel>(
              builder: (_) => GridView.builder(
                padding: EdgeInsetsGeometry.lerp(
                    EdgeInsets.zero, EdgeInsets.zero, 0.0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: itemWidth / itemHeight,
                  crossAxisCount: gridStateLength,
                ),
                itemBuilder: _buildGridItems,
                itemCount: gridStateLength * gridStateLength,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = playerOneGameModel.gridState.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    return GestureDetector(
      onTap: () => playerOneGameModel.addTappedNumberToList(x, y),
      child: Container(
        //  width: MediaQuery.of(context).size.width / 5,
        //    height: MediaQuery.of(context).size.height -
        //    MediaQuery.of(context).padding.top / 5,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
        child: Center(
          child: _buildGridItem(x, y),
        ),
      ),
    );
  }

  Widget _buildGridItem(int x, int y) {
    return playerOneGameModel.gridState[x][y] == 0
        ? Container()
        : Text(playerOneGameModel.gridState[x][y].toString());
  }
}
