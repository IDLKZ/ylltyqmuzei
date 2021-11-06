import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:welcome/constants/constants.dart';
class Mixin{

     isConnected() async {
      ConnectivityResult result = await Connectivity().checkConnectivity();
      return result != ConnectivityResult.none;
   }


     String getImage(String image){
       return Constants.apiRes + image;
    }


}