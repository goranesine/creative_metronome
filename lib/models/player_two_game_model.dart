import 'package:get/get.dart';
import 'package:collection/collection.dart';
import 'package:math_game/services/audio_sevice.dart';



class PlayerTwoGameModel extends GetxController {

final audioService = Get.find<AudioService>();
  RxList<List<String>> listOffColorsAndBool = [
    ["#ee82ee", "false", "false"],
    ["#ffa500", "false", "false"],
    ["#ffff00", "false", "false"],
    ["#008000", "false", "false"],
    ["#0000ff", "false", "false"], ["#ee82ee", "false", "false"],
    ["#ffa500", "false", "false"],
    ["#ffff00", "false", "false"],
    ["#008000", "false", "false"],
    ["#0000ff", "false", "false"], ["#ee82ee", "false", "false"],
    ["#ffa500", "false", "false"],
    ["#ffff00", "false", "false"],
    ["#008000", "false", "false"],
    ["#0000ff", "false", "false"], ["#ee82ee", "false", "false"],
    ["#ffa500", "false", "false"],
    ["#ffff00", "false", "false"],
    ["#008000", "false", "false"],
    ["#0000ff", "false", "false"], ["#ee82ee", "false", "false"],
    ["#ffa500", "false", "false"],
    ["#ffff00", "false", "false"],
    ["#008000", "false", "false"],
    ["#0000ff", "false", "false"], ["#ee82ee", "false", "false"],
    ["#ffa500", "false", "false"],
    ["#ffff00", "false", "false"],
    ["#008000", "false", "false"],
    ["#0000ff", "false", "false"]
  ].obs;

  int numberOffTappedTimes = 0;
  List<int> listOffTappedColors = [];
  String colorOne = "";
  String colorTwo = "";
  String colorThree = "";
  RxBool playerTwoWins = false.obs;
 RxString currentTappedColor = "0".obs;
  RxBool freezPlayerOne = false.obs;

  PlayerTwoGameModel() {
    shuffle();
  }

  void shuffle() {
    listOffColorsAndBool.shuffle();
    update();
  }

  void onTap(int index) {
    if (numberOffTappedTimes < 3) {
      currentTappedColor.value = listOffColorsAndBool[index][0];
      listOffTappedColors.add(index);
      numberOffTappedTimes++;
      listOffColorsAndBool[index][1] = "true";
      //  listColors2[index][2] = "true";
      print(numberOffTappedTimes);
      update();
      checkIfIsThreeTimesTapped();
    } else {
      checkIfColorsAreMatched();
    }
  }

  void checkIfIsThreeTimesTapped() {
    if (numberOffTappedTimes == 3) {
      Future.delayed(const Duration(milliseconds: 500), () {
        checkIfColorsAreMatched();
      });
    }
  }

  void checkIfAllIsDisabledAreTrue() {
    currentTappedColor.value = "0";
    update();
    List<String> testBools = [];
    List<String> listOffTrueBools = [
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true",
      "true"
    ];
    for (var i = 0; listOffColorsAndBool.length > i; i++) {
      testBools.add(listOffColorsAndBool[i][2]);
    }
    if (testBools.equals(listOffTrueBools)) {
      endGame();
    } else {}
  }

  void checkIfColorsAreMatched() {
    if (listOffTappedColors.length == 3) {
      colorOne = listOffColorsAndBool[listOffTappedColors[0]][0];
      colorTwo = listOffColorsAndBool[listOffTappedColors[1]][0];
      colorThree = listOffColorsAndBool[listOffTappedColors[2]][0];

      if (colorOne == colorTwo && colorOne == colorThree) {
audioService.playPositiveMatchedColors();
print("Same colors ");
        listOffColorsAndBool[listOffTappedColors[0]][2] = "true";
        listOffColorsAndBool[listOffTappedColors[1]][2] = "true";
        listOffColorsAndBool[listOffTappedColors[2]][2] = "true";
        freezPlayerOne.value = true;

        update();
        turnFreezPlayerOneFalseWithDelay();
        rebuildListAfterColorMatched();
      } else {
        audioService.playNegativeMatchedColors();
        print("Different colors ");

        update();
        rebuildListAfterColorNotMatched();
      }
      //  print("$listColors");
    }
  }

  void turnFreezPlayerOneFalseWithDelay() {
    Future.delayed(const Duration(seconds: 2), () {
      freezPlayerOne.value = false;
      update();
    });
  }

  void rebuildListAfterColorMatched() {
    // rebuildListToInit();
    //  listColors2[listOffTappedColors[0]][0] = colorOne ;
    //  listColors2[listOffTappedColors[1]][0] = colorTwo;
    //  listColors2[listOffTappedColors[2]][0] = colorThree;
    listOffColorsAndBool[listOffTappedColors[0]][1] = "true";
    listOffColorsAndBool[listOffTappedColors[1]][1] = "true";
    listOffColorsAndBool[listOffTappedColors[2]][1] = "true";
    listOffColorsAndBool[listOffTappedColors[0]][2] = "true";
    listOffColorsAndBool[listOffTappedColors[1]][2] = "true";
    listOffColorsAndBool[listOffTappedColors[2]][2] = "true";
    update();
    resetCounters();
    // checkIfIsThreeTimesTapped();
    checkIfAllIsDisabledAreTrue();
  }

  void rebuildListAfterColorNotMatched() {
    // rebuildListToInit();
    //  listColors2[listOffTappedColors[0]][0] = listColorsInitState[listOffTappedColors[0]][0] ;
    //  listColors2[listOffTappedColors[1]][0] = listColorsInitState[listOffTappedColors[1]][0] ;
    // listColors2[listOffTappedColors[2]][0] = listColorsInitState[listOffTappedColors[2]][0] ;
    listOffColorsAndBool[listOffTappedColors[0]][1] = "false";
    listOffColorsAndBool[listOffTappedColors[1]][1] = "false";
    listOffColorsAndBool[listOffTappedColors[2]][1] = "false";
    listOffColorsAndBool[listOffTappedColors[0]][2] = "false";
    listOffColorsAndBool[listOffTappedColors[1]][2] = "false";
    listOffColorsAndBool[listOffTappedColors[2]][2] = "false";
    update();
    resetCounters();
    checkIfAllIsDisabledAreTrue();
  }

  void resetCounters() {
    listOffTappedColors.clear();
    numberOffTappedTimes = 0;
  }

  void endGame() {
    playerTwoWins.value = true;
    for (var i = 0; listOffColorsAndBool.length > i; i++) {
      listOffColorsAndBool[i][1] = "false";
      listOffColorsAndBool[i][2] = "false";
    }
    listOffColorsAndBool.shuffle();
    update();
  }
}
