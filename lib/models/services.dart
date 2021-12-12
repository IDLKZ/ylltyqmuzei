import 'lang_model.dart';

class ListServices{
  late List<Service> listService = [];
  late int currentPage = 1;
  late int lastPage = 1;

  ListServices({required this.listService,required this.currentPage,required this.lastPage});


  factory ListServices.fromJson(Map<String,dynamic>json){
    List<Service> rawListService = [];
    List<dynamic> rawData = json["data"].toList();
    for(var item in rawData){
      rawListService.add(Service.fromJson(item));
    }
    return ListServices(
        currentPage: json["current_page"],
        lastPage: json["last_page"],
        listService: rawListService
    );
  }


}


class Service extends LangModel {
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
  late String pricingRu;
  late String pricingEn;
  late String pricingKz;
  String? pricingDe;
  String? pricingFr;
  String? pricingEs;
  String? pricingTr;
  late String createdAt;
  late String updatedAt;

  Service(
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
        required this.pricingRu,
        required this.pricingEn,
        required this.pricingKz,
        this.pricingDe,
        this.pricingFr,
        this.pricingEs,
        this.pricingTr,
        required this.createdAt,
        required this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
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
    pricingRu = json['pricing_ru'];
    pricingEn = json['pricing_en'];
    pricingKz = json['pricing_kz'];
    pricingDe = json['pricing_de'];
    pricingFr = json['pricing_fr'];
    pricingEs = json['pricing_es'];
    pricingTr = json['pricing_tr'];
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
    data['pricing_ru'] = this.pricingRu;
    data['pricing_en'] = this.pricingEn;
    data['pricing_kz'] = this.pricingKz;
    data['pricing_de'] = this.pricingDe;
    data['pricing_fr'] = this.pricingFr;
    data['pricing_es'] = this.pricingEs;
    data['pricing_tr'] = this.pricingTr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}