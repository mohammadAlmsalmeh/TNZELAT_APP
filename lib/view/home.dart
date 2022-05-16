import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnzelat/controller/homeController.dart';
import 'package:tnzelat/model/categories.dart';
import 'package:tnzelat/view/AppStyle.dart';


import 'card.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ShoppingModel> products = [
      new ShoppingModel("Chery QQ", "Cars", 6083.00,
          "images/car3.png", "Cheap", "Practical"),
      new ShoppingModel("Dacia Logan", "Cars", 12299.99,
          "images/car2.png", "Economic", "Spacious"),
      new ShoppingModel("Nike", "Shoes", 199.99, "images/shoe2.png",
          "Confortable", "Sportsy"),
      new ShoppingModel("Nike Air", "Shoes", 349.99,"images/shoe3.png",
          "Modern", "Popular"),
      new ShoppingModel("Peugeot 308", "Cars", 16499.99,
          "images/car1.png", "Luxerious", "Fast"),
      new ShoppingModel("Timberland", "Shoes", 249.99,
          "images/shoe1.png", "Robust", "Stylish"),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.backgroundColor,
        title: Text("Home"),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: AppStyle.backgroundColor,
        child: ListView(
          children:  [
            const DrawerHeader(
                child: Center(
                  child: Text("TNZELAT",
                    style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22) ,)
                  ,)),
            ListTile(
              title: const Center(child: Text("Contact",style: TextStyle(color: Colors.white),)),
              onTap: (){

              },
            ),
            ListTile(
              title: const Center(child: Text("About",style: TextStyle(color: Colors.white),)),
              onTap: (){

              },
            ),
            ListTile(
              title: const Center(child: Text("Exit",style: TextStyle(color: Colors.white),)),
              onTap: (){
                exit(0);
              },
            )
          ],
        ),
      ),
      body: Container(
        color: AppStyle.backgroundColor,
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller){
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: TextField(
                    onChanged: (text) {
                    },
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      fillColor: Colors.amber,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppStyle.liteColor),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppStyle.liteColor),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppStyle.liteColor),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                      prefixIcon: Icon(Icons.search, color: Colors.white, size: 28),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
                  child: Container(
                      height: 50,
                      child: FutureBuilder(
                        future: Categories().getCategory(),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if(snapshot.hasData){
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return index == controller.selected
                                      ? selectedCategoryCard(snapshot.data[index])
                                      : GestureDetector(
                                    onTap: (){controller.changeSelected(index);},
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                      color: Colors.transparent,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                        child: Center(
                                          child: Text(
                                            snapshot.data[index],
                                            style: TextStyle(
                                                color: AppStyle.liteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                          else{
                            return const CircularProgressIndicator();
                          }
                        },),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 4,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(26),
                                      topRight: Radius.circular(26),
                                      bottomLeft: Radius.circular(26),
                                      bottomRight: Radius.circular(26)
                                  )),
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder(
                        future: Categories().getCards(),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                          if(snapshot.hasData){
                            return ListView.separated(
                                separatorBuilder: (context, index) => Divider(
                                  height: 5,
                                  color: Colors.transparent,
                                ),
                                padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return ShoppingCard(snapshot.data[index]);
                                });
                          }
                          else{
                            return const CircularProgressIndicator();
                          }
                          }),

                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
Widget selectedCategoryCard(String category) {
  return GestureDetector(
    onTap: () {},
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppStyle.liteColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
      ),
    ),
  );
}

Widget unselectedCategoryCard(String category, int index,Function onClick) {
  return GestureDetector(
    onTap: (){onClick;},
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
                color: AppStyle.liteColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
      ),
    ),
  );
}
