import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/models/news.dart';
import 'package:ylltyqmuzei/services/api.dart';

class SingleNews extends StatefulWidget {

  @override
  _SingleNewsState createState() => _SingleNewsState();
}

class _SingleNewsState extends State<SingleNews> {
  late Future<News> news;
  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    News news = args.arguments as News;
    return Scaffold(
      backgroundColor: Colors.black,
      body: news != null
        ? Column(
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
                                        Mixin().getNewsImage(news.image)),
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
                              Text(news.getTitle() ?? "",
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20,),
                              Text(news.activeFrom ?? "",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20,),
                              Mixin().getHTML(news.getDescription()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
        : Center(child: CircularProgressIndicator(),)
    );
  }
}
