import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ylltyqmuzei/constants/constants.dart';
import 'package:ylltyqmuzei/models/about.dart';
import 'package:ylltyqmuzei/models/events.dart';
import 'package:ylltyqmuzei/models/faqs.dart';
import 'package:ylltyqmuzei/models/halls.dart';
import 'package:ylltyqmuzei/models/models.dart';
import 'package:ylltyqmuzei/models/news.dart';
import 'package:ylltyqmuzei/models/services.dart';
import 'package:ylltyqmuzei/models/showcases.dart';
import 'package:ylltyqmuzei/models/stocks.dart';
import 'package:ylltyqmuzei/models/survey.dart';
import 'package:ylltyqmuzei/models/tours.dart';

class HallProvider {
  Future<HallList> getHall() async {
    
    final response = await http.get(Uri.parse(Constants.apiUrl + 'halls'));
    if(response.statusCode == 200){
      return HallList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }

  Future <Hall> getSingleHall(String alias) async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'single-hall/' + alias));
    if(response.statusCode == 200){
      return Hall.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }

  
}

class TourProvider{
  Future<TourList> getToursByHallId(String hallId) async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'tours/'+ hallId));
    if(response.statusCode == 200){
      return TourList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }

  Future <Tour> getSingleTourByAlias(String alias) async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'single-tour/'+ alias));
    if(response.statusCode == 200){
      return Tour.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
}
class ThirdModelsProvider{
  Future<ModelList> getModelsByHallId(String hallId) async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'thirdModels/'+ hallId));
    if(response.statusCode == 200){
      return ModelList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }

  Future <Model> getSingleModelByAlias(String alias) async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'single-thirdModel/'+ alias));
    if(response.statusCode == 200){
      return Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }

  Future <ModelList> getModelByShowcase(String showcaseId) async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'showcaseThirdModel/'+ showcaseId));
    if(response.statusCode == 200){
      return ModelList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
}

class NewsModelsProvider{


  Future <ListNews> getAllNews(int page)async{
    final response = await http.get(Uri.parse(Constants.apiNEWS + "&page=$page"));
    if(response.statusCode == 200){
      return ListNews.fromJson(jsonDecode(utf8.decode(response.bodyBytes)),page);
    } else {
      throw Exception('Server not connected');
    }
  }
  Future <News> getSingleNews(String alias)async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'single-news/'+ alias));
    if(response.statusCode == 200){
      return News.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }

  Future<ListStocks> getAllStock(int page)async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'stocks?page=$page'));
    if(response.statusCode == 200){
      return ListStocks.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }

  Future <Stocks> getSingleStock(String alias)async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'single-news/'+ alias));
    if(response.statusCode == 200){
      return Stocks.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }

}

class FaqProvider {
  Future<FaqList> getFaq() async {
    final response = await http.get(Uri.parse(Constants.apiUrl + 'faq'));
    if(response.statusCode == 200){
      return FaqList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
}

class AboutProvider {
  Future<About> getAbout() async {
    final response = await http.get(Uri.parse(Constants.apiUrl + 'about'));
    if(response.statusCode == 200){
      return About.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
}


class ShowcaseProvider{
  Future <Showcase> getSingleShowcaseByAlias(String alias) async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'showcases/'+ alias));
    if(response.statusCode == 200){
      return Showcase.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
}

class SendFormProvider{
  Future <bool> sendForm(Map<String,dynamic> data) async {
    final response = await http.post(Uri.parse(Constants.apiUrl + 'send-form',),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data)
    );

    if(response.statusCode == 200){
      return true;
    } else {
      return false;
    }
  }
}

class ServiceProvider{
  Future <ListServices> getAllNews(int page)async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'services?page=$page'));
    if(response.statusCode == 200){
      return ListServices.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
  Future <Service> getSingleService(String alias)async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'serviceSingle/'+ alias));
    if(response.statusCode == 200){
      return Service.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
}

class EventProvider{
  Future <ListEvents> getAllEvents(int page)async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'events?page=$page'));
    if(response.statusCode == 200){
      return ListEvents.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
  Future <Event> getSingleEvent(String alias)async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'singleEvent/'+ alias));
    if(response.statusCode == 200){
      return Event.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
}

class SurveyProvider{
  Future<SurveyList> getAllSurvey() async{
    final response = await http.get(Uri.parse(Constants.apiUrl + "surveys"));
    if(response.statusCode == 200){
      return SurveyList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }
  Future<Survey> getSingleSurvey(String alias) async{
    final response = await http.get(Uri.parse(Constants.apiUrl + "survey/" + alias));
    if(response.statusCode == 200){
      return Survey.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Server not connected');
    }
  }

}