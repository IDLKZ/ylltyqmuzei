import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome/constants/constants.dart';
import 'package:welcome/mixins/mixins.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static const List<Map> languagesApp = [
    {"title":"Русский язык","code":"ru"},
    {"title":"Қазақ тілі","code":"kz"},
    {"title":"English Language","code":"en"},
    {"title":"Deutsche Sprache","code":"de"},
    {"title":"Français","code":"fr"},
    {"title":"Español","code":"es"},
    {"title":"Türkçe","code":"tr"},
  ];
  CarouselController buttonCarouselController = CarouselController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    initialPage: currentPage,
                    enableInfiniteScroll: false,
                    height: height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    onPageChanged: (index,reason){
                      setState(() {
                          currentPage = index;
                      });
                    }
                    // autoPlay: false,
                  ),
                  items: <Widget>[
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                image: const AssetImage('assets/images/bg-image-1.jpeg'),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(
                              0, 0, 0, 0.18823529411764706),
                        ),
                        SafeArea(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(image:AssetImage("assets/images/logo.png"),height: 150,),
                                SizedBox(height: 20,),
                                const Text("Добро пожаловать,Пожалуйста выберите язык!",style: TextStyle(fontSize: 22, color: Colors.white,fontWeight: FontWeight.w600),textAlign: TextAlign.center),
                                const Text("Қош келдіңіз, Тілді таңдаңыз!",style: TextStyle(fontSize: 22, color: Colors.white,fontWeight: FontWeight.w600),textAlign: TextAlign.center),
                                const Text("Welcome, Please choose a language!",style: TextStyle(fontSize: 22, color: Colors.white,fontWeight: FontWeight.w600),textAlign: TextAlign.center),
                                const SizedBox(height: 20,),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)),

                                  child: DropdownButton<String>(

                                    value: Get.locale!.languageCode,
                                    icon: const Icon(Icons.language, color:  Constants.kMainColor,),
                                    iconSize: 24,
                                    style: const TextStyle(color: Constants.kMainColor),
                                    dropdownColor: Colors.white,
                                    underline: Container(
                                      height: 0,
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? newValue) async {
                                      String langLocale = newValue ?? "ru";
                                      setState(() {
                                        Get.updateLocale(Locale(langLocale));
                                      });
                                      Mixin.setShared("langLocale", langLocale);
                                    },
                                    items: languagesApp.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value["code"],
                                        child: Text(value["title"] ?? "Рус"),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                image: const AssetImage('assets/images/bg-image.png'),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(
                              0, 0, 0, 0.18823529411764706),
                        ),
                        Container(
                          alignment: const Alignment(-0.75, 0.65),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SizedBox(
                              width: 250.0,
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'welcome_1'.tr,
                                    textStyle: const TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white
                                    ),
                                    speed: const Duration(milliseconds: 100),
                                  ),
                                ],
                                totalRepeatCount: 10,
                                pause: const Duration(milliseconds: 1000),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                image: const AssetImage('assets/images/bg-image-2.jpeg'),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(
                              0, 0, 0, 0.18823529411764706),
                        ),
                        Container(
                          alignment: const Alignment(-0.75, 0.65),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SizedBox(
                              width: 250.0,
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'welcome_2'.tr,
                                    textStyle: const TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white
                                    ),
                                    speed: const Duration(milliseconds: 100),
                                  ),
                                ],
                                totalRepeatCount: 10,
                                pause: const Duration(milliseconds: 1000),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                image: const AssetImage('assets/images/bg-image-3.jpeg'),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Container(
                          color: const Color.fromRGBO(
                              0, 0, 0, 0.18823529411764706),
                        ),
                        Container(
                          alignment: const Alignment(-0.75, 0.65),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: SizedBox(
                              width: 250.0,
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'welcome_3'.tr,
                                    textStyle: const TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white
                                    ),
                                    speed: const Duration(milliseconds: 100),
                                  ),
                                ],
                                totalRepeatCount: 10,
                                pause: const Duration(milliseconds: 1000),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                  carouselController: buttonCarouselController
              ),
            ],
          );
        },
      ),
      floatingActionButton: currentPage < 3 ? FloatingActionButton(
        backgroundColor: Colors.black12,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        mini: false,
        shape: const CircleBorder(
            side:  BorderSide(color: Colors.white)
        ),
        onPressed: (){
          buttonCarouselController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.linear);
        },
        child: const Icon(Icons.arrow_forward_ios, size: 30,color: Colors.white),
      ) :
      ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.white)
                  )
              )
          ),
        onPressed: () async{
            Mixin.setShared("welcome", true);
            Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route)=>false);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,8,10,8),
          child:  Text('start'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
      )
    );
  }
}


