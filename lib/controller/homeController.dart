import 'package:get/get.dart';

class HomeController extends GetxController{
  int selected = 0;
  void changeSelected(int newSelected){
    selected = newSelected;
    update();
  }

}