import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class PlayerOneGameModel extends GetxController {
  final List<List<String>> listColors = [
    ["#c500bd", "false"],
    ["#000066", "false"],
    ["#494a65", "false"],
    ["#bd00ff", "false"],
    ["#0900ff", "false"],
    ["#c500bd", "false"],
    ["#000066", "false"],
    ["#494a65", "false"],
    ["#bd00ff", "false"],
    ["#0900ff", "false"],
    ["#c500bd", "false"],
    ["#000066", "false"],
    ["#494a65", "false"],
    ["#bd00ff", "false"],
    ["#0900ff", "false"],
    ["#c500bd", "false"],
    ["#000066", "false"],
    ["#494a65", "false"],
    ["#bd00ff", "false"],
    ["#0900ff", "false"],
    ["#c500bd", "false"],
    ["#000066", "false"],
    ["#494a65", "false"],
    ["#bd00ff", "false"],
    ["#0900ff", "false"]
  ].obs;

  int numberOffTappedTimes = 0;
  List<List<int>> listOffTappedColors = [];
  List<List<int>> temp = [];
  String colorOne = "";
  String colorTwo = "";
  String colorThree = "";
final String whiteColor ="#FFFFFF";
  void stopGame(int x, int y) {
    for (var i = 0; listColors.length > i; i++) {
      listColors[i][1] = "true";
    }
    checkIfColorsAreMatched();
  }

  void checkIfColorsAreMatched() {
    for (var i = 0; 3 > i; i++) {
      temp.add(listOffTappedColors[i]);
    }
    colorOne = listColors[temp[0][0]].first;
    colorTwo = listColors[temp[1][0]].first;
    colorThree = listColors[temp[2][0]].first;

    if (colorOne == colorTwo && colorOne == colorThree) {
      print("Same colors color1 $colorOne");
      for (var i = 0; listColors.length > i; i++) {
        listColors[i].remove(colorOne);
      }
      for (var i = 0; listColors.length > i; i++) {
        listColors[i].remove(colorTwo);
      }
      for (var i = 0; listColors.length > i; i++) {
        listColors[i].remove(colorThree);
      }
      print("list color : $listColors");
    } else {}
  }

  void removeMatchedColorsFromList() {}

  void addTappedColorToList(int x, int y) {
    listOffTappedColors.add([x, y]);
    print("list is $listOffTappedColors");
  }

  void increaseNumberOffTappedTimes(int x, int y) {
    addTappedColorToList(x, y);
    numberOffTappedTimes++;
    numberOffTappedTimes >= 3 ? stopGame(x, y) : null;
  }
}
