import 'package:get/get.dart';

class ScreenService extends GetxController {
  RxDouble screenWidth = 0.0.obs;
  RxDouble screenHeight = 0.0.obs;
  RxDouble screenHeightInPercentage = 0.0.obs;
  RxDouble screenRatio = 0.0.obs;

  void storeScreenDimension(double width, double height) {
    screenWidth.value = width;
    screenHeight.value = height;
    screenHeightInPercentage.value = (height / 100);
    screenRatio.value = height/width;
    update();
  }
}
