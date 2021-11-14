import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Map<dynamic, dynamic>> routeLists = [
    {"title": "menu_tours".tr, "icon": Icons.tour, "route": "/home"},
    {"title": "menu_qr".tr, "icon": Icons.qr_code, "route": "/qr"},
    {"title": "menu_news".tr, "icon": FontAwesomeIcons.newspaper, "route": "/news"},
    {"title": "menu_stocks".tr, "icon": FontAwesomeIcons.calendarCheck, "route": "/stocks"},
    {
      "title": "menu_faq".tr,
      "icon": FontAwesomeIcons.questionCircle,
      "route": "/faqs"
    },
    {
      "title": "menu_contacts".tr,
      "icon": FontAwesomeIcons.addressBook,
      "route": "/contacts"
    },
    {
      "title": "menu_about".tr,
      "icon": Icons.account_balance_outlined,
      "route": "/about"
    },
  ];

  @override
  Widget build(BuildContext context) {
    String? currentScreen = ModalRoute.of(context)!.settings.name as String;
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFF0c1e34)),
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
            const Divider(),
            for (var item in routeLists)
              Container(
                padding: const EdgeInsets.only(left: 5),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration:  BoxDecoration(
                  color: item['route'] == currentScreen ? const Color(0xFFECC96C) : Colors.white,
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
                    color: item['route'] == currentScreen ? Colors.white : const Color(0xFF395a7c),
                    size: 25,
                  ),
                  title: Text(
                    "${item['title']}",
                    style:  TextStyle(
                        color: item['route'] == currentScreen ? Colors.white : const Color(0xFF395a7c),
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
