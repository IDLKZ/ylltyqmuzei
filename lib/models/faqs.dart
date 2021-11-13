
class FaqList{
  List<Faq> faqs;
  FaqList({required this.faqs});

  factory FaqList.fromJson(List<dynamic> json){
    List<Faq> rawData = [];
    for(var item in json){
      rawData.add(Faq.fromJson(item));
    }
    return FaqList(faqs: rawData);
  }
}

class Faq {
  bool expanded = false;
  late int id;
  late String questionRu;
  late String questionEn;
  late String questionKz;
  String ?questionDe;
  String ?questionFr;
  String ?questionEs;
  String ?questionTr;
  late String answerRu;
  late String answerEn;
  late String answerKz;
  String ?answerDe;
  String ?answerFr;
  String ?answerEs;
  String ?answerTr;
  late String createdAt;
  late String updatedAt;

  Faq(
      {
        required this.expanded,
        required this.id,
        required this.questionRu,
        required this.questionEn,
        required this.questionKz,
         this.questionDe,
         this.questionFr,
         this.questionEs,
         this.questionTr,
        required this.answerRu,
        required this.answerEn,
        required this.answerKz,
         this.answerDe,
         this.answerFr,
         this.answerEs,
         this.answerTr,
        required this.createdAt,
        required this.updatedAt});

  Faq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionRu = json['question_ru'];
    questionEn = json['question_en'];
    questionKz = json['question_kz'];
    questionDe = json['question_de'];
    questionFr = json['question_fr'];
    questionEs = json['question_es'];
    questionTr = json['question_tr'];
    answerRu = json['answer_ru'];
    answerEn = json['answer_en'];
    answerKz = json['answer_kz'];
    answerDe = json['answer_de'];
    answerFr = json['answer_fr'];
    answerEs = json['answer_es'];
    answerTr = json['answer_tr'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_ru'] = this.questionRu;
    data['question_en'] = this.questionEn;
    data['question_kz'] = this.questionKz;
    data['question_de'] = this.questionDe;
    data['question_fr'] = this.questionFr;
    data['question_es'] = this.questionEs;
    data['question_tr'] = this.questionTr;
    data['answer_ru'] = this.answerRu;
    data['answer_en'] = this.answerEn;
    data['answer_kz'] = this.answerKz;
    data['answer_de'] = this.answerDe;
    data['answer_fr'] = this.answerFr;
    data['answer_es'] = this.answerEs;
    data['answer_tr'] = this.answerTr;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
