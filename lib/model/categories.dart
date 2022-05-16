import 'package:tnzelat/view/card.dart';

class Categories{

Future<List<String>> getCategory() async{
  List<String> x = ["All","clothes","clean"];
  return x;
}
Future<List<ShoppingModel>> getCards() async{
  List<ShoppingModel> products = [
    new ShoppingModel("Chery QQ", "Cars", 6083.00,
        "assets/images/car3.png", "Cheap", "Practical"),
    new ShoppingModel("Dacia Logan", "Cars", 12299.99,
        "assets/images/car2.png", "Economic", "Spacious"),
    new ShoppingModel("Nike", "Shoes", 199.99, "assets/images/shoe2.png",
        "Confortable", "Sportsy"),
    new ShoppingModel("Nike Air", "Shoes", 349.99,"assets/images/shoe3.png",
        "Modern", "Popular"),
    new ShoppingModel("Peugeot 308", "Cars", 16499.99,
        "assets/images/car1.png", "Luxerious", "Fast"),
    new ShoppingModel("Timberland", "Shoes", 249.99,
        "assets/images/shoe1.png", "Robust", "Stylish"),
  ];
  return products;
}
}
/**/