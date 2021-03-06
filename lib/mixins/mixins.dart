import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ylltyqmuzei/constants/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
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

     String getNewsImage(String? image){
       if(image != null){
         return Constants.apiImageNews + image;
       }
       else{
         return Constants.defaultImage;
       }
     }

    Widget getHTML(String? description){

       if(description != null){
         return Html(data: description);
       }
       else{
         return Text("");
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
         titles.add(item.getTitle());
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

    String? getLocale() {
       String locale = Get.locale!.languageCode;
       return locale.capitalizeFirst;
    }

    static Future<String> getCurrentLocale() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? locale = prefs.getString("langLocale") ?? "ru";
      return locale;
    }

     static Future<String> getCurrentRoute() async{
       SharedPreferences prefs = await SharedPreferences.getInstance();
       bool route =  prefs.getBool("welcome") ?? false;
       return route == true ? "/greeting" : "/";
     }


    static setShared(String key, dynamic value ) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(value.runtimeType == String){
        prefs.setString(key, value);
      }
      if(value.runtimeType == bool){
        prefs.setBool(key, value);
      }
      if(value.runtimeType == int){
        prefs.setInt(key, value);
      }
      if(value.runtimeType == double){
        prefs.setDouble(key, value);
      }
    }

    static bool isTablet(){
      // The equivalent of the "smallestWidth" qualifier on Android.
      final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);

// Determine if we should use mobile layout or not, 600 here is
// a common breakpoint for a typical 7-inch tablet.
      return data.size.shortestSide < 600 ? false :true;
    }




}