import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/models/tours.dart';
import 'package:welcome/services/api.dart';

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
      body: FutureBuilder<Tour>(
        future: tour,
        builder: (context, snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.hasData) {
              return Center(
                child: Panorama(
                  child: Image.network(Mixin().getImage(snapshot.data!.panorama)),
                ),
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
      )
    );
  }
}
