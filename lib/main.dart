import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:welcome/locale_string.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/screens/about_screen.dart';
import 'package:welcome/screens/contact_screen.dart';
import 'package:welcome/screens/faq_screen.dart';
import 'package:welcome/screens/greeting_screen.dart';
import 'package:welcome/screens/home_screen.dart';
import 'package:welcome/screens/news.dart';
import 'package:welcome/screens/panorama_view.dart';
import 'package:welcome/screens/payment_screen.dart';
import 'package:welcome/screens/qr_screen.dart';
import 'package:welcome/screens/services_screen.dart';
import 'package:welcome/screens/showcase_model.dart';
import 'package:welcome/screens/showcase_screen.dart';
import 'package:welcome/screens/single_hall.dart';
import 'package:welcome/screens/single_model.dart';
import 'package:welcome/screens/single_news.dart';
import 'package:welcome/screens/single_tour.dart';
import 'package:welcome/screens/stocks.dart';
import 'package:welcome/screens/third_models.dart';
import 'package:welcome/screens/tours.dart';
import 'package:welcome/screens/web_view.dart';
import 'package:welcome/screens/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:welcome/services/myHttpClient.dart';

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
    Start({required this.currentLocale, required this.currentRoute});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: 'QAZMUSEUM',
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
        "/showCase":(context)=>const ShowcaseScreen(),
        '/about':(context)=>const AboutScreen(),
        '/faqs':(context)=>const FaqScreen(),
        '/qr':(context)=>const QrScreen(),
        '/services':(context)=>const ServicesScreen(),
        '/payment':(context)=>const PaymentScreen(),
        '/contact':(context)=> const ContactScreen()
      },
    );
  }
}


