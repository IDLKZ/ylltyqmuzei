import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welcome/constants/constants.dart';
class Mixin{

     isConnected() async {
      ConnectivityResult result = await Connectivity().checkConnectivity();
      return result != ConnectivityResult.none;
   }


     String getImage(String? image){
       if(image != null){
         return Constants.apiRes + image;
       }
       else{
         return Constants.defaultImage;
       }
    }

    String getMusic(String? musicUrl){
       if(musicUrl != null){
         return Constants.apiRes + musicUrl;
       }
       else{
         return "https://jitsi.idl.kz/uploads/043Q42GUFe.mp3";
       }
    }

    String truncateText(String text, int length ,[int start = 0]){
       return text.length > length ? text.substring(0, length - 1) + "..." : text;
    }

    List<String> getTitle(dynamic data){
       List<String> titles = [];
       for(var item in data){
         titles.add(item.titleRu);
       }
       return titles;
    }

     String getWebUrl(String alias){
       return Constants.apiWebUrl + alias;
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