import 'package:flutter/material.dart';

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
      home: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {

          },
          child: Scaffold(
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
          ),
        );
      }),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background-image.jpg'),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}

