import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg-image.png'),
                  fit: BoxFit.fitHeight),
            ),
          ),
          Container(
            color: const Color.fromRGBO(255, 255, 255, 0.19),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'LETS BE PRODUCTIVE TODAY',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'bold',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
