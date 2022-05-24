import 'package:flutter/material.dart';
import 'package:tnzelat/view/AppStyle.dart';

import 'card.dart';

class Detail extends StatelessWidget {
  ShoppingModel product;

  Detail(this.product,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.backgroundColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              Icons.bookmark_border,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        color: AppStyle.backgroundColor,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Hero(
                    tag: product.title,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                             Radius.circular(26)
                          )),
                        child: Padding(
                          padding: const EdgeInsets.all(26),
                          child: Image(image: NetworkImage(product.productImage),),
                        )
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 5,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(26),
                                  topRight: Radius.circular(26),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8,0,8,0),
                              child: Center(
                                  child: Text(
                                      product.address,
                                    style: TextStyle(fontSize: 20,color: Colors.grey),
                                  )),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26)),
                            margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(42, 16, 32, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        product.title +
                                            "\n" +
                                            product.info,
                                        softWrap: true,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            )),
                        Expanded(
                            child: Card(
                              color: AppStyle.backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(26),
                                    topRight: Radius.circular(26),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 36, right: 32),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      product.price.toString() ,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 26),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
