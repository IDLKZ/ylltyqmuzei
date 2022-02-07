import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get.dart';
import 'package:ylltyqmuzei/constants/constants.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget   {
  const MyAppBar({Key? key}) : super(key: key);
  static const List<Map> languagesApp = [
    {"title":"Рус.","code":"ru"},
    {"title":"Kaz.","code":"kz"},
    {"title":"Eng.","code":"en"},
    {"title":"Deu.","code":"de"},
    {"title":"Fre.","code":"fr"},
    {"title":"Esp.","code":"es"},
    {"title":"Tur.","code":"tr"},
  ];
  @override
  _MyAppBarState createState() => _MyAppBarState();
  @override
  Size get preferredSize {
    return const Size.fromHeight(60.0);
  }

}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.kHeaderColor,
      elevation: 0,
      title: Text('app_title'.tr,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontFamily: 'Philosopher'),),
      actions: [
      DropdownButton<String>(
        value: Get.locale!.languageCode,
      icon: const Icon(Icons.language, color: Colors.white,),
      iconSize: 24,
      style: const TextStyle(color: Colors.white, fontFamily: 'Philosopher'),
      dropdownColor: Constants.kHeaderColor,
      underline: Container(
        height: 0,
        color: Colors.transparent,
      ),

      onChanged: (String? newValue) async {
          String newLang = newValue ?? "ru";
        setState(() {
          Get.updateLocale(Locale(newLang));
        });
        await Mixin.setShared("langLocale", newLang);
      },
      items: MyAppBar.languagesApp.map((value) {
        return DropdownMenuItem<String>(
          value: value["code"],
          child: Text(value["title"] ?? "Рус"),
        );
      }).toList(),
    )
    ],

    );
  }
}
