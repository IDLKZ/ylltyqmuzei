import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ylltyqmuzei/screens/about_screen.dart';
import 'package:ylltyqmuzei/screens/contact_screen.dart';
import 'package:ylltyqmuzei/screens/events_screen.dart';
import 'package:ylltyqmuzei/screens/faq_screen.dart';
import 'package:ylltyqmuzei/screens/greeting_screen.dart';
import 'package:ylltyqmuzei/screens/home_screen.dart';
import 'package:ylltyqmuzei/screens/news.dart';
import 'package:ylltyqmuzei/screens/panorama_view.dart';
import 'package:ylltyqmuzei/screens/payment_screen.dart';
import 'package:ylltyqmuzei/screens/qr_screen.dart';
import 'package:ylltyqmuzei/screens/questionnaire_screen.dart';
import 'package:ylltyqmuzei/screens/services_screen.dart';
import 'package:ylltyqmuzei/screens/showcase_model.dart';
import 'package:ylltyqmuzei/screens/showcase_screen.dart';
import 'package:ylltyqmuzei/screens/singleStock.dart';
import 'package:ylltyqmuzei/screens/single_event.dart';
import 'package:ylltyqmuzei/screens/single_hall.dart';
import 'package:ylltyqmuzei/screens/single_model.dart';
import 'package:ylltyqmuzei/screens/single_news.dart';
import 'package:ylltyqmuzei/screens/single_service.dart';
import 'package:ylltyqmuzei/screens/single_tour.dart';
import 'package:ylltyqmuzei/screens/stocks.dart';
import 'package:ylltyqmuzei/screens/survey_screen.dart';
import 'package:ylltyqmuzei/screens/third_models.dart';
import 'package:ylltyqmuzei/screens/tours.dart';
import 'package:ylltyqmuzei/screens/web_view.dart';
import 'package:ylltyqmuzei/screens/welcome_screen.dart';
import 'package:ylltyqmuzei/services/myHttpClient.dart';

import 'locale_string.dart';
import 'mixins/mixins.dart';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  String currentLocale = await Mixin.getCurrentLocale();
  String currentRoute = await Mixin.getCurrentRoute();
  runApp(Start(currentLocale: currentLocale,currentRoute: currentRoute,));
}

class Start extends StatelessWidget {
    late String currentLocale;
    late String currentRoute;
    Start({Key? key, required this.currentLocale, required this.currentRoute}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: 'QazMuseum',
      theme: ThemeData(
        fontFamily: "Philosopher"
      ),
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale:Locale(currentLocale),
      initialRoute: currentRoute,
      routes: {
        '/': (context) => const WelcomeScreen(),
        "/greeting":(context)=> const GreetingsScreen(),
        '/home': (context) => const HomeScreen(),
        "/hall":(context)=>const SingleHalls(),
        "/tours":(context)=> Tours(),
        '/tour': (context) => const SingleTour(),
        "/thirdModels":(context)=> const ThirdModels(),
        "/thirdShowcaseModels":(context)=> const ShowcaseModels(),
        '/model': (context) => SingleModel(),
        '/webView': (context) => const WebViewModel(),
        '/panoramaView':(context)=>PanoramaView(),
        "/news":(context)=>const NewsScreen(),
        "/stocks":(context)=>const StockScreen(),
        "/singleNews":(context)=>SingleNews(),
        "/singleStocks":(context)=>SingleStock(),
        "/showCase":(context)=>const ShowcaseScreen(),
        '/about':(context)=>const AboutScreen(),
        '/faqs':(context)=>const FaqScreen(),
        '/qr':(context)=>const QrScreen(),
        '/services':(context)=>const ServicesScreen(),
        '/singleServices':(context)=>SingleService(),
        "/events":(context)=>const EventsScreen(),
        "/singleEvent":(context)=>SingleEvent(),
        '/payment':(context)=>const PaymentScreen(),
        '/questionnaire':(context)=>const QuestionnaireScreen(),
        '/singleSurvey':(context)=>SurveyScreen(),
        '/contact':(context)=> const ContactScreen()
      },
    );
  }
}


