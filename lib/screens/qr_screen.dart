import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ylltyqmuzei/widgets/my_appbar.dart';
import 'package:ylltyqmuzei/widgets/nav_bar.dart';
import 'package:ylltyqmuzei/widgets/qr.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      appBar: MyAppBar(),
      drawer: NavBar(),
      body: QrWidget(),
    );
  }
}
