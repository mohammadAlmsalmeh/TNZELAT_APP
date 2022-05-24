
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnzelat/model/categories.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          Center(
            child: FutureBuilder(
              future: Categories().getCategory(true),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return Text("wait for auto refresh",style: TextStyle(color: Colors.white),);
                }
                else{
                  return CircularProgressIndicator(color: Colors.white,);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
