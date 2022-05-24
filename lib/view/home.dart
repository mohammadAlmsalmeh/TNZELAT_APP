import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnzelat/controller/homeController.dart';
import 'package:tnzelat/model/appVar.dart';
import 'package:tnzelat/model/categories.dart';
import 'package:tnzelat/view/AppStyle.dart';
import 'package:tnzelat/view/about.dart';


import 'card.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              title: const Center(child: Text("About",style: TextStyle(color: Colors.white),)),
              onTap: (){
                Get.to(()=>About());
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
                      controller.filterByName(text);
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
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: AppVar.allCategory.length,
                          itemBuilder: (context, index) {
                            return index == controller.selected
                                ? selectedCategoryCard(AppVar.allCategory[index])
                                : GestureDetector(
                              onTap: (){
                                controller.changeSelected(index,AppVar.allCategory[index]);
                              },
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  child: Center(
                                    child: Text(
                                      AppVar.allCategory[index],
                                      style: TextStyle(
                                          color: AppStyle.liteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
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
                      RefreshIndicator(
                        onRefresh: () async{
                          await Categories().getCategory(false).then((value) {
                            controller.changeSelected(0,"All");
                          });
                        },
                        child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              height: 5,
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                            itemCount: controller.filterCard.length,
                            itemBuilder: (context, index) {
                              print("512"+index.toString());
                              return ShoppingCard(controller.filterCard[index]);
                            }),
                      ),

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
