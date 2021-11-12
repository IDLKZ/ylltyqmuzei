import 'package:flutter/material.dart';

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
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("Qaz Museum",style: TextStyle(color: Colors.black),),
    );
  }
}
