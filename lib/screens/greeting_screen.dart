import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class GreetingsScreen extends StatelessWidget {
  const GreetingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Timer.periodic(Duration(milliseconds: 400),(timer){
      timer.cancel();
      Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route)=>false);      //your code
    });    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  image: const AssetImage('assets/images/bg-image-1.jpeg'),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Container(
            color: const Color.fromRGBO(
                0, 0, 0, 0.18823529411764706),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image:AssetImage("assets/images/logo.png"),height: 150,),
                  SizedBox(height: 20,),
                   Text("greeting".tr,style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.w600),textAlign: TextAlign.center),
                    SizedBox(height: 20,),
                    CircularProgressIndicator(color: Colors.white,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
