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

  get questionRu => this.questionRu;
  get questionEn => this.questionEn;
  get questionKz => this.questionKz;
  get questionDe => this.questionDe;
  get questionFr => this.questionFr;
  get questionEs => this.questionEs;
  get questionTr => this.questionTr;

  get answerRu => this.answerRu;
  get answerEn => this.answerEn;
  get answerKz => this.answerKz;
  get answerDe => this.answerDe;
  get answerFr => this.answerFr;
  get answerEs => this.answerEs;
  get answerTr => this.answerTr;

  get audioRu => this.audioRu;
  get audioEn => this.audioEn;
  get audioKz => this.audioKz;
  get audioDe => this.audioDe;
  get audioFr => this.audioFr;
  get audioEs => this.audioEs;
  get audioTr => this.audioTr;

  get videoRu => this.videoRu;
  get videoEn => this.videoEn;
  get videoKz => this.videoKz;
  get videoDe => this.videoDe;
  get videoFr => this.videoFr;
  get videoEs => this.videoEs;
  get videoTr => this.videoTr;


   get urlRu => this.urlRu;
   get urlEn => this.urlEn;
   get urlKz => this.urlKz;
   get urlDe => this.urlDe;
   get urlFr => this.urlFr;
   get urlEs => this.urlEs;
   get urlTr => this.urlTr;


  get pricingRu => null;
  get pricingKz => null;
  get pricingEn => null;
  get pricingDe => null;
  get pricingFr => null;
  get pricingEs => null;
  get pricingTr => null;

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
        if(titleDe != null){
          return titleDe;
        }
        return noTranslation;
      }
      break;
      case 'fr' :{
        if(titleFr != null){
          return titleFr;
        }
        else{
          return noTranslation;
        }
      }
      break;
      case "es" :{
        if(titleEs != null){
          return titleEs;
        }
        else{
          return noTranslation;
        }
      }
      break;
      case "tr" :{
        if(titleTr != null){
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
         if(descriptionDe != null){
           return descriptionDe;
         }
         return noTranslation;
       }
       break;
       case 'fr' :{
         if(descriptionFr != null){
           return descriptionFr;
         }
         else{
           return noTranslation;
         }
       }
       break;
       case "es" :{
         if(descriptionEs != null){
           return descriptionEs;
         }
         else{
           return noTranslation;
         }
       }
       break;
       case "tr" :{
         if(descriptionTr != null){
           return descriptionTr;
         }
         else{
           return noTranslation;
         }
       }
       break;

     }
   }

  getQuestion(){
     var locale = Get.locale!.languageCode;
     noTranslation = 'no_translation'.tr;
     switch(locale){
       case 'ru' :{
         return questionRu;
       }
       break;
       case 'en' :{
         return questionEn;
       }
       break;
       case "kz" :{
         return questionKz;
       }
       break;
       case 'de' :{
         if(questionDe != null){
           return questionDe;
         }
         return noTranslation;
       }
       break;
       case 'fr' :{
         if(questionFr != null){
           return questionFr;
         }
         else{
           return noTranslation;
         }
       }
       break;
       case "es" :{
         if(questionEs != null){
           return questionEs;
         }
         else{
           return noTranslation;
         }
       }
       break;
       case "tr" :{
         if(questionTr != null){
           return questionTr;
         }
         else{
           return noTranslation;
         }
       }
       break;

     }
   }

  getAnswer(){
     var locale = Get.locale!.languageCode;
     noTranslation = 'no_translation'.tr;
     switch(locale){
       case 'ru' :{
         return answerRu;
       }
       break;
       case 'en' :{
         return answerEn;
       }
       break;
       case "kz" :{
         return answerKz;
       }
       break;
       case 'de' :{
         if(answerDe != null){
           return answerDe;
         }
         return noTranslation;
       }
       break;
       case 'fr' :{
         if(answerFr != null){
           return answerFr;
         }
         else{
           return noTranslation;
         }
       }
       break;
       case "es" :{
         if(answerEs != null){
           return answerEs;
         }
         else{
           return noTranslation;
         }
       }
       break;
       case "tr" :{
         if(answerTr != null){
           return answerTr;
         }
         else{
           return noTranslation;
         }
       }
       break;

     }
   }

   getAudio(){
     var locale = Get.locale!.languageCode;
     switch(locale){
       case 'ru' :{
         return audioRu;
       }
       break;
       case 'en' :{
         return audioEn;
       }
       break;
       case "kz" :{
         return audioKz;
       }
       break;
       case 'de' :{
         return audioDe;
       }
       break;
       case 'fr' :{
         return audioFr;
       }
       break;
       case "es" :{
         return audioEs;
       }
       break;
       case "tr" :{
         return audioTr;
       }
       break;

     }
   }

   getVideo(){
     var locale = Get.locale!.languageCode;
     switch(locale){
       case 'ru' :{
         return videoRu;
       }
       break;
       case 'en' :{
         return videoEn;
       }
       break;
       case "kz" :{
         return videoKz;
       }
       break;
       case 'de' :{
         return videoDe;
       }
       break;
       case 'fr' :{
         return videoFr;
       }
       break;
       case "es" :{
         return videoEs;
       }
       break;
       case "tr" :{
         return videoTr;
       }
       break;

     }
   }

   getPricing(){
     var locale = Get.locale!.languageCode;
     switch(locale){
       case 'ru' :{
         return pricingRu;
       }
       break;
       case 'en' :{
         return pricingEn;
       }
       break;
       case "kz" :{
         return pricingKz;
       }
       break;
       case 'de' :{
         return pricingDe;
       }
       break;
       case 'fr' :{
         return pricingFr;
       }
       break;
       case "es" :{
         return pricingEs;
       }
       break;
       case "tr" :{
         return pricingTr;
       }
       break;

     }
   }

   getUrl(){
     var locale = Get.locale!.languageCode;
     noTranslation = 'no_translation'.tr;
     switch(locale){
       case 'ru' :{
         return urlRu;
       }
       break;
       case 'en' :{
         return urlEn;
       }
       break;
       case "kz" :{
         return urlKz;
       }
       break;
       case 'de' :{
         if(titleDe != null){
           return urlDe;
         }
         return null;
       }
       break;
       case 'fr' :{
         if(titleFr != null){
           return urlFr;
         }
         else{
           return null;
         }
       }
       break;
       case "es" :{
         if(titleEs != null){
           return urlEs;
         }
         else{
           return null;
         }
       }
       break;
       case "tr" :{
         if(titleTr != null){
           return urlTr;
         }
         else{
           return null;
         }
       }
       break;
       default:{
         return urlRu;
       }

     }
   }
}