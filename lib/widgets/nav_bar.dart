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
  List<Map<dynamic, dynamic>> routeLists = [
    {"title": "Туры", "icon": Icons.tour, "route": "/home"},
    {"title": "QR сканнер", "icon": Icons.qr_code, "route": "/qr"},
    {"title": "Новости", "icon": FontAwesomeIcons.newspaper, "route": "/news"},
    {
      "title": "Акции",
      "icon": FontAwesomeIcons.calendarCheck,
      "route": "/stocks"
    },
    {
      "title": "F.A.Q",
      "icon": FontAwesomeIcons.questionCircle,
      "route": "/faqs"
    },
    {
      "title": "Контакты",
      "icon": FontAwesomeIcons.addressBook,
      "route": "/contacts"
    },
  ];

  Widget build(BuildContext context) {
    String? currentScreen = ModalRoute.of(context)!.settings.name as String;
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF0c1e34)),
        child: ListView(
          children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                radius: 75,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fill,
                  ),
                )),
            Divider(),
            for (var item in routeLists)
              Container(
                padding: const EdgeInsets.only(left: 5),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration:  BoxDecoration(
                  color: item['route'] == currentScreen ? Color(0xFFECC96C) : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0)),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, item['route'] ?? "/home");
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                    ),
                  ),
                  leading: Icon(
                    item['icon'],
                    color: item['route'] == currentScreen ? Colors.white : Color(0xFF395a7c),
                    size: 25,
                  ),
                  title: Text(
                    "${item['title']}",
                    style:  TextStyle(
                        color: item['route'] == currentScreen ? Colors.white : Color(0xFF395a7c),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
