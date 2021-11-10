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
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.tours.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      color: Colors.blue,
                      child: Text(snapshot.data!.tours[index].titleRu),
                    );
                  },
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
