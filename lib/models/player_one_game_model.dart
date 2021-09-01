import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class PlayerOneGameModel extends GetxController {
  final RxList<List<String>> listColors = [
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
  RxBool isColorMatched = false.obs;
  final String whiteColor = "#FFFFFF";

  void stopGame(int x, int y) {
   // newMove();

  }

  void newMove(){
    numberOffTappedTimes = 0;
    listOffTappedColors.clear();
    temp.clear();
    isColorMatched.value = false;



  }

  void checkIfColorsAreMatched() {
    if(listOffTappedColors.length == 3){
    for (var i = 0; 3 > i; i++) {
      temp.add(listOffTappedColors[i]);
    }
    colorOne = listColors[temp[0][0]].first;
    colorTwo = listColors[temp[1][0]].first;
    colorThree = listColors[temp[2][0]].first;

    if (colorOne == colorTwo && colorOne == colorThree) {
      isColorMatched.value = true;
      print("Same colors ");
      for (var i = 0; listColors.length > i; i++) {
        if (listColors[i][0] == colorOne && listColors[i][1] == "true") {
          listColors[i][0] = whiteColor;
        }
        update();
      }}
      print("$listColors");
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
    checkIfColorsAreMatched();
  }
}
