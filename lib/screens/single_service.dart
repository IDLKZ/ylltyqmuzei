import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/services/api.dart';
import 'package:welcome/models/services.dart';

class SingleService extends StatefulWidget {

  @override
  _SingleServiceState createState() => _SingleServiceState();
}

class _SingleServiceState extends State<SingleService> {
  late Future<Service> service;
  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    service = ServiceProvider().getSingleService(alias);
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<Service>(
        future: service,
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
                              Text(
                                snapshot.data!.getDescription() ?? "",
                              ),
                              Divider(color: Colors.white12,height: 2,),
                              const SizedBox(height: 20,),
                              Text(
                                snapshot.data!.getPricing() ?? "",
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
