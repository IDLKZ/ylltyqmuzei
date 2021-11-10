import 'package:flutter/material.dart';
import 'package:welcome/screens/home_screen.dart';
import 'package:welcome/screens/single_hall.dart';
import 'package:welcome/screens/single_tour.dart';
import 'package:welcome/screens/third_models.dart';
import 'package:welcome/screens/tours.dart';
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
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        "/hall":(context)=>const SingleHalls(),
        "/tours":(context)=> Tours(),
        '/tour': (context) => const SingleTour(),
        "/thirdModels":(context)=> const ThirdModels(),
      },
    );
  }
}


