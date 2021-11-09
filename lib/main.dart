import 'package:flutter/material.dart';
import 'package:welcome/screens/home_screen.dart';
import 'package:welcome/screens/single_hall.dart';
import 'package:welcome/screens/welcome_screen.dart';

void main() {
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'InIt',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        "/hall":(context)=>const SingleHalls(),
      },
    );
  }
}


