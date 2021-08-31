import 'package:get/get.dart';
import 'package:collection/collection.dart';

class PlayerOneGameModel extends GetxController {
  final RxList<String> listColors = [
    "#c500bd",
    "#000066",
    "#494a65",
    "#bd00ff",
    "#0900ff","#c500bd",
    "#000066",
    "#494a65",
    "#bd00ff",
    "#0900ff","#c500bd",
    "#000066",
    "#494a65",
    "#bd00ff",
    "#0900ff","#c500bd",
    "#000066",
    "#494a65",
    "#bd00ff",
    "#0900ff","#c500bd",
    "#000066",
    "#494a65",
    "#bd00ff",
    "#0900ff",
  ].obs;

  int numberOffTappedTimes = 0;

  void increaseNumberOffTappedTimes(){
    numberOffTappedTimes++;
    print(numberOffTappedTimes);
  }
}
