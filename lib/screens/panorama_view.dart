import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/models/tours.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:ylltyqmuzei/widgets/audio_player.dart';
import 'package:ylltyqmuzei/widgets/youtube_player.dart';

class PanoramaView extends StatelessWidget {
  late Future<Tour> tour;


  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    tour = TourProvider().getSingleTourByAlias(alias);
    return Scaffold(
        body: Stack(
            children: [
              FutureBuilder<Tour>(
                future: tour,
                builder: (context, snapshot) {
                  if (!snapshot.hasError) {
                    if (snapshot.hasData) {
                      return Stack(
                        children: [
                          Panorama(
                            child: Image.network(Mixin().getImage(snapshot.data!.panorama)),
                          ),
                          SafeArea(
                              child:Container(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    snapshot.data!.prevTour != null ?
                                        FloatingActionButton(
                                          heroTag: "prev",
                                      backgroundColor: Colors.blueGrey,
                                      onPressed: (){
                                        Navigator.pushNamed(context,"/panoramaView",arguments: snapshot.data!.prevTour!.alias.toString());
                                      },
                                          child: Icon(Icons.arrow_back),
                                      tooltip: "Предыдущий. тур",
                                       ):const SizedBox(),

                                    snapshot.data!.nextTour != null ?
                                    FloatingActionButton(
                                      heroTag: "next",
                                      backgroundColor: Colors.blueGrey,
                                      onPressed: (){
                                        Navigator.pushNamed(context,"/panoramaView",arguments: snapshot.data!.nextTour!.alias.toString());
                                      },
                                      child: const Icon(Icons.arrow_forward),
                                      tooltip: "Сл. тур",
                                    ):const SizedBox(),

                                  ],
                                ),
                              )

                          )
                        ]
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

            ]
        )
    );
  }
}
