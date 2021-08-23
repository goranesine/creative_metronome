import 'package:get/get.dart';

class PlayerOneGameModel extends GetxController {
  RxList<List<int>> gridState = [
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8],
    [1, 2, 3, 4, 5, 6, 7, 8]
  ].obs;
RxString a = "a".obs;
  List<int> tappedNumbers = [];

  void addTappedNumberToList(int tappedNumber) {
    tappedNumbers.add(tappedNumber);
    print(tappedNumbers);
  }
}
