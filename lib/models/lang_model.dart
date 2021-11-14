import 'package:get/get.dart';


 class LangModel{
   String noTranslation = 'no_translation'.tr;

  get titleRu => this.titleRu;
  get titleEn => this.titleEn;
  get titleKz => this.titleKz;
  get titleDe => this.titleDe;
  get titleFr => this.titleFr;
  get titleEs => this.titleEs;
  get titleTr => this.titleTr;


   get descriptionRu => this.descriptionRu;
   get descriptionEn => this.descriptionEn;
   get descriptionKz => this.descriptionKz;
   get descriptionDe => this.descriptionDe;
   get descriptionFr => this.descriptionFr;
   get descriptionEs => this.descriptionEs;
   get descriptionTr => this.descriptionTr;


  getTitle(){
    var locale = Get.locale!.languageCode;
    noTranslation = 'no_translation'.tr;
    switch(locale){
      case 'ru' :{
        return titleRu;
      }
      break;
      case 'en' :{
        return titleEn;
      }
      break;
      case "kz" :{
        return titleKz;
      }
      break;
      case 'de' :{
        if(this.titleDe != null){
          return titleDe;
        }
        return noTranslation;
      }
      break;
      case 'fr' :{
        if(this.titleFr != null){
          return titleFr;
        }
        else{
          return noTranslation;
        }
      }
      break;
      case "es" :{
        if(this.titleEs != null){
          return titleEs;
        }
        else{
          return noTranslation;
        }
      }
      break;
      case "tr" :{
        if(this.titleTr != null){
          return titleTr;
        }
        else{
          return noTranslation;
        }
      }
      break;

    }
  }


   getDescription(){
     var locale = Get.locale!.languageCode;
     noTranslation = 'no_translation'.tr;
     switch(locale){
       case 'ru' :{
         return descriptionRu;
       }
       break;
       case 'en' :{
         return descriptionEn;
       }
       break;
       case "kz" :{
         return descriptionKz;
       }
       break;
       case 'de' :{
         if(this.descriptionDe != null){
           return descriptionDe;
         }
         return noTranslation;
       }
       break;
       case 'fr' :{
         if(this.descriptionFr != null){
           return descriptionFr;
         }
         else{
           return noTranslation;
         }
       }
       break;
       case "es" :{
         if(this.descriptionEs != null){
           return descriptionEs;
         }
         else{
           return noTranslation;
         }
       }
       break;
       case "tr" :{
         if(this.descriptionTr != null){
           return descriptionTr;
         }
         else{
           return noTranslation;
         }
       }
       break;

     }
   }
}