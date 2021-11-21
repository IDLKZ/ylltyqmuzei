import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class GreetingsScreen extends StatefulWidget {
  const GreetingsScreen({Key? key}) : super(key: key);

  @override
  _GreetingsScreenState createState() => _GreetingsScreenState();
}

class _GreetingsScreenState extends State<GreetingsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200),
        (){Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route)=>false);}
    );
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
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
                  const SizedBox(height: 20,),
                  Text("greeting".tr,style: const TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.w600),textAlign: TextAlign.center),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



