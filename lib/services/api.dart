import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:welcome/constants/constants.dart';
import 'package:welcome/models/faqs.dart';
import 'package:welcome/models/halls.dart';
import 'package:welcome/models/models.dart';
import 'package:welcome/models/news.dart';
import 'package:welcome/models/tours.dart';

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
}

class NewsModelsProvider{


  Future <ListNews> getAllNews(int page)async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'news?page=$page'));
    if(response.statusCode == 200){
      return ListNews.fromJson(jsonDecode(response.body));
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

  Future <ListNews> getAllStock(int page)async{
    final response = await http.get(Uri.parse(Constants.apiUrl + 'stocks?page=$page'));
    if(response.statusCode == 200){
      return ListNews.fromJson(jsonDecode(response.body));
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