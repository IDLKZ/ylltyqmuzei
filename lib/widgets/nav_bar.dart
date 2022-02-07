import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ylltyqmuzei/constants/constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Map<dynamic, dynamic>> routeLists = [
    {"title": "menu_tours".tr, "icon": Icons.tour, "route": "/home"},
    {"title": "menu_qr".tr, "icon": Icons.qr_code, "route": "/qr"},
    {"title": "menu_services".tr, "icon": Icons.layers, "route": "/services"},
    {"title": "events".tr, "icon": FontAwesomeIcons.calendarAlt, "route": "/events"},
    {"title": "menu_news".tr, "icon": FontAwesomeIcons.newspaper, "route": "/news"},
    {"title": "menu_stocks".tr, "icon": FontAwesomeIcons.calendarCheck, "route": "/stocks"},
    {"title": "menu_pay".tr, "icon": Icons.payment, "route": "/payment"},
    {"title": "menu_questionnaire".tr, "icon": Icons.quiz, "route": "/questionnaire"},
    {
      "title": "menu_faq".tr,
      "icon": FontAwesomeIcons.questionCircle,
      "route": "/faqs"
    },
    {
      "title": "menu_contacts".tr,
      "icon": FontAwesomeIcons.addressBook,
      "route": "/contact"
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
        // decoration: const BoxDecoration(color: Constants.kMainColor),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/inner-bg.png'),
            fit: BoxFit.cover
          )
        ),
        child: ListView(
          children: [
            Container(
              width: 120,
              height: 120,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.contain,
              ),
            ),
            // CircleAvatar(
            //     backgroundColor: Colors.white,
            //     radius: 75,
            //     child: Container(
            //       padding: const EdgeInsets.all(20),
            //       child: Image.asset(
            //         "assets/images/logo.png",
            //         fit: BoxFit.contain,
            //       ),
            //     )),
            const Divider(),
            for (var item in routeLists)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration:  BoxDecoration(
                    color: item['route'] == currentScreen ? const Color(0xFFECC96C) : const Color(0xffF3EFE4),
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
                      color: item['route'] == currentScreen ? const Color(0xffF3EFE4) : const Color(0xFF395a7c),
                      size: 25,
                    ),
                    title: Text(
                      "${item['title']}",
                      style:  TextStyle(
                          color: item['route'] == currentScreen ? const Color(0xffF3EFE4) : const Color(0xFF395a7c),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        fontFamily: 'Philosopher'
                      ),
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
