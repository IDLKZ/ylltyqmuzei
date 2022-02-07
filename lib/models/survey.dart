
import 'package:ylltyqmuzei/models/lang_model.dart';

class SurveyList{
  List <Survey> surveyList = [];

  SurveyList({required this.surveyList});

  factory SurveyList.fromJson(List<dynamic> json){
    List<Survey> rawData = [];
    for(var item in json){
      rawData.add(Survey.fromJson(item));
    }
    return SurveyList(surveyList: rawData);
  }
}


class Survey extends LangModel {
  late int id;
  late String alias;
  late String titleRu;
  late String titleKz;
  late String titleEn;
  String? titleDe;
  String? titleFr;
  String? titleEs;
  String? titleTr;
  late String urlRu;
  late String urlKz;
  late String urlEn;
  String? urlDe;
  String? urlFr;
  String? urlEs;
  String? urlTr;
  late String createdAt;
  late String updatedAt;

  Survey(
      {
        required this.id,
        required this.alias,
        required this.titleRu,
        required this.titleKz,
        required this.titleEn,
        this.titleDe,
        this.titleFr,
        this.titleEs,
        this.titleTr,
        required this.urlRu,
        required this.urlKz,
        required this.urlEn,
        this.urlDe,
        this.urlFr,
        this.urlEs,
        this.urlTr,
        required this.createdAt,
        required this.updatedAt
      });

  Survey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    titleRu = json['title_ru'];
    titleKz = json['title_kz'];
    titleEn = json['title_en'];
    titleDe = json['title_de'];
    titleFr = json['title_fr'];
    titleEs = json['title_es'];
    titleTr = json['title_tr'];
    urlRu = json['url_ru'];
    urlKz = json['url_kz'];
    urlEn = json['url_en'];
    urlDe = json['url_de'];
    urlFr = json['url_fr'];
    urlEs = json['url_es'];
    urlTr = json['url_tr'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['alias'] = this.alias;
    data['title_ru'] = this.titleRu;
    data['title_kz'] = this.titleKz;
    data['title_en'] = this.titleEn;
    data['title_de'] = this.titleDe;
    data['title_fr'] = this.titleFr;
    data['title_es'] = this.titleEs;
    data['title_tr'] = this.titleTr;
    data['url_ru'] = this.urlRu;
    data['url_kz'] = this.urlKz;
    data['url_en'] = this.urlEn;
    data['url_de'] = this.urlDe;
    data['url_fr'] = this.urlFr;
    data['url_es'] = this.urlEs;
    data['url_tr'] = this.urlTr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}