import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  List<Map<dynamic,dynamic>> routeLists = [
    {"title":"Туры","icon":Icons.tour},
    {"title":"QR сканнер","icon":Icons.qr_code},
    {"title":"Новости","icon":FontAwesomeIcons.newspaper},
    {"title":"Акции","icon":FontAwesomeIcons.calendarCheck},
    {"title":"F.A.Q","icon":FontAwesomeIcons.questionCircle},
    {"title":"Контакты","icon":FontAwesomeIcons.addressBook},
  ];
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration:  BoxDecoration(
          color: Color(0xFF0c1e34)
        ),
        child: ListView(
          children: [
            CircleAvatar(
                backgroundColor: Colors.white,
              radius: 75,
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(70),
                  child: Image.asset("assets/images/logo.png",
                    fit: BoxFit.fill,
                  ),
                )

            ),
            Divider(),
            for ( var item in routeLists ) Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0)),
              ),
              child:  ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50),),
                ),
                leading: Icon(item['icon'],color: const Color(0xFF395a7c),size: 25,),
                title: Text("${item['title']}",style: TextStyle(color: const Color(0xFF395a7c),fontSize: 22, fontWeight: FontWeight.bold ),),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xFFECC96C),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0)),
              ),
              child: const ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50),),
                ),
                leading: Icon(Icons.tour,color: Colors.white,size: 25,),
                title: Text("Туры",style: TextStyle(color: Colors.white,fontSize: 22, fontWeight: FontWeight.bold ),),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
