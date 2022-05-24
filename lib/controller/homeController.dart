import 'package:get/get.dart';
import 'package:tnzelat/model/appVar.dart';
import 'package:tnzelat/model/categories.dart';
import 'package:tnzelat/view/card.dart';

class HomeController extends GetxController{
  int selected = 0;
  List<ShoppingModel> filterCard = AppVar.AllCards;
  void changeSelected(int newSelected,String category){
    selected = newSelected;
    if(category == "All"){
      filterCard=AppVar.AllCards;
      update();
    }
    else{
      var res = AppVar.AllCards.where((element) => element.tag.toString().toLowerCase().contains(category.toLowerCase())).toList();
      filterCard = res;
      update();
    }
  }
  void filterByName(String filter){
    if(filter==""){
      filterCard = AppVar.AllCards;
      update();
    }else{
      var res = AppVar.AllCards.where((element) => element.title.toString().toLowerCase().contains(filter.toLowerCase())).toList();
      filterCard = res;
      update();
    }
  }
}