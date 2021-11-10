import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/models/halls.dart';
import 'package:welcome/services/api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:welcome/widgets/audio_player.dart';
import 'package:welcome/widgets/youtube_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SingleHalls extends StatefulWidget {
  const SingleHalls({Key? key}) : super(key: key);

  @override
  _SingleHallsState createState() => _SingleHallsState();
}

class _SingleHallsState extends State<SingleHalls> {
  late Future <Hall> hall;
  late int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    hall = HallProvider().getSingleHall(alias);
    CarouselController buttonCarouselController = CarouselController();

    return Scaffold(
      extendBody: true,
        body: FutureBuilder<Hall>(
          future: hall,
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              if (snapshot.hasData) {
                return CarouselSlider(
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
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
                                  Container(
                                    alignment: const Alignment(1, 1),
                                    child: Card(
                                      color: Colors.black.withOpacity(0.5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.account_balance, size: 35,),
                                          onPressed: () {
                                            Navigator.pushNamed(context,"/tours",arguments: snapshot.data!.id.toString());
                                          },
                                          color: Colors.white,
                                          tooltip: "Тур в 360",
                                        ),
                                      ),
                                    ),
                                  ),
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
                                            Navigator.pop(context);
                                          },
                                          color: Colors.white,
                                          tooltip: "Экспонаты",
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              )
                          ),
                          SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    DefaultTextStyle(
                                      style: const TextStyle(
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold,
                                          color:Color(-285354647)
                                      ),
                                      child: AnimatedTextKit(
                                          totalRepeatCount: 3,
                                          pause: const Duration(seconds: 3),
                                          animatedTexts: [
                                            TyperAnimatedText(
                                                snapshot.data!.titleRu),
                                          ]
                                      ),

                                    ),
                                    const SizedBox(height: 20,),
                                    DefaultTextStyle(
                                      style: const TextStyle(
                                        fontSize: 25.0,
                                      ),
                                      child: AnimatedTextKit(
                                        totalRepeatCount: 3,
                                        pause: const Duration(seconds: 3),
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                              snapshot.data!.descriptionRu
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
                          child:Youtube(url: snapshot.data!.videoRu,)
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
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image.network(Mixin().getImage(snapshot.data!.image)),
                             const SizedBox(height: 10,),
                             const Text("Сейчас играет подкаст к:", style:TextStyle(fontSize: 20, color:Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                             Text(snapshot.data!.titleRu, style:const TextStyle(fontSize: 20, color:Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                             AudioPlayer(url: snapshot.data!.audioRu,)
                           ],
                         ),
                       ),

                      ],
                    ),
                  ],

                );
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
        });},
        backgroundColor: Colors.black.withOpacity(0.1),
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white,
        elevation: 0,// transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
        items:   const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.info,size: 50,),title: Text("Инфо")),
          BottomNavigationBarItem(icon: Icon(Icons.video_call,size: 50,),title: Text("ВидеоТур")),
          BottomNavigationBarItem(icon: Icon(Icons.headset,size: 50,),title: Text("АудиоГид")),
        ],
      ),
    );
  }
}