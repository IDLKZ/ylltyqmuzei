import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:ylltyqmuzei/constants/constants.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/models/models.dart';
import 'package:ylltyqmuzei/screens/qr_screen.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:ylltyqmuzei/widgets/audio_player.dart';
import 'package:ylltyqmuzei/widgets/youtube_player.dart';
import 'package:lottie/lottie.dart';

class SingleModel extends StatelessWidget {

  late Future<Model> model;

  SingleModel({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    model = ThirdModelsProvider().getSingleModelByAlias(alias);
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<Model>(
        future: model,
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
                                    fit: BoxFit.contain
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
                                     snapshot.data!.wavefront != null
                                        ?  Container(
                                      alignment: const Alignment(1, 1),
                                      child: Card(
                                        color: Colors.black.withOpacity(0.5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.accessibility, size: 35,),
                                            onPressed: () {
                                              Navigator.pushNamed(context,"/webView",arguments: snapshot.data!.alias.toString());
                                            },
                                            color: Colors.white,
                                            tooltip: "?????? ?? 360",
                                          ),
                                        ),
                                      ),
                                    )
                                        :
                                         const SizedBox(),
                                  ],
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

                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
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
                              "description".tr,
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Text(
                              snapshot.data!.getDescription(),
                            ),
                            const SizedBox(height: 20,),
                            snapshot.data!.getAudio() != null ? Text(
                              "audio_guide".tr,
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                            ) : SizedBox(),
                            const SizedBox(height: 20,),
                            snapshot.data!.getAudio() != null ? AudioPlayer(url: snapshot.data!.getAudio(), color: Constants.kMainColor, progressBar: Colors.black,) : SizedBox(),
                            const SizedBox(height: 20,),
                            snapshot.data!.getVideo() != null ? Text(
                              "video_guide".tr,
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                              ),
                            ) : SizedBox(),
                            const SizedBox(height: 20,),
                            snapshot.data!.getVideo() != null ? Youtube(url: snapshot.data!.getVideo(),) : SizedBox(),


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
