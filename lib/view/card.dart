import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tnzelat/view/detail.dart';

import 'AppStyle.dart';

class ShoppingCard extends StatelessWidget {
  ShoppingModel product;

  ShoppingCard(this.product,{Key? key}):super(key :key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductDetails(product)));
        Get.to(Detail(product));
      },
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Card(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 5),
              color: AppStyle.liteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            semanticContainer: true,
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          product.info,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16),
                        ),
                        Text(
                          product.address,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          product.price.toString(),
                          style: TextStyle(
                              color: AppStyle.liteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 125,
                        minHeight: 125,
                      ),
                      child: Hero(
                        tag: product.title,
                        child: Image(image: NetworkImage(product.productImage),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ShoppingModel{

  String title;
  String tag;
  String info, address;
  String price;
  String productImage;


  ShoppingModel(this.title, this.tag , this.price, this.productImage, this.info, this.address);

}