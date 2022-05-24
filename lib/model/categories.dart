import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:tnzelat/model/appVar.dart';
import 'package:tnzelat/view/card.dart';
import 'package:tnzelat/view/home.dart';

class Categories{
Future<List<dynamic>> getCategory(bool go) async{
  String url ="https://www.t.me/s/testmytnzelat";
  var result = await get(Uri.parse(url));
  var data = result.body;
  AppVar.contentPage = data;
  await getCards(data);
  const start = "{%CATEGORY%}";
  const end = "{%CATEGORYEND%}";
  final startIndex = data.indexOf(start);
  final endIndex = data.indexOf(end, startIndex + start.length);
  var theData = data.substring(startIndex + start.length, endIndex);
  theData = theData.replaceAll("&quot;",'"');
  var json = jsonDecode(theData);
  var list =["All"];
  if(json["status"]=="success"){
    for(var j in json["data"]){
      list.add(j);
    }
    AppVar.allCategory = list;
    if(go){
      Future.delayed(Duration(seconds: 2)).then((value) {
        Get.off(Home());
      });
    }

  }
  else {
    List<String> x = ["check your internet connection"];
    AppVar.allCategory = x;
  }
  AppVar.isLoading = false;
  return [];
}

Future<bool> getCards(String data) async{
  //String url ="https://www.t.me/s/testmytnzelat";
  //var result = await get(Uri.parse(url));
  //var data = result.body;
  const start = "{%CARDS%}";
  const end = "{%CARDSEND%}";
  final startIndex = data.indexOf(start);
  final endIndex = data.indexOf(end, startIndex + start.length);
  var theData = data.substring(startIndex + start.length, endIndex);
  theData = theData.replaceAll("&quot;",'"');
  var json = jsonDecode(theData);
  if(json["status"]=="success"){
    List<ShoppingModel> list =[];
    for(var j in json["data"]){
      var startImg =j["image"]+"BEGIN";
      var endImg=j["image"]+"END";
      final startImgIndex = data.indexOf(startImg);
      var endImgIndex = data.indexOf(endImg);
      var urlIn = data.substring(startImgIndex, endImgIndex);
      var imgurl = urlIn.substring(urlIn.indexOf("background-image:url('")+"background-image:url('".length,
      urlIn.indexOf(".jpg')")+".jpg".length);
      ShoppingModel sh = ShoppingModel(j["name"],j["category"],j["price"],imgurl,j["detail"],j["address"]);
      list.add(sh);
    }
    AppVar.AllCards = list;
  }
  else{

  }
  return true;
}

}