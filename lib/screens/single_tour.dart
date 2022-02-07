import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/models/tours.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:ylltyqmuzei/widgets/audio_player.dart';
import 'package:ylltyqmuzei/widgets/my_appbar.dart';
import 'package:ylltyqmuzei/widgets/nav_bar.dart';
import 'package:ylltyqmuzei/widgets/youtube_player.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SingleTour extends StatefulWidget {
  const SingleTour({Key? key}) : super(key: key);

  @override
  _SingleTourState createState() => _SingleTourState();
}

class _SingleTourState extends State<SingleTour> {
  late Future<Tour> tour;

  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    tour = TourProvider().getSingleTourByAlias(alias);
    return Scaffold(
      appBar: const MyAppBar(),
      drawer: const NavBar(),
      backgroundColor: Colors.black,
      body: FutureBuilder<Tour>(
        future: tour,
        builder: (context, snapshot){
          if(!snapshot.hasError){
            if(snapshot.hasData){
              return Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height/2,
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
                                            FontAwesomeIcons.hiking, size: 35,),
                                          onPressed: () {
                                            Navigator.pushNamed(context,"/panoramaView",arguments: snapshot.data!.alias.toString());
                                          },
                                          color: Colors.white,
                                          tooltip: "Тур в 360",
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
                      )
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20,right: 20,left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data!.getTitle() ?? "",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                'description'.tr,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                snapshot.data!.getDescription() ?? "",
                              ),
                              const SizedBox(height: 20,),
                              snapshot.data!.getAudio()!= null ? Text(
                                "audio_guide".tr,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),
                              ) : SizedBox(),
                              const SizedBox(height: 20,),
                              snapshot.data!.getAudio()!= null ? AudioPlayer(url:snapshot.data!.getAudio(),) : SizedBox(),
                              const SizedBox(height: 20,),
                              snapshot.data!.getVideo()!= null ? Text(
                                "video_guide".tr,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),
                              ) : SizedBox(),
                              const SizedBox(height: 20,),
                              snapshot.data!.getVideo()!= null ? Youtube(url: snapshot.data!.getVideo(),) : SizedBox(),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Colors.redAccent,),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.redAccent,),
            );
          }
        },
      ),
    );
  }
}
