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
                    const Text("3D Туры ", style: TextStyle(fontSize: 30),),
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.tours.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/tour', arguments: snapshot.data!.tours[index].alias);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                    // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                      image:  NetworkImage(Mixin().getImage(snapshot.data!.tours[index].image)),
                                      fit: BoxFit.cover
                                  ),

                                ),
                                margin: const EdgeInsets.only(top:10,bottom: 10),
                                height: 220,
                                alignment: const Alignment(-0.7, 0.7),
                                child: Text(snapshot.data!.tours[index].titleRu, style: const TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.w700),),
                              ),
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
