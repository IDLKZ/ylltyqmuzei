import 'package:flutter/material.dart';
import 'package:welcome/locale_string.dart';
import 'package:welcome/screens/about_screen.dart';
import 'package:welcome/screens/contact_screen.dart';
import 'package:welcome/screens/faq_screen.dart';
import 'package:welcome/screens/home_screen.dart';
import 'package:welcome/screens/news.dart';
import 'package:welcome/screens/panorama_view.dart';
import 'package:welcome/screens/qr_screen.dart';
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

void main() {
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
      title: 'InIt',
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: const Locale('ru'),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        "/hall":(context)=>const SingleHalls(),
        "/tours":(context)=> Tours(),
        '/tour': (context) => const SingleTour(),
        "/thirdModels":(context)=> const ThirdModels(),
        '/model': (context) => SingleModel(),
        '/webView': (context) => const WebViewModel(),
        '/panoramaView':(context)=>PanoramaView(),
        "/news":(context)=>const NewsScreen(),
        "/stocks":(context)=>const StockScreen(),
        "/singleNews":(context)=>SingleNews(),
        '/about':(context)=>const AboutScreen(),
        '/faqs':(context)=>const FaqScreen(),
        '/qr':(context)=>const QrScreen(),
        '/contact':(context)=> const ContactScreen()
      },
    );
  }
}


