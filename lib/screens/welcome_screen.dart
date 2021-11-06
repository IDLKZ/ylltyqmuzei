import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  CarouselController buttonCarouselController = CarouselController();
  int currentPage = 0;
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
                    initialPage: currentPage,
                    enableInfiniteScroll: false,
                    height: height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    onPageChanged: (index,reason){
                      setState(() {
                          currentPage = index;
                      });
                    }
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
                                    '3D Tour in Museums Halls',
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
                                    'Information Sculpture and View in our app',
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
      floatingActionButton: currentPage < 2 ? FloatingActionButton(
        backgroundColor: Colors.black12,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        mini: false,
        shape: const CircleBorder(
            side:  BorderSide(color: Colors.white)
        ),
        onPressed: (){
          buttonCarouselController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.linear);
        },
        child: Icon(Icons.arrow_forward_ios, size: 30,color: Colors.white),
      ) :
      ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.white)
                  )
              )
          ),
        onPressed: (){},
        child: const Padding(
          padding:  EdgeInsets.fromLTRB(10,8,10,8),
          child:  Text("Let's start!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
      )
    );
  }
}


// class WelcomeScreen extends StatelessWidget {
//
//   final CarouselController buttonCarouselController = CarouselController();
//
//   WelcomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Builder(
//         builder: (context) {
//           final double height = MediaQuery.of(context).size.height;
//           return Column(
//             children: [
//               CarouselSlider(
//                 options: CarouselOptions(
//                   height: height,
//                   viewportFraction: 1.0,
//                   enlargeCenterPage: false,
//                   // autoPlay: false,
//                 ),
//                 items: <Widget>[
//                   Stack(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           image: DecorationImage(
//                             colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
//                               image: const AssetImage('assets/images/bg-image.png'),
//                               fit: BoxFit.fitHeight
//                           ),
//                         ),
//                       ),
//                       Container(
//                         color: const Color.fromRGBO(255, 255, 255, 0.19),
//                       ),
//                       Container(
//                         alignment: const Alignment(-0.75, 0.65),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                           child: SizedBox(
//                             width: 250.0,
//                               child: AnimatedTextKit(
//                                 animatedTexts: [
//                                   TypewriterAnimatedText(
//                                     'National Museum of the Republic of Kazakhstan',
//                                     textStyle: const TextStyle(
//                                       fontSize: 40.0,
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.white
//                                     ),
//                                     speed: const Duration(milliseconds: 100),
//                                   ),
//                                 ],
//                                   totalRepeatCount: 10,
//                                 pause: const Duration(milliseconds: 1000),
//                               ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   Stack(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           image: DecorationImage(
//                               colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
//                               image: const AssetImage('assets/images/bg-image-2.jpeg'),
//                               fit: BoxFit.fitHeight
//                           ),
//                         ),
//                       ),
//                       Container(
//                         color: const Color.fromRGBO(255, 255, 255, 0.19),
//                       ),
//                       Container(
//                         alignment: const Alignment(-0.75, 0.65),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                           child: SizedBox(
//                             width: 250.0,
//                             child: AnimatedTextKit(
//                               animatedTexts: [
//                                 TypewriterAnimatedText(
//                                   'National Museum of the Republic of Kazakhstan',
//                                   textStyle: const TextStyle(
//                                       fontSize: 40.0,
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.white
//                                   ),
//                                   speed: const Duration(milliseconds: 100),
//                                 ),
//                               ],
//                               totalRepeatCount: 10,
//                               pause: const Duration(milliseconds: 1000),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   Stack(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           image: DecorationImage(
//                               colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
//                               image: const AssetImage('assets/images/bg-image-3.jpeg'),
//                               fit: BoxFit.fitHeight
//                           ),
//                         ),
//                       ),
//                       Container(
//                         color: const Color.fromRGBO(255, 255, 255, 0.19),
//                       ),
//                       Container(
//                         alignment: const Alignment(-0.75, 0.65),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                           child: SizedBox(
//                             width: 250.0,
//                             child: AnimatedTextKit(
//                               animatedTexts: [
//                                 TypewriterAnimatedText(
//                                   'National Museum of the Republic of Kazakhstan',
//                                   textStyle: const TextStyle(
//                                       fontSize: 40.0,
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.white
//                                   ),
//                                   speed: const Duration(milliseconds: 100),
//                                 ),
//                               ],
//                               totalRepeatCount: 10,
//                               pause: const Duration(milliseconds: 1000),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//                   carouselController: buttonCarouselController
//               ),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => buttonCarouselController.nextPage(
//             duration: const Duration(milliseconds: 300), curve: Curves.linear),
//         child: const Text('→'),
//       ),
//     );
//   }
// }



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