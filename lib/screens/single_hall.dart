import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/models/halls.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ylltyqmuzei/widgets/audio_player.dart';
import 'package:ylltyqmuzei/widgets/my_appbar.dart';
import 'package:ylltyqmuzei/widgets/nav_bar.dart';
import 'package:ylltyqmuzei/widgets/youtube_player.dart';

class SingleHalls extends StatefulWidget {
  const SingleHalls({Key? key}) : super(key: key);

  @override
  _SingleHallsState createState() => _SingleHallsState();
}

class _SingleHallsState extends State<SingleHalls> {
  late Future <Hall> hall;
  late int currentIndex = 0;
  CarouselController buttonCarouselController = CarouselController();

  final colorizeColors = [
    const Color(0xffE3AF2A),
    const Color(0xff080706),
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: 36.0,
    fontFamily: 'Philosopher',
  );


  Widget myCarousel(dynamic snapshot){

    return CarouselSlider(
      carouselController: buttonCarouselController,
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
          initialPage: 0,
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          height: MediaQuery.of(context).size.height,
        // autoPlay: false,
      ),
      items: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7),
                          BlendMode.dstATop),
                      image: NetworkImage(
                          Mixin().getImage(snapshot.data!.image)),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Container(
                color: const Color.fromRGBO(
                    21, 18, 18, 0.18823529411764706),
              ),
              ListView(
                reverse: true,
                children: [
                  SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DefaultTextStyle(
                              style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color:Color(-285354647)
                              ),
                              child: AnimatedTextKit(
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    ColorizeAnimatedText(
                                      snapshot.data!.getTitle(),
                                      textStyle: colorizeTextStyle,
                                      colors: colorizeColors,
                                    ),
                                    // TyperAnimatedText(
                                    //     snapshot.data!.getTitle(),
                                    //   textStyle: const TextStyle(fontFamily: 'Philosopher')
                                    // ),
                                  ]
                              ),

                            ),
                            const SizedBox(height: 20,),
                            DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                              child: AnimatedTextKit(
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  // ColorizeAnimatedText(
                                  //   snapshot.data!.getDescription(),
                                  //   speed: const Duration(milliseconds: 10),
                                  //   textStyle: const TextStyle(fontFamily: 'Philosopher', fontSize: 18),
                                  //   colors: colorizeColors,
                                  // ),
                                  TypewriterAnimatedText(
                                    snapshot.data!.getDescription(),
                                    speed: const Duration(milliseconds: 10),
                                    textStyle: const TextStyle(fontFamily: 'Philosopher')
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )

                  ),
                ],
              ),
              SafeArea(
                  child: Container(
                    alignment: const Alignment(-1, -1),
                    child: Card(
                      color: Colors.black.withOpacity(0.5),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,

                      ),
                    ),
                  )
              ),
              SafeArea(
                  child: Column(
                    children: [
                      snapshot.data!.tourUrl != null
                      ? Container(
                        alignment: const Alignment(1, 1),
                        child: Card(
                          color: Colors.black.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: const Icon(
                                Icons.account_balance, size: 35,),
                              onPressed: () {
                                Navigator.pushNamed(context,"/tours",arguments: snapshot.data!.tourUrl.toString());
                              },
                              color: Colors.white,
                              tooltip: "?????? ?? 360",
                            ),
                          ),
                        ),
                      )
                      :const SizedBox(height: 1,),
                      const SizedBox(height: 20,),
                      Container(
                        alignment: const Alignment(1, 1),
                        child: Card(
                          color: Colors.black.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.cubes, size: 35,),
                              onPressed: () {
                                Navigator.pushNamed(context, "/thirdModels",arguments: snapshot.data!.id.toString());
                              },
                              color: Colors.white,
                              tooltip: "??????????????????",
                            ),
                          ),
                        ),
                      ),

                    ],
                  )
              ),

            ],
          ),
        ),
        Stack(
          children: [
            Container(
              decoration:  BoxDecoration(
                image:  DecorationImage(
                  image:  NetworkImage(Mixin().getImage(snapshot.data!.image)),
                  fit: BoxFit.cover,
                ),
              ),
              child:  BackdropFilter(
                filter:  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child:  Container(
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                ),
              ),
            ),
            Center(
                child:Youtube(url: snapshot.data!.getVideo(),)
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              decoration:  BoxDecoration(
                image:  DecorationImage(
                  image:  NetworkImage(Mixin().getImage(snapshot.data!.image)),
                  fit: BoxFit.cover,
                ),
              ),
              child:  BackdropFilter(
                filter:  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child:  Container(
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                ),
              ),
            ),

            SafeArea(
                child:  Center(
                  child: ListView(
                    shrinkWrap: true,
              children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(Mixin().getImage(snapshot.data!.image)),
                      const SizedBox(height: 10,),
                      const Text("???????????? ???????????? ?????????????? ??:", style:TextStyle(fontSize: 20, color:Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      Text(snapshot.data!.getTitle(), style:const TextStyle(fontSize: 20, color:Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      AudioPlayer(url: snapshot.data!.getAudio(),)
                    ],
                  ),
                  ],
              ),
                )

            ),

          ],
        ),
      ],

    );
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    hall = HallProvider().getSingleHall(alias);

    return Scaffold(
      extendBody: true,
        body: FutureBuilder<Hall>(
          future: hall,
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              if (snapshot.hasData) {
                return myCarousel(snapshot);
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.redAccent,),
                );
              }
            }
            else {
              return const Center(
                child: CircularProgressIndicator(color: Colors.redAccent,),
              );
            }
          },
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (currentInd){setState(() {
          currentIndex = currentInd;
           buttonCarouselController.jumpToPage(currentInd);
        });

        },
        backgroundColor: Colors.black.withOpacity(0.1),
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white,
        elevation: 0,// transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: const Icon(Icons.info,size: 50,),label: "info".tr),
          BottomNavigationBarItem(icon: const Icon(Icons.video_call,size: 50,),label: "video_guide".tr),
          BottomNavigationBarItem(icon: const Icon(Icons.headset,size: 50,),label: "audio_guide".tr),
        ],
      ),
    );
  }
}
