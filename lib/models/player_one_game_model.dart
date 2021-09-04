import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class BrickModel {
  int brickIndex = 0;
  List<String> colorAndIsTapped = [];

  BrickModel({required this.brickIndex, required this.colorAndIsTapped});
}

class PlayerOneGameModel extends GetxController {
  Map<String, dynamic> testList = {
    "brickIndex": 1,
    "brickColor": "#c500bd",
    "isTapped": false,
  };

  final RxList<List<String>> listColorsInitState = [
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"]
  ].obs;

  RxList<List<String>> listColors2 = [
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#c500bd", "false", "false"],
    ["#000066", "false", "false"],
    ["#494a65", "false", "false"],
    ["#bd00ff", "false", "false"],
    ["#0900ff", "false", "false"],
    ["#c500bd", "false", "false"]
  ].obs;

  int numberOffTappedTimes = 0;
  List<int> listOffTappedColors = [];
  List<List<int>> temp = [];
  String colorOne = "";
  String colorTwo = "";
  String colorThree = "";
  RxBool colorNotMatched = false.obs;
  final String disabledColor = "#FFFFFF";
  RxBool endOffTurn = false.obs;
  RxBool showInitBrickColor = true.obs;
  final RxString frontColor = "#ff0000".obs;
  String backColor = "#ff0000";

  // Rx<String> actualColor = "#ff0000".obs;
  List actualColor = [].obs;
  RxBool disableTapBool = false.obs;

  void onTap(int index) {
    if (numberOffTappedTimes < 3) {
      listOffTappedColors.add(index);
      numberOffTappedTimes++;
      listColors2[index][1] = "true";
      //  listColors2[index][2] = "true";
      print(numberOffTappedTimes);
      update();
      checkIfIsThreeTimesTapped();
    } else {
      checkIfColorsAreMatched();
    }
  }

  void checkIfIsThreeTimesTapped() {
    numberOffTappedTimes == 3 ? checkIfColorsAreMatched() : null;
  }

  void disableTap() {
    disableTapBool.value = true;
  }

  void stopGame() {
    // newMove();
  }

  void newMoveAfterColorMatched() {

  }

  void newMoveAfterColorNotMatched() {

  }

  void callCheckIfColorsAreMatched() {
    if (listOffTappedColors.length == 3) {
      checkIfColorsAreMatched();
    }
  }

  void checkIfColorsAreMatched() {
    if (listOffTappedColors.length == 3) {
      colorOne = listColors2[listOffTappedColors[0]][0];
      colorTwo = listColors2[listOffTappedColors[1]][0];
      colorThree = listColors2[listOffTappedColors[2]][0];

      if (colorOne == colorTwo && colorOne == colorThree) {
     //   endOffTurn.value = true;
        print("Same colors ");
        listColors2[listOffTappedColors[0]][2] = "true";
        listColors2[listOffTappedColors[1]][2] = "true";
        listColors2[listOffTappedColors[2]][2] = "true";
        update();
        rebuildListAfterColorMatched();
      } else {
        print("Different colors ");

        endOffTurn.value = true;

        update();
        rebuildListAfterColorNotMatched();
      }
      //  print("$listColors");
    }
  }

  void rebuildListToInit() {
    listColors2 = listColorsInitState;
    update();
  }
  void rebuildListAfterColorMatched(){
    rebuildListToInit();
     listColors2[listOffTappedColors[0]][0] = colorOne ;
     listColors2[listOffTappedColors[1]][0] = colorTwo;
    listColors2[listOffTappedColors[2]][0] = colorThree;
    listColors2[listOffTappedColors[0]][1] = "true" ;
     listColors2[listOffTappedColors[1]][1] = "true";
    listColors2[listOffTappedColors[2]][1] = "true";
    listColors2[listOffTappedColors[0]][2] = "true" ;
     listColors2[listOffTappedColors[1]][2] = "true";
    listColors2[listOffTappedColors[2]][2] = "true";
    update();
    resetCounters();
  }

  void rebuildListAfterColorNotMatched(){

   // rebuildListToInit();
     listColors2[listOffTappedColors[0]][0] = listColorsInitState[listOffTappedColors[0]][0] ;
     listColors2[listOffTappedColors[1]][0] = listColorsInitState[listOffTappedColors[1]][0] ;
    listColors2[listOffTappedColors[2]][0] = listColorsInitState[listOffTappedColors[2]][0] ;
    listColors2[listOffTappedColors[0]][1] = "false" ;
     listColors2[listOffTappedColors[1]][1] = "false";
    listColors2[listOffTappedColors[2]][1] = "false";
    listColors2[listOffTappedColors[0]][2] = "false" ;
     listColors2[listOffTappedColors[1]][2] = "false";
    listColors2[listOffTappedColors[2]][2] = "false";
    update();
    resetCounters();
  }
  void resetCounters(){
    listOffTappedColors.clear();
    numberOffTappedTimes = 0;

  }
}
