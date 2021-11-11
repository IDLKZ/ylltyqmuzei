import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/models/models.dart';
import 'package:welcome/services/api.dart';

class ThirdModels extends StatefulWidget {
  const ThirdModels({Key? key}) : super(key: key);

  @override
  _ThirdModelsState createState() => _ThirdModelsState();
}

class _ThirdModelsState extends State<ThirdModels> {
  late RouteSettings args;
  late Future<ModelList> models;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings;
    String id = args.arguments as String;
    models = ThirdModelsProvider().getModelsByHallId(id);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<ModelList>(
          future: models,
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1 / 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: snapshot.data!.modelList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Card(
                          elevation:7,
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(Mixin().getImage(snapshot.data!.modelList[index].image)),
                                  )),
                                ),
                                Container(
                                  child: Text(
                                      snapshot.data!.modelList[index].titleRu,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,

                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
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
