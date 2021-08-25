import 'package:get/get.dart';
import 'package:collection/collection.dart';

class PlayerOneGameModel extends GetxController {
  RxList<List<int>> gridState = [
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8]
  ].obs;
  int sum = 0;
  List<int> tempListForSumming = [];

  void addTappedNumberToList(int x, int y) {
    int tempNumber = 0;
    if (sum >= 10) {
      clearTappedNumberList();
      sum = 0;
    } else {
      tempNumber = gridState[x][y];
      tempListForSumming.add(tempNumber);

      getSumFromTappedList();
    }
  }

  void clearTappedNumberList() {
    if (tempListForSumming.length != 0) {
      tempListForSumming.clear();
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
  }

  void sumIsGreaterTen() {
    tempListForSumming.clear();
    sum = 0;
  }
}
