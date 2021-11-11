import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/models/models.dart';
import 'package:welcome/services/api.dart';


class SingleModel extends StatelessWidget {

  late Future<Model> model;

  SingleModel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    model = ThirdModelsProvider().getSingleModelByAlias(alias);
    return Scaffold(
      body: FutureBuilder<Model>(
        future: model,
        builder: (context, snapshot){
          if(!snapshot.hasError){
            if(snapshot.hasData){
              return Column(
                children: [
                  Expanded(
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
                                            Icons.accessibility, size: 35,),
                                          onPressed: () {
                                            Navigator.pushNamed(context,"/tours",arguments: snapshot.data!.id.toString());
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
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                        ),
                      )
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
