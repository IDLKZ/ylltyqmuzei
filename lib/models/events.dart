import 'lang_model.dart';

class ListEvents{
  late List<Event> listEvent = [];
  late int currentPage = 1;
  late int lastPage = 1;

  ListEvents({required this.listEvent,required this.currentPage,required this.lastPage});


  factory ListEvents.fromJson(Map<String,dynamic>json){
    List<Event> rawListEvent = [];
    List<dynamic> rawData = json["data"].toList();
    for(var item in rawData){
      rawListEvent.add(Event.fromJson(item));
    }
    return ListEvents(
        currentPage: json["current_page"],
        lastPage: json["last_page"],
        listEvent: rawListEvent
    );
  }


}


class Event extends LangModel {
  late int id;
  late String image;
  late String alias;
  late String titleRu;
  late String titleKz;
  late String titleEn;
  String? titleDe;
  String? titleFr;
  String? titleEs;
  String? titleTr;
  late String descriptionRu;
  late String descriptionEn;
  late String descriptionKz;
  String? descriptionDe;
  String? descriptionFr;
  String? descriptionEs;
  String? descriptionTr;
  late String dateStart;
  late String dateEnd;
  late String createdAt;
  late String updatedAt;

  Event(
      {
        required this.id,
        required this.image,
        required this.alias,
        required this.titleRu,
        required this.titleKz,
        required this.titleEn,
        this.titleDe,
        this.titleFr,
        this.titleEs,
        this.titleTr,
        required this.descriptionRu,
        required this.descriptionEn,
        required this.descriptionKz,
        this.descriptionDe,
        this.descriptionFr,
        this.descriptionEs,
        this.descriptionTr,
        required this.dateStart,
        required this.dateEnd,
        required this.createdAt,
        required this.updatedAt});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    alias = json['alias'];
    titleRu = json['title_ru'];
    titleKz = json['title_kz'];
    titleEn = json['title_en'];
    titleDe = json['title_de'];
    titleFr = json['title_fr'];
    titleEs = json['title_es'];
    titleTr = json['title_tr'];
    descriptionRu = json['description_ru'];
    descriptionEn = json['description_en'];
    descriptionKz = json['description_kz'];
    descriptionDe = json['description_de'];
    descriptionFr = json['description_fr'];
    descriptionEs = json['description_es'];
    descriptionTr = json['description_tr'];
    dateStart = json["date_start"];
    dateEnd = json["date_end"];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['alias'] = this.alias;
    data['title_ru'] = this.titleRu;
    data['title_kz'] = this.titleKz;
    data['title_en'] = this.titleEn;
    data['title_de'] = this.titleDe;
    data['title_fr'] = this.titleFr;
    data['title_es'] = this.titleEs;
    data['title_tr'] = this.titleTr;
    data['description_ru'] = this.descriptionRu;
    data['description_en'] = this.descriptionEn;
    data['description_kz'] = this.descriptionKz;
    data['description_de'] = this.descriptionDe;
    data['description_fr'] = this.descriptionFr;
    data['description_es'] = this.descriptionEs;
    data['description_tr'] = this.descriptionTr;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}