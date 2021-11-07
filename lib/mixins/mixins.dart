import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welcome/constants/constants.dart';
class Mixin{

     isConnected() async {
      ConnectivityResult result = await Connectivity().checkConnectivity();
      return result != ConnectivityResult.none;
   }


     String getImage(String image){
       return Constants.apiRes + image;
    }

    List<String> getTitle(dynamic data){
       List<String> titles = [];
       for(var item in data){
         titles.add(item.titleRu);
       }
       return titles;
    }

    List<Widget> getImages(dynamic data){
       List<Widget> images = [];
       for(var item in data){
         images.add(
           Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
                 boxShadow: const [
                   BoxShadow(
                       color:Colors.black,
                     offset: Offset(
                       5.0,
                       5.0,
                     ),
                     blurRadius: 20.0,
                     spreadRadius: 4.0,
                   ), //BoxShadow
                   BoxShadow(
                     color: Colors.white,
                     offset: Offset(0.0, 0.0),
                     blurRadius: 0.0,
                     spreadRadius: 0.0,
                   ), //BoxShadow
                 ],
                 color: Colors.black,
               image: DecorationImage(
                   colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                   image:NetworkImage(getImage(item.image)),
                 fit: BoxFit.cover
               )
             ),
           ),
         );
       }
       return images;
    }


}