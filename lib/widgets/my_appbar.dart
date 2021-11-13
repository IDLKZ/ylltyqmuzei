import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:welcome/generated/l10n.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget   {
  const MyAppBar({Key? key}) : super(key: key);

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
      backgroundColor: const Color(0xFF0c1e34),
      elevation: 0,
      title: Text(S.of(context).app_title,style: const TextStyle(color: Color(0xFFECC96C),fontWeight: FontWeight.w600),),
      actions: [
        IconButton(onPressed: (){
          setState(() {
            S.load(const Locale('ru'));
          });
        }, icon: const Icon(FontAwesomeIcons.language))
      ],
    );
  }
}
