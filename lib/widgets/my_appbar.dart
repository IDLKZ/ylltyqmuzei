import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget   {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
  Size get preferredSize {
    return new Size.fromHeight(60.0);
  }

}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF0c1e34),
      elevation: 0,
      title: Text("Qaz Museum",style: TextStyle(color: Color(0xFFECC96C),fontWeight: FontWeight.w600),),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.language))
      ],
    );
  }
}
