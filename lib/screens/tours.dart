import 'package:flutter/material.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/models/tours.dart';
import 'package:welcome/services/api.dart';

class Tours extends StatelessWidget {
  late Future<TourList> tours;

  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    tours = TourProvider().getToursByHallId(alias);

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<TourList>(
          future: tours,
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text("3D Туры "),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.tours.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(const Radius.circular(20)),
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    image:  NetworkImage(Mixin().getImage(snapshot.data!.tours[index].image)),
                                    fit: BoxFit.cover
                                ),

                              ),
                              margin: EdgeInsets.only(top:10,bottom: 10),
                              height: 220,

                              child: Text(snapshot.data!.tours[index].titleRu),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.redAccent,
                ),
              );
            }
          },
        ),

      ),
    );
  }
}
