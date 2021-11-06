import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: height,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  // autoPlay: false,
                ),
                items: <Widget>[
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                              image: const AssetImage('assets/images/bg-image.png'),
                              fit: BoxFit.fitHeight
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(255, 255, 255, 0.19),
                      ),
                      Container(
                        alignment: const Alignment(-0.75, 0.65),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SizedBox(
                            width: 250.0,
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'National Museum of the Republic of Kazakhstan',
                                    textStyle: const TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white
                                    ),
                                    speed: const Duration(milliseconds: 100),
                                  ),
                                ],
                                  totalRepeatCount: 10,
                                pause: const Duration(milliseconds: 1000),
                              ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                              image: const AssetImage('assets/images/bg-image-2.jpeg'),
                              fit: BoxFit.fitHeight
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(255, 255, 255, 0.19),
                      ),
                      Container(
                        alignment: const Alignment(-0.75, 0.65),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SizedBox(
                            width: 250.0,
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'National Museum of the Republic of Kazakhstan',
                                  textStyle: const TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white
                                  ),
                                  speed: const Duration(milliseconds: 100),
                                ),
                              ],
                              totalRepeatCount: 10,
                              pause: const Duration(milliseconds: 1000),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                              image: const AssetImage('assets/images/bg-image-3.jpeg'),
                              fit: BoxFit.fitHeight
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromRGBO(255, 255, 255, 0.19),
                      ),
                      Container(
                        alignment: const Alignment(-0.75, 0.65),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: SizedBox(
                            width: 250.0,
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'National Museum of the Republic of Kazakhstan',
                                  textStyle: const TextStyle(
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white
                                  ),
                                  speed: const Duration(milliseconds: 100),
                                ),
                              ],
                              totalRepeatCount: 10,
                              pause: const Duration(milliseconds: 1000),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
                  carouselController: buttonCarouselController
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => buttonCarouselController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.linear),
        child: const Text('→'),
      ),
    );
  }
}



// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Stack(
//       children: <Widget>[
//         Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/images/bg-image.png'),
//                 fit: BoxFit.fitHeight),
//           ),
//         ),
//         Container(
//           color: const Color.fromRGBO(255, 255, 255, 0.19),
//         ),
//         Container(
//           alignment: Alignment.bottomLeft,
//           child: const Center(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15.0),
//               child: Text(
//                 'LETS BE PRODUCTIVE TODAY',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                     fontSize: 50.0,
//                     fontFamily: 'bold',
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromRGBO(255, 255, 255, 1)),
//               ),
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }