import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/models/events.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:ylltyqmuzei/models/services.dart';

class SingleEvent extends StatefulWidget {

  @override
  _SingleEventState createState() => _SingleEventState();
}

class _SingleEventState extends State<SingleEvent> {
  late Future<Event> event;
  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    event = EventProvider().getSingleEvent(alias);
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<Event>(
        future: event,
        builder: (context, snapshot){
          if(!snapshot.hasError){
            if(snapshot.hasData){
              return Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height/2,
                      child: Container(
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
                          ],
                        ),
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
                              Text(snapshot.data!.getTitle(),
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20,),
                              RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(text: snapshot.data!.dateStart,style: TextStyle(color: Colors.black)),
                                      TextSpan(text: "-",style: TextStyle(color: Colors.black)),
                                      TextSpan(text: snapshot.data!.dateEnd,style: TextStyle(color: Colors.black)),
                                    ]
                                ),

                              ),
                              const SizedBox(height: 20,),
                              Text(
                                snapshot.data!.getDescription(),
                              ),
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
