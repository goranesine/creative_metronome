import 'package:get/get.dart';
import 'package:collection/collection.dart';

class PlayerOneGameModel extends GetxController {
  RxList<List<int>> gridState = [
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5],
    [1, 2, 3, 4, 5]
  ].obs;
  RxString str = "pas".obs;
  int sum = 0;
  List<int> tempListForSumming = [];
List<List<int>> tempListOffTappedNumbers = [];
List<int> tempListForCalculation = [];


void populateGrid(){

}

  void addTappedNumberToList(int x, int y) {
  str.value = "macka";
    int tempNumber = 0;
    if (sum >= 10) {
      clearTappedNumberList();
      sum = 0;
    } else {
      tempListForCalculation = [x,y];
      tempListOffTappedNumbers.add(tempListForCalculation);
      print(tempListOffTappedNumbers);
      tempNumber = gridState[x][y];
      tempListForSumming.add(tempNumber);

      getSumFromTappedList();
    }
  }

  void clearTappedNumberList() {
    if (tempListForSumming.length != 0) {
      tempListForSumming.clear();
      tempListOffTappedNumbers.clear();
      sum = 0;
    }
  }

  void getSumFromTappedList() {
    int tempNumber = 0;
    sum = 0;
    print("tempListForSummingIs $tempListForSumming");
    sum = tempListForSumming.sum;

    if (sum == 10) {
      sumIsTen();
    }
    if (sum > 10) {
      sumIsGreaterTen();
    }
  }

  void sumIsTen() {
    print("bravo");
    tempListForSumming.clear();
    sum = 0;
    turnTappedPositionToZero();
  }

  void sumIsGreaterTen() {
    tempListForSumming.clear();
    tempListOffTappedNumbers.clear();
    sum = 0;
  }

  void turnTappedPositionToZero(){

    tempListOffTappedNumbers.forEach((list) {
      gridState[list.first][list.last] = 0;
    });
    update();
    print(gridState);
    tempListOffTappedNumbers.clear();
    tempListForSumming.clear();
  //  notifyChildrens();
  }

}
