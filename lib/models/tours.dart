import 'package:welcome/models/lang_model.dart';

class TourList{
  List <Tour> tours;
  TourList({required this.tours});


  factory TourList.fromJson(List<dynamic> json){
    List<Tour> rawData = [];
    for(var item in json){
      rawData.add(Tour.fromJson(item));
    }
    return TourList(tours: rawData);
  }

}






class Tour extends LangModel{
  late int id;
  late int hallId;
  Tour ?prevTour;
  Tour ?nextTour;
  late String image;
  late String panorama;
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
  String? audioRu;
  String? audioKz;
  String? audioEn;
  String? audioDe;
  String? audioFr;
  String? audioEs;
  String? audioTr;
  String? videoRu;
  String? videoKz;
  String? videoEn;
  String? videoDe;
  String? videoFr;
  String? videoEs;
  String? videoTr;
  late String createdAt;
  late String updatedAt;

  Tour(
      {
        required this.id,
        required this.hallId,
        this.prevTour,
        this.nextTour,
        required this.image,
        required this.panorama,
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
        this.audioRu,
        this.audioKz,
        this.audioEn,
        this.audioDe,
        this.audioFr,
        this.audioEs,
        this.audioTr,
        this.videoRu,
        this.videoKz,
        this.videoEn,
        this.videoDe,
        this.videoFr,
        this.videoEs,
        this.videoTr,
        required this.createdAt,
        required this.updatedAt,
        });

  Tour.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hallId = json['hall_id'];
    prevTour = json['prev_tour'] != null  ? Tour.fromJson(json['prev_tour']) : null;
    nextTour = json['next_tour']!= null  ? Tour.fromJson(json['next_tour']) : null;
    image = json['image'];
    panorama = json['panorama'];
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
    audioRu = json['audio_ru'];
    audioKz = json['audio_kz'];
    audioEn = json['audio_en'];
    audioDe = json['audio_de'];
    audioFr = json['audio_fr'];
    audioEs = json['audio_es'];
    audioTr = json['audio_tr'];
    videoRu = json['video_ru'];
    videoKz = json['video_kz'];
    videoEn = json['video_en'];
    videoDe = json['video_de'];
    videoFr = json['video_fr'];
    videoEs = json['video_es'];
    videoTr = json['video_tr'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hall_id'] = this.hallId;
    data['prev_tour'] = this.prevTour;
    data['next_tour'] = this.nextTour;
    data['image'] = this.image;
    data['panorama'] = this.panorama;
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
    data['audio_ru'] = this.audioRu;
    data['audio_kz'] = this.audioKz;
    data['audio_en'] = this.audioEn;
    data['audio_de'] = this.audioDe;
    data['audio_fr'] = this.audioFr;
    data['audio_es'] = this.audioEs;
    data['audio_tr'] = this.audioTr;
    data['video_ru'] = this.videoRu;
    data['video_kz'] = this.videoKz;
    data['video_en'] = this.videoEn;
    data['video_de'] = this.videoDe;
    data['video_fr'] = this.videoFr;
    data['video_es'] = this.videoEs;
    data['video_tr'] = this.videoTr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

