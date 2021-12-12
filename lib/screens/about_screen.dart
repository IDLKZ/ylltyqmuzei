import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welcome/constants/constants.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/models/about.dart';
import 'package:welcome/services/api.dart';
import 'package:welcome/widgets/my_appbar.dart';
import 'package:welcome/widgets/nav_bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late Future<About> about;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    about = AboutProvider().getAbout();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<About>(
      future: about,
        builder: (context, snapshot) {
          if(!snapshot.hasError){
            if(snapshot.hasData){
              return Scaffold(
                appBar: MyAppBar(),
                drawer: NavBar(),
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Container(
                            decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(Mixin().getImage(snapshot.data!.image)),
                                    fit: BoxFit.cover
                                ),
                                // borderRadius: BorderRadius.circular(200),
                                // border: Border.all(color: const Color(0xFFffffff), width: 2)
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(snapshot.data!.getTitle(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, fontFamily: 'Lora'), textAlign: TextAlign.center,),
                                const SizedBox(height: 30,),
                                Text(snapshot.data!.getDescription(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Lora'),)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator(color: Colors.red,),);
            }
          } else {
            return const Center(child: CircularProgressIndicator(color: Colors.red,),);
          }
        }
    );
  }
}
